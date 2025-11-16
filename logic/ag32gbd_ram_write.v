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

    output   reg           Gbd_Writing_Ram,
    output   reg [11:0]    Ram_Writing_Addr_Low,
    output   reg [7:0]     Ram_Writing_Data,
    output   reg           Ram_Writing_nCS,
    output   reg           Ram_Writing_nWE,

    output   reg           RequestReadBuffer,
    output   reg [9:0]     ReadBufferOffset,
    input                  BufferDataReady,
    input                  BufferReadResult
);

reg [1:0] BlockBufferDataReadyEdge;
always @(negedge sys_resetn or posedge sys_clock) begin
    if (!sys_resetn) begin
        BlockBufferDataReadyEdge <= 2'b00;
    end else begin 
        BlockBufferDataReadyEdge[1:0] <= {BlockBufferDataReadyEdge[0], BlockBufferDataReady};
    end
end


// Each round offset runs from 00-FF
// Total Runs 0??-F??
reg [3:0] round_cnt;
reg [7:0] offset_cnt;

// Buffer layout: [yx]aabbccdd --> MSB is leftmost pixel
// [00]00101111 [01]11111000 [02].... [03]....... [1F]........
// [20]00110000 [21]00001100 [22].... [23]....... [3F]........
// [40].....
// ....
// [E0]00101111 [E1]11100000 [E2].... [E3]....... [FF]........

// Writing pattern:
// x from 00 to 1E in step of 2
// y from 0 to E in steo of 2
    // read: iajbkcld = buffer[y<<4 + x]
    // read: menfogph = buffer[y<<4 + x + 1]
    // 
    // write to SRAM [Round_Cnt,offset_cnt] = abcdefgh
    // write to SRAM [Round_Cnt,offset_cnt+1] = ijklmnop
    // offset_cnd += 2

localparam S_RW_IDLE = 2'b01;
localparam S_RW_WORK = 2'b10;

reg [7:0] ix;
reg [3:0] iy;

localparam S_WORK_READ_0  = 4'b0001;
localparam S_WORK_READ_1  = 4'b0010;
localparam S_WORK_WRITE_0 = 4'b0100;
localparam S_WORK_WRITE_1 = 4'b1000;

always @(negedge sys_resetn or posedge sys_clock) begin
    if (!sys_resetn) begin
        Gbd_Writing_Ram <= 1'b0;
        Ram_Writing_Addr_Low <= 12'bz;
        Ram_Writing_Data <= 8'bz;
        Ram_Writing_nCS <= 1'b1;
        Ram_Writing_nWE <= 1'b1;
        RequestReadBuffer <= 1'b0;
        ReadBufferOffset <= 10'b0;
    end else if (!NewRunReset) begin  // local reset
        Gbd_Writing_Ram <= 1'b0;
        Ram_Writing_Addr_Low <= 12'bz;
        Ram_Writing_Data <= 8'bz;
        Ram_Writing_nCS <= 1'b1;
        Ram_Writing_nWE <= 1'b1;
        RequestReadBuffer <= 1'b0;
        ReadBufferOffset <= 10'b0;
        round_cnt <= 4'b0;
        offset_cnt <= 8'b0;
        ix <= 8'b0;
        iy <= 4'b0;
    end else begin

    end
end

endmodule
`default_nettype wire