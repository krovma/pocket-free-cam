`default_nettype none
`timescale 1ps/1ps

/*
 * Writing SRAM bank0[000-FFF]
 */

module ag32gbd_ram_write (
    input                 sys_clock,
    input                 bus_clock,
    input                 cart_CLK,
    input                 sys_resetn,

    input                  NewRunReset,
    input                  BlockBufferDataReady,

    output                 Gbd_Writing_Ram,
    output   reg [11:0]    Ram_Writing_Addr_Low,
    output   reg [7:0]     Ram_Writing_Data,
    output   reg           Ram_Writing_nCS,
    output   reg           Ram_Writing_nWE,

    output   reg           RequestReadBuffer,
    output   reg [9:0]     ReadBufferOffset,
    input                  BufferDataReady,
    input    [7:0]         BufferReadResult
);

// reg [1:0] BlockBufferDataReadyEdge;
// always @(negedge sys_resetn or posedge sys_clock) begin
//     if (!sys_resetn) begin
//         BlockBufferDataReadyEdge <= 2'b00;
//     end else begin 
//         BlockBufferDataReadyEdge[1:0] <= {BlockBufferDataReadyEdge[0], BlockBufferDataReady};
//     end
// end


// Each round offset runs from 00-FF
// Total Runs 0??-F??
reg [3:0] round_cnt;
reg [7:0] offset_cnt;

// Buffer layout: [y,x]aabbccdd --> MSB is leftmost pixel
// [0,0]00101111 [0,1]11111000 [0,2].... [0,3]....... [0, 1F]........
// [1,0]00110000 [1,1]00001100 [1,2].... [1,3]....... [1, 1F]........
// [2,0].....
// ....
// [7,0]00101111 [7,1]11100000 [7,2].... [7,3]....... [7, 1F]........

// Writing pattern:
// x from 00 to 1E in step of 2
// y from 0 to E in steo of 2
    // read: iajbkcld = buffer[y<<5 + x]
    // read: menfogph = buffer[y<<5 + x + 1]
    // 
    // write to SRAM [Round_Cnt,offset_cnt] = abcdefgh
    // write to SRAM [Round_Cnt,offset_cnt+1] = ijklmnop
    // offset_cnt += 2

// 4 pixel per byte
// 32 bytes per row: ix = 0 to 1F
// 8 rows per buffer: iy = 0 to 7, offset = 0 to FF: offset = {iy[2:0], ix[4:0]};
// 128 rows per picture: round_cnt = 0 to F, ram_addr = {round_cnt[3:0], offset_cnt[7:0]}; --> {round_cnt[3:0], iy[2:0], ix[4:0]} --> 12 bits


reg [4:0] ix;
reg [2:0] iy;

localparam S_IDLE         = 6'b100000;
localparam S_WORK_READ_0  = 6'b000001;
localparam S_WORK_READ_1  = 6'b000010;
localparam S_WORK_WRITE_0 = 6'b000100;
localparam S_WORK_WRITE_1 = 6'b001000;
localparam S_WORK_WAIT    = 6'b010000;


reg [5:0] State;
reg [7:0] Cache_iajbkcld;
reg [7:0] Cache_menfogph;
reg       bWait1;
reg [2:0] bWait3;
// Data should hold for tDS >= 15ns --> about 1.5 ticks, do 10
// for second write need to wait for tWZ + tDS about 2.5 ticks, still do 10
// actually do a tWLA
reg [3:0] bWaitTDS;

wire nAnyReset = !(!sys_resetn || NewRunReset);

