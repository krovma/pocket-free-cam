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
    //output              RegReadDataReady,

    input               RequestReadBuffer,
    input       [9:0]   BufferReadOffset,
    output reg  [7:0]   BufferReadOutput
    //output              BufferReadDataReady
);

reg [9:0]   bram_addr_a = 10'h3FF;
reg [9:0]   bram_addr_b = 10'h3FF;
reg [7:0]   bram_data_in_a = 8'b0;
//reg [7:0]   bram_data_in_b = 8'b0;
reg         bram_rden_a = 1'b0;
reg         bram_rden_b = 1'b0;
reg         bram_wren_a = 1'b0;
reg         bram_wren_b = 1'b0;
wire [7:0]  bram_data_out_a;
wire [7:0]  bram_data_out_b;

// reg regBufferReadDataReady;
// reg regRegReadDataReady;

block_ram	block_ram_inst (
	.address_a ( bram_addr_a ),
	.address_b ( bram_addr_b ),
	.clock ( sys_clock ),
	.data_a ( bram_data_in_a ),
	.data_b ( 8'b0 ),
	.rden_a ( bram_rden_a ),
	.rden_b ( bram_rden_b ),
	.wren_a ( bram_wren_a ),
	.wren_b ( bram_wren_b ),
	.q_a ( bram_data_out_a ),
	.q_b ( bram_data_out_b )
);

localparam [9:0] ImageBufferA = 10'h000;
localparam [9:0] ImageBufferB = 10'h100;

// reg [1:0] RequestWriteRegEdge;
// reg [1:0] RequestWriteBufferEdge;
// reg [1:0] RequestReadRegEdge;
// reg [1:0] RequestReadBufferEdge;

reg [9:0] FlipBufferDelay;
// reg [19:0] Last20ReadReg;
// reg [19:0] Last20ReadBuffer;

reg WaitRegRead;
reg WaitBufferRead;

wire BufferSwapped;
always @(posedge sys_clock or negedge resetn) begin
    if (!resetn) begin
        FlipBufferDelay <= 10'b0;
    end else begin
        FlipBufferDelay <= {FlipBufferDelay[8:0], FlipBuffer};
    end
end
assign BufferSwapped = FlipBufferDelay[9];

wire [9:0] BufferPortA = BufferSwapped ? ImageBufferB : ImageBufferA;
wire [9:0] BufferPortB = BufferSwapped ? ImageBufferA : ImageBufferB;


// always @(posedge sys_clock or negedge resetn) begin
//     if (!resetn) begin
//         RequestWriteRegEdge     <= 2'b0;
//         RequestWriteBufferEdge  <= 2'b0;
//         RequestReadRegEdge      <= 2'b0;
//         RequestReadBufferEdge   <= 2'b0;
//         Last20ReadReg <= 0;
//         Last20ReadBuffer <= 0;
//     end else begin
//         RequestWriteRegEdge    <= {RequestWriteRegEdge[0], RequestWriteReg};
//         RequestWriteBufferEdge <= {RequestWriteBufferEdge[0], RequestWriteBuffer};
//         RequestReadRegEdge     <= {RequestReadRegEdge[0], RequestReadReg};
//         RequestReadBufferEdge  <= {RequestReadBufferEdge[0], RequestReadBuffer};
//         Last20ReadReg[19:0]    <= {Last20ReadReg[18:0], RequestReadReg};
//         Last20ReadBuffer[19:0] <= {Last20ReadBuffer[18:0], RequestReadBuffer};
//     end
// end

always @(posedge sys_clock or negedge resetn) begin
    if (!resetn) begin
        bram_addr_a <= 10'h3FF;
        bram_addr_b <= 10'h3FF;
        bram_data_in_a <= 8'b0;
        //bram_data_in_b <= 8'b0;
        bram_rden_a <= 1'b0;
        bram_rden_b <= 1'b0;
        bram_wren_a <= 1'b0;
        bram_wren_b <= 1'b0;

        RegReadOutput[7:0] <= 8'b0;
        //regRegReadDataReady <= 1'b0;
        BufferReadOutput[7:0] <= 8'b0;
        //regBufferReadDataReady <= 1'b0;
        WaitRegRead <= 1'b0;
        WaitBufferRead <= 1'b0;

    end else begin

        // if (!(|Last20ReadReg[19:0]))
        //     regRegReadDataReady <= 0;
        // if (!(|Last20ReadBuffer[19:0]))
        //     regBufferReadDataReady <= 0;

        if (WaitBufferRead) begin
            BufferReadOutput <= bram_data_out_b;
            WaitBufferRead <= 1'b0;
            //regBufferReadDataReady <= 1'b1;
        end else if (RequestReadBuffer) begin
            bram_rden_b <= 1'b1;
            bram_wren_b <= 1'b0;
            bram_addr_b <= BufferPortB + BufferReadOffset;
            WaitBufferRead <= 1'b1;
            //regBufferReadDataReady <= 1'b0;
        end else begin
            bram_rden_b <= 1'b0;
            bram_wren_b <= 1'b0;
        end

        if (RequestWriteReg) begin
            bram_rden_a <= 1'b0;
            bram_wren_a <= 1'b1;
            bram_addr_a <= RegWriteAddr;
            bram_data_in_a <= RegWriteData;
        end else if (WaitRegRead) begin
            RegReadOutput <= bram_data_out_a;
            WaitRegRead <= 1'b0;
            //regRegReadDataReady <= 1'b1;
        end else if (RequestReadReg) begin
            bram_rden_a <= 1'b1;
            bram_wren_a <= 1'b0;
            bram_addr_a <= RegReadAddr;
            WaitRegRead <= 1'b1;
            //regRegReadDataReady <= 1'b0;
        end else if (RequestWriteBuffer) begin
            bram_rden_a <= 1'b0;
            bram_wren_a <= 1'b1;
            bram_addr_a <= BufferPortA + BufferWriteOffset;
            bram_data_in_a <= BufferWriteData;
        end else begin
            bram_rden_a <= 1'b0;
            bram_wren_a <= 1'b0;
        end

    end // if (!resetn) else
end // always

//reg [3:0] holdRegBufferReadDataReady;
//reg [3:0] holdRegRegReadDataReady;

//always @(posedge sys_clock or negedge resetn) begin
//     if (!resetn) begin
//         holdRegBufferReadDataReady <= 4'b0;
//         //holdRegRegReadDataReady <= 4'b0;
//     end else begin
//         holdRegBufferReadDataReady <= {holdRegBufferReadDataReady[2:0], regBufferReadDataReady};
//         //holdRegRegReadDataReady <= {holdRegRegReadDataReady[2:0], regRegReadDataReady};
//     end 
// end

// assign BufferReadDataReady = |holdRegBufferReadDataReady[3:0];
// // assign RegReadDataReady = |holdRegRegReadDataReady[3:0];
// assign RegReadDataReady = regRegReadDataReady;

endmodule
`default_nettype wire
