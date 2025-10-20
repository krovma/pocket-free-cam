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

    input               RequestWriteBuffer,
    input       [7:0]   BufferWriteData,
    input       [9:0]   BufferWriteOffset,

    input               RequestReadReg,
    input       [9:0]   RegReadAddr,
    output reg  [7:0]   RegReadOutput,
    output reg          RegReadDataReady,

    input               RequestReadBuffer,
    input       [9:0]   BufferReadOffset,
    output reg  [7:0]   BufferReadOutput,
    output reg          BufferReadDataReady
);

reg [9:0]   bram_addr_a = 10'h3FF;
reg [9:0]   bram_addr_b = 10'h3FF;
reg [7:0]   bram_data_in_a = 8'b0;
reg [7:0]   bram_data_in_b = 8'b0;
reg         bram_rden_a = 1'b0;
reg         bram_rden_b = 1'b0;
reg         bram_wren_a = 1'b0;
reg         bram_wren_b = 1'b0;
wire [7:0]  bram_data_out_a;
wire [7:0]  bram_data_out_b;

block_ram	block_ram_inst (
	.address_a ( bram_addr_a ),
	.address_b ( bram_addr_b ),
	.clock ( sys_clock ),
	.data_a ( bram_data_in_a ),
	.data_b ( bram_data_in_b ),
	.rden_a ( bram_rden_a ),
	.rden_b ( bram_rden_b ),
	.wren_a ( bram_wren_a ),
	.wren_b ( bram_wren_b ),
	.q_a ( bram_data_out_a ),
	.q_b ( bram_data_out_b )
);

localparam [9:0] ImageBufferA = 10'h000;
localparam [9:0] ImageBufferB = 10'h100;

reg [2:0] FlipBufferEdge;
reg [2:0] RequestWriteRegEdge;
reg [2:0] RequestWriteBufferEdge;
reg [2:0] RequestReadRegEdge;
reg [2:0] RequestReadBufferEdge;

reg WaitRegRead;
reg WaitBufferRead;

reg BufferSwapped;

wire [9:0] BufferPortA = BufferSwapped ? ImageBufferB : ImageBufferA;
wire [9:0] BufferPortB = BufferSwapped ? ImageBufferA : ImageBufferB;


always @(posedge sys_clock) begin
    if (!resetn) begin
        FlipBufferEdge <= 3'bx;
        RequestWriteRegEdge <= 3'b0;
        RequestWriteBufferEdge <= 3'b0;
        RequestReadRegEdge <= 3'b0;
        RequestReadBufferEdge <= 3'b0;
    end else begin
        FlipBufferEdge[2] <= FlipBufferEdge[1];
        FlipBufferEdge[1] <= FlipBufferEdge[0];
        FlipBufferEdge[0] <= FlipBuffer;
        
        RequestWriteRegEdge[2] <= RequestWriteRegEdge[1];
        RequestWriteRegEdge[1] <= RequestWriteRegEdge[0];
        RequestWriteRegEdge[0] <= RequestWriteReg;

        RequestWriteBufferEdge[2] <= RequestWriteBufferEdge[1];
        RequestWriteBufferEdge[1] <= RequestWriteBufferEdge[0];
        RequestWriteBufferEdge[0] <= RequestWriteBuffer;

        RequestReadRegEdge[2] <= RequestReadRegEdge[1];
        RequestReadRegEdge[1] <= RequestReadRegEdge[0];
        RequestReadRegEdge[0] <= RequestReadReg;

        RequestReadBufferEdge[2] <= RequestReadBufferEdge[1];
        RequestReadBufferEdge[1] <= RequestReadBufferEdge[0];
        RequestReadBufferEdge[0] <= RequestReadBuffer;
    end
end

always @(posedge sys_clock) begin
    if (!resetn) begin
        bram_addr_a <= 10'h3FF;
        bram_addr_b <= 10'h3FF;
        bram_data_in_a <= 8'b0;
        bram_data_in_b <= 8'b0;
        bram_rden_a <= 1'b0;
        bram_rden_b <= 1'b0;
        bram_wren_a <= 1'b0;
        bram_wren_b <= 1'b0;

        RegReadOutput[7:0] <= 8'b0;
        RegReadDataReady <= 1'b0;
        BufferReadOutput[7:0] <= 8'b0;
        BufferReadDataReady <= 1'b0;
        WaitRegRead <= 1'b0;
        WaitBufferRead <= 1'b0;

        BufferSwapped <= 1'b0;
    end else begin

        if (FlipBufferEdge[2] != FlipBufferEdge[1]) begin
            BufferSwapped <= ~BufferSwapped;
        end

        if (WaitBufferRead) begin
            BufferReadOutput <= bram_data_out_b;
            WaitBufferRead <= 1'b0;
            BufferReadDataReady <= 1'b1;
        end else if (RequestReadBufferEdge[2] && !RequestReadBufferEdge[1]) begin
            bram_rden_b <= 1'b1;
            bram_wren_b <= 1'b0;
            bram_addr_b <= BufferPortB + BufferReadOffset;
            WaitBufferRead <= 1'b1;
            BufferReadDataReady <= 1'b0;
        end

        if (RequestWriteRegEdge[2] && RequestReadRegEdge[1]) begin
            bram_rden_a <= 1'b0;
            bram_wren_a <= 1'b1;
            bram_addr_a <= RegWriteAddr;
            bram_data_in_a <= RegWriteData;
        end else if (WaitRegRead) begin
            RegReadOutput <= bram_data_out_a;
            WaitRegRead <= 1'b0;
            RegReadDataReady <= 1'b1;
        end else if (RequestReadRegEdge[2] && RequestReadRegEdge[1]) begin
            bram_rden_a <= 1'b1;
            bram_wren_a <= 1'b0;
            bram_addr_a <= RegReadAddr;
            WaitRegRead <= 1'b1;
            RegReadDataReady <= 1'b0;
        end else if (RequestWriteBufferEdge[2] && RequestWriteBufferEdge[1]) begin
            bram_rden_a <= 1'b0;
            bram_wren_a <= 1'b1;
            bram_addr_a <= BufferPortA + BufferWriteOffset;
            bram_data_in_a <= BufferWriteData;
        end

    end // if (!resetn) else
end // always

endmodule

`default_nettype wire