always @(negedge nAnyReset or posedge sys_clock) begin
    if (!nAnyReset) begin
        State <= S_IDLE;
        round_cnt <= 4'b0;
        bWait1 <= 1'b0;
        bWait3 <= 3'b0;
        bWaitTDS <= 3'b0;
        offset_cnt <= 8'b0;
        Ram_Writing_Addr_Low <= 12'b0;
        Ram_Writing_Data <= 8'b0;
        Ram_Writing_nCS <= 1'b1;
        Ram_Writing_nWE <= 1'b1;
        RequestReadBuffer <= 1'b0;
        ReadBufferOffset <= 10'b0;
        ix <= 5'b0;
        iy <= 3'b0;
        Cache_iajbkcld <= 8'b0;
        Cache_menfogph <= 8'b0;
    end else begin
        case (State)
            S_IDLE: begin
                if (BlockBufferDataReady) begin
                    offset_cnt <= 8'b0;
                    ix <= 5'b0;
                    iy <= 3'b0;
                    Ram_Writing_nCS <= 1'b0; // ~CE to LOW, CE2 is pulled up externally
                    Ram_Writing_Addr_Low <= 12'b0;
                    Ram_Writing_Data <= 8'b0;
                    Ram_Writing_nWE <= 1'b1;
                    bWait1 <= 1'b0;
                    bWait3 <= 3'b0;
                    bWaitTDS <= 3'b0;
                    Cache_iajbkcld <= 8'b0;
                    Cache_menfogph <= 8'b0;
                    RequestReadBuffer <= 1'b0;
                    ReadBufferOffset <= 10'b0;
                    // only round_cnt is not reset
                    // transition
                    State <= S_WORK_READ_0;
                end
            end
            S_WORK_READ_0: begin
                ReadBufferOffset <= {iy[2:0], ix[4:1], 1'b0}; // iy << 5 + ix
                RequestReadBuffer <= 1'b1;
                bWait3 <= 3'b0;
                // transition
                State <= S_WORK_READ_1;
            end // 1 tick 
            S_WORK_READ_1: begin
                if (!bWait3[2]) begin
                    bWait3[2:0] <= {bWait3[1:0], 1'b1}; // wait 3 tick
                    bWait1 <= 1'b0;
                end else begin
                    RequestReadBuffer <= 1'b0;
                    if (!bWait1) begin
                        bWait1 <= 1'b1; // wait 1 tick
                    end else begin
                        if (BufferDataReady) begin
                            // first read done
                            //Cache_iajbkcld <= BufferReadResult;
                            //Cache_iajbkcld <= {1'b0, round_cnt[3], 1'b0, round_cnt[2],1'b0, round_cnt[1], 1'b0, round_cnt[0]};
                            //Cache_menfogph <= {1'b0, round_cnt[3], 1'b0, round_cnt[2],1'b0, round_cnt[1], 1'b0, round_cnt[0]};
                            Cache_iajbkcld <= 8'b_00_00_10_11; 
                            Cache_menfogph <= {round_cnt[3], 1'b0, round_cnt[2], 1'b0, round_cnt[1], 1'b1, round_cnt[0], 1'b0}; // abcdefgh = 12h ijklmnop=3[round_cnt]h
                            // prepare second read
                            ReadBufferOffset <= {iy[2:0], ix[4:1], 1'b1}; // iy << 5 + (ix + 1)
                            RequestReadBuffer <= 1'b1;
                            bWait1 <= 1'b0;
                            bWaitTDS <= 3'b0;
                            bWait3 <= 0;
                            // transition
                            State <= S_WORK_WRITE_0;
                        end
                    end
                end
            end // 5 ticks
            S_WORK_WRITE_0: begin
                if (!bWait3[2]) begin
                    bWait3[2:0] <= {bWait3[1:0], 1'b1}; // wait 3 tick
                    bWait1 <= 1'b0;
                    // wait 3 tick, pre rolling tWZ
                    // by pull down we, and feed addr
                    Ram_Writing_nWE <= 1'b0;
                    Ram_Writing_Addr_Low[11:0] <= {round_cnt[3:0], offset_cnt[7:0]};
                end else begin
                    RequestReadBuffer <= 1'b0;
                    if (!bWait1) begin
                        bWait1 <= 1'b1; // wait 1 tick
                    end else begin
                        if (BufferDataReady) begin
                            // second read done
                            //Cache_menfogph <= BufferReadResult;
                            // now we have both cache, write to RAM
                            // menfogph is not latched yet, use BufferReadResult to fill
                            Ram_Writing_Data[7:0] <= { 
                                Cache_iajbkcld  [6], //a
                                Cache_iajbkcld  [4], //b
                                Cache_iajbkcld  [2], //c
                                Cache_iajbkcld  [0], //d
                                Cache_menfogph  [6], //e
                                Cache_menfogph  [4], //f
                                Cache_menfogph  [2], //g
                                Cache_menfogph  [0]  //h
                                //BufferReadResult[6], //e
                                //BufferReadResult[4], //f
                                //BufferReadResult[2], //g
                                //BufferReadResult[0]  //h
                            }; // abcdefgh
                            bWaitTDS <= 0;
                            offset_cnt <= offset_cnt + 8'b1; // +1
                            // transition
                            State <= S_WORK_WRITE_1;
                        end 
                    end 
                end
            end // 5 ticks
            S_WORK_WRITE_1: begin
                if (bWaitTDS != 4'd10) begin
                    bWaitTDS <= bWaitTDS + 4'd1;  // wait for tDS
                    bWait3 <= 0;
                end else begin
                    // done writing one byte
                    Ram_Writing_nWE <= 1'b1; // pull up ~WE, data latched
                    // wait for tWX = 5ns --> 1 tick
                    if (!bWait3[2]) begin
                        bWait3 <= {bWait3[1:0], 1'b1};
                    end else begin
                        Ram_Writing_nWE <= 1'b0;
                        Ram_Writing_Addr_Low[11:0] <= {round_cnt[3:0], offset_cnt[7:0]};
                        Ram_Writing_Data[7:0] <= { 
                            Cache_iajbkcld [7], //i
                            Cache_iajbkcld [5], //j
                            Cache_iajbkcld [3], //k
                            Cache_iajbkcld [1], //l
                            Cache_menfogph [7], //m
                            Cache_menfogph [5], //n
                            Cache_menfogph [3], //o
                            Cache_menfogph [1]  //p
                        }; // ijklmnop
                        bWaitTDS <= 0;
                        bWait1 <= 0;
                        offset_cnt <= offset_cnt + 8'b1; // +1
                        // transit
                        State <= S_WORK_WAIT;
                    end
                end
            end // 5 ticks
            S_WORK_WAIT: begin
                if (bWaitTDS != 4'd10) begin
                    bWaitTDS <= bWaitTDS + 4'd1;  // wait for tDS + tWZ
                    bWait1 <= 0;
                end else begin
                    Ram_Writing_nWE <= 1'b1;
                    if (ix == 5'h1E) begin
                        // end of row
                        ix <= 5'b0;
                        if (iy == 3'd7) begin
                            // end of buffer
                            // all done
                            iy <= 3'd0;
                            Ram_Writing_nCS <= 1'b1; // ~CE to HIGH
                            Ram_Writing_nWE <= 1'b1;
                            Ram_Writing_Addr_Low <= 12'b0;
                            Ram_Writing_Data <= 8'b0;
                            round_cnt <= round_cnt + 4'd1; // round + 1
                            State <= S_IDLE;
                        end else begin
                            iy <= iy + 1'd1;
                            State <= S_WORK_READ_0;
                        end
                    end else begin
                        ix <= ix + 5'd2;
                        State <= S_WORK_READ_0;
                    end
                end
            end // 4 ticks
            // 20 ticks per 2 byte --> 128 * 20 tick per run --> 2560 ticks --> 25600ns @ 100MHz --> 39kHz (0.0256 ms)
            // 1024 xck to finish 1 buffer --> 1024 * (1/500kHz) --> 2048000ns --> 2.048 ms
            default: begin
                State <= S_IDLE;
            end
        endcase
    end
    
end
assign Gbd_Writing_Ram = (State != S_IDLE); //(RwState == S_RW_WORK);

endmodule
`default_nettype wire