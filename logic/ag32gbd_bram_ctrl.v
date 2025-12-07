`default_nettype none
`timescale 1ps/1ps

/*
 *  Buffer is always readable (exclusively uses port B)
 *  Port A priority:
 *  Matrix(reg) writing > Matrix reading > Buffer writing
 *  Port A and Port B use different buffers
 *  Request signal triggers on posedge
 */

module ag32gbd_bram_ctrl(
    input               sys_clock,
    input               resetn,

    input               FlipBuffer,

    input               RequestWriteReg,
    input       [7:0]   RegWriteData,
    input       [9:0]   RegWriteAddr,
    output reg          RegWriteDataDone,

    input               RequestWriteBuffer,
    input       [7:0]   BufferWriteData,
    input       [9:0]   BufferWriteOffset,
    output reg          BufferWriteDataDone,

    input               RequestReadReg,
    input       [9:0]   RegReadAddr,
    output reg  [7:0]   RegReadOutput,
    output              RegReadDataReady,


    input               RequestReadBuffer,
    input       [9:0]   BufferReadOffset,
    output reg  [7:0]   BufferReadOutput,
    output              BufferReadDataReady
);

reg [9:0]   bram_addr_a = 10'h3FF;
reg [9:0]   bram_addr_b = 10'h3FF;
reg [7:0]   bram_data_in_a = 8'b0;
reg         bram_rden_a = 1'b0;
reg         bram_rden_b = 1'b0;
reg         bram_wren_a = 1'b0;
wire [7:0]  bram_data_out_a;
wire [7:0]  bram_data_out_b;

block_ram	block_ram_inst (
	.address_a ( bram_addr_a ),
	.address_b ( bram_addr_b ),
	.clock ( sys_clock ),
	.data_a ( bram_data_in_a ),
	.data_b ( 8'b0 ),
	.rden_a ( bram_rden_a ),
	.rden_b ( bram_rden_b ),
	.wren_a ( bram_wren_a ),
	.wren_b ( 1'b0 ),
	.q_a ( bram_data_out_a ),
	.q_b ( bram_data_out_b )
);

localparam [9:0] ImageBufferA = 10'h000;
localparam [9:0] ImageBufferB = 10'h100;

wire BufferSwapped = FlipBuffer;
wire [9:0] BufferPortA = BufferSwapped ? ImageBufferB : ImageBufferA;
wire [9:0] BufferPortB = BufferSwapped ? ImageBufferA : ImageBufferB;

// Port B is easy
reg regBufferReadDataReady;
assign BufferReadDataReady = regBufferReadDataReady;
localparam S_PortB_Idle        = 3'b000;
localparam S_PortB_Reading     = 3'b001;
localparam S_PortB_Output      = 3'b010;
localparam S_PortB_Wait1       = 3'b011;
localparam S_PortB_Wait2       = 3'b100;
reg [2:0] StateB;
always @(negedge resetn or posedge sys_clock) begin
    if (!resetn) begin
        StateB <= S_PortB_Idle;
        bram_addr_b <= 10'h3FF;
        bram_rden_b <= 1'b0;
        BufferReadOutput <= 8'b0;
        regBufferReadDataReady <= 1'b0;
    end else begin
        case (StateB)
            S_PortB_Idle: begin
                bram_rden_b <= 0;
                bram_addr_b <= 10'h3FF;
                regBufferReadDataReady <= 1'b0;
                if (RequestReadBuffer) begin
                    bram_addr_b[9:0] <= {BufferPortB[9:8], BufferReadOffset[7:0]};
                    bram_rden_b <= 1'b1;
                    StateB <= S_PortB_Reading;
                end
            end
            S_PortB_Reading: begin
                StateB <= S_PortB_Output;
            end
            S_PortB_Output: begin
                //BufferReadOutput[7:0] <= {BufferSwapped, BufferReadOffset[6:0]}; //test
                bram_rden_b <= 1'b0;
                StateB <= S_PortB_Wait1;
            end
            S_PortB_Wait1: begin
                BufferReadOutput <= bram_data_out_b;
                regBufferReadDataReady <= 1'b1;
                StateB <= S_PortB_Wait2;
            end
            S_PortB_Wait2: begin
                regBufferReadDataReady <= 1'b0;
                StateB <= S_PortB_Idle;
            end
            default: begin
                StateB <= S_PortB_Idle;
            end
        endcase
    end
end


// Port A is a littel bit complex
reg regRegReadDataReady;
assign RegReadDataReady = regRegReadDataReady;
localparam S_PortA_Idle                = 4'b0000;
localparam S_PortA_RegWrite            = 4'b0001;
localparam S_PortA_RegRead             = 4'b0010;
localparam S_PortA_RegOutput           = 4'b0011;
localparam S_PortA_BufferWrite         = 4'b0100;
localparam S_PortA_Wait                = 4'b1111;
localparam S_PortA_Wait2               = 4'b1011;
localparam S_PortA_Wait_RegWrite       = 4'b1101;
localparam S_PortA_Wait_BufferWrite    = 4'b1110;
reg [3:0] StateA;
reg tick1;
//reg [7:0] debug_BufferWriteCounter = 8'b0;

always @(negedge resetn or posedge sys_clock) begin
    if (!resetn) begin
        StateA <= S_PortA_Idle;
        bram_addr_a <= 10'h3FF;
        bram_data_in_a <= 8'b0;
        bram_rden_a <= 1'b0;
        bram_wren_a <= 1'b0;
        RegReadOutput <= 8'b0;
        regRegReadDataReady <= 1'b0;
        RegWriteDataDone <= 1'b0;
        BufferWriteDataDone <= 1'b0;
        tick1 <= 0;
        //debug_BufferWriteCounter <= 8'b0;
    end else begin
        case (StateA)
            S_PortA_Idle: begin
                bram_rden_a <= 1'b0;
                bram_wren_a <= 1'b0;
                regRegReadDataReady <= 1'b0;
                RegWriteDataDone <= 1'b0;
                BufferWriteDataDone <= 1'b0;
                
                if (RequestWriteReg) begin  // 1st priority
                    bram_addr_a[9:0] <= RegWriteAddr[9:0];
                    bram_data_in_a <= RegWriteData;
                    bram_wren_a <= 1'b1;
                    tick1 <= 0;
                    StateA <= S_PortA_RegWrite;
                end else if (RequestReadReg) begin // 2nd priority
                    bram_addr_a[9:0] <= RegReadAddr[9:0];
                    bram_rden_a <= 1'b1;
                    StateA <= S_PortA_RegRead;
                end else if (RequestWriteBuffer) begin // last
                    bram_addr_a[9:0] <= {BufferPortA[9:8], BufferWriteOffset[7:0]};
                    bram_data_in_a <= BufferWriteData;
                    //bram_data_in_a <= debug_BufferWriteCounter[7:0]; //test
                    //debug_BufferWriteCounter <= debug_BufferWriteCounter + 8'd1;
                    bram_wren_a <= 1'b1;
                    StateA <= S_PortA_BufferWrite;
                end
            end

            S_PortA_RegWrite: begin
                if (!tick1) begin
                    tick1 <= 1'b1;
                    StateA <= S_PortA_RegWrite; // wait 1 cycle
                end else begin
                    tick1 <= 0;
                    StateA <= S_PortA_Wait_RegWrite;
                end
            end
            S_PortA_Wait_RegWrite: begin
                bram_wren_a <= 0;
                RegWriteDataDone <= 1'b1;
                StateA <= S_PortA_Wait;
            end

            S_PortA_RegRead: begin
                StateA <= S_PortA_RegOutput;
            end
            S_PortA_RegOutput: begin
                bram_rden_a <= 0;
                StateA <= S_PortA_Wait2;
            end
            S_PortA_Wait2: begin
                RegReadOutput <= bram_data_out_a;
                regRegReadDataReady <= 1'b1;
                tick1 <= 0;
                StateA <= S_PortA_Wait;
            end

            S_PortA_BufferWrite: begin
                if (!tick1) begin
                    tick1 <= 1'b1;
                    StateA <= S_PortA_Wait_BufferWrite;
                end else begin
                    tick1 <= 0;
                    StateA <= S_PortA_Wait_BufferWrite;
                end
            end
            S_PortA_Wait_BufferWrite: begin
                bram_wren_a <= 0;
                BufferWriteDataDone <= 1'b1;
                StateA <= S_PortA_Wait;
            end

            S_PortA_Wait: begin
                bram_rden_a <= 0;
                bram_wren_a <= 0;
                RegWriteDataDone <= 0;
                BufferWriteDataDone <= 0;
                regRegReadDataReady <= 0;
                StateA <= S_PortA_Idle;
            end

            default: begin
                StateA <= S_PortA_Idle;
            end

        endcase
    end
end

endmodule
`default_nettype wire
