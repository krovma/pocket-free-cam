`default_nettype none
`timescale 1ns/1ps
module ag32gbd_ip (
    // MAC-GBD
    input       [15:0] top_A,
    input              top_CLK,
    inout       [7:0]  top_D,
    output tri0 [16:0] top_RAM_A,
    inout       [7:0]  top_RAM_DQ,
    output tri0        top_RAM_nCS,
    output tri0        top_RAM_nRD,
    output tri0        top_RAM_nWE,
    output tri0 [22:14] top_ROM_A,
    output tri0        top_ROM_nCS,
    output tri0        top_SENS_LOAD,
    output tri0        top_SENS_READ,
    output tri0        top_SENS_RESET,
    output tri0        top_SENS_SIN,
    output tri0        top_SENS_START,
    output tri0        top_SENS_XCK,
    input              top_nCS,
    output tri0        top_nLED_RAMIO,
    output tri0        top_nLED_REC,
    input              top_nRD,
    inout              top_nRST,
    input              top_nWR,
    // AG32 BOARD
    input              sys_clock,
    input              bus_clock, // for adc
    input              resetn,
    input              stop,
    input       [1:0]  mem_ahb_htrans,
    input              mem_ahb_hready,
    input              mem_ahb_hwrite,
    input       [31:0] mem_ahb_haddr,
    input       [2:0]  mem_ahb_hsize,
    input       [2:0]  mem_ahb_hburst,
    input       [31:0] mem_ahb_hwdata,
    output tri1        mem_ahb_hreadyout,
    output tri0        mem_ahb_hresp,
    output tri0 [31:0] mem_ahb_hrdata,
    output tri0        slave_ahb_hsel,
    output tri1        slave_ahb_hready,
    input              slave_ahb_hreadyout,
    output tri0 [1:0]  slave_ahb_htrans,
    output tri0 [2:0]  slave_ahb_hsize,
    output tri0 [2:0]  slave_ahb_hburst,
    output tri0        slave_ahb_hwrite,
    output tri0 [31:0] slave_ahb_haddr,
    output tri0 [31:0] slave_ahb_hwdata,
    input              slave_ahb_hresp,
    input       [31:0] slave_ahb_hrdata,
    output tri0 [3:0]  ext_dma_DMACBREQ,
    output tri0 [3:0]  ext_dma_DMACLBREQ,
    output tri0 [3:0]  ext_dma_DMACSREQ,
    output tri0 [3:0]  ext_dma_DMACLSREQ,
    input       [3:0]  ext_dma_DMACCLR,
    input       [3:0]  ext_dma_DMACTC,
    output tri0 [3:0]  local_int
);
assign mem_ahb_hreadyout = 1'b1;
assign slave_ahb_hready  = 1'b1;

///////////////////
// bram allocation
//  2-Bit per Pixel, 4 Pixel per Byte, 128 Pixel per Row => 32 Byte Per Row, 8 Row Per Buffer => 256 Byte Per Buffer [00-FF]
//  000-0FF output image buffer A
//      Row 0 [000] -> [2'b(0,0) 2'b(0,1) 2'b(0,2) 2'b(0,3)]                  [001] -> [2'b(0,4) 2'b(0,5) 2'b(0,6) 2'b(0,7)]
//            [002] -> .....
//      ...                                                                   [01F] -> [2'b(0,124) 2'b(0,125) 2'b(0,126) 2'b(0,127)]
//      Row 1 [020] -> [2'b(1,0) 2'b(1,1) 2'b(1,2) 2'b(1,3)]                  [021] -> [2'b(1,4) 2'b(1,5) 2'b(1,6) 2'b(1,7)]
//      ... Row2 - Row7: 040 060 080 0A0 0C0 0F0
//      End   [0FE] -> [2'b(7,120) 2'b(7,121) 2'b(7,122) 2'b(7,123)]          [0FF] -> [2'b(7,124) 2'b(7,125) 2'b(7,126) 2'b(7,127)]
//  100-1FF output image buffer B
//
//  200-235 compare matrix (cam reg a006-a035 shifted to [200:22F])
//////////////////

// localparam [9:0] CompMat = 10'h200;

// function [9:0] matL_addr;
//     input [1:0] x, y;
//     begin
//         matL_addr = CompMat + (10'd12 * y + x);
//     end
// endfunction

// function [9:0] matM_addr;
//     input [1:0] x, y;
//     begin
//         matM_addr = CompMat + (10'd12 * y + x) + 10'd1;
//     end
// endfunction

// function [9:0] matH_addr;
//     input [1:0] x, y;
//     begin
//         matH_addr = CompMat + (10'd12 * y + x) + 10'd2;
//     end
// endfunction

// reg regRST;
// reg rstDone;
// reg [16:0] reset_counter;
 assign top_nRST = 1'bz;//regRST;
// always @(negedge resetn or posedge bus_clock) begin
//     if (!resetn) begin
//         regRST <= 1'bz;
//         reset_counter <= 0;
//         rstDone <= 0;
//     end else begin
//         if (!rstDone) begin
//             if (reset_counter < 17'h1F000) begin
//                 regRST <= 1'b0;
//                 reset_counter <= reset_counter + 17'd1;
//             end else begin
//                 regRST <= 1'bz;
//                 rstDone <= 1'b1;
//             end
//         end else begin
//             regRST <= 1'bz;
//         end
//     end
// end

wire [22:14] output_rom_a;
wire output_rom_nCS;

ag32gbd_rom gbdrom(
    .Cart_a(top_A),
    .Cart_d(top_D),
    .Cart_nWR(top_nWR),

    .sys_resetn(resetn),
    .sys_clock(sys_clock),

    .Rom_a(output_rom_a),
    .Rom_nCS(output_rom_nCS)
);

assign top_ROM_A = output_rom_a;
assign top_ROM_nCS = output_rom_nCS;

wire [4:0] ram_bank_id;
wire isReadingRAM;
wire isAccessingRam;
wire top_isGbdWritingRam;
wire [7:0] RamOutputData;
wire [7:0] top_gbd_ram_writing_data;

wire [11:0] ram_a_low_writing;
wire ram_nCS_writing;
wire ram_nWE_writing;

ag32gbd_ram gbdram(
    .Cart_a(top_A),
    .Cart_d(top_D),
    .Cart_nWR(top_nWR),
    .Cart_nRD(top_nRD),
    .Cart_nCS(top_nCS),

    .sys_resetn(resetn),
    .sys_clock(sys_clock),

    .is_gbd_writing_ram(top_isGbdWritingRam),

    .in_Writing_dq      (top_gbd_ram_writing_data),
    .in_Writing_Addr_low(ram_a_low_writing),
    .in_Writing_nCS     (ram_nCS_writing),
    .in_Writing_nWE     (ram_nWE_writing),

    .Ram_addr   (top_RAM_A),
    .Ram_nCS    (top_RAM_nCS),
    .Ram_nWE    (top_RAM_nWE),
    .Ram_nRD    (top_RAM_nRD),
    .Ram_dq     (top_RAM_DQ),

    .Ram_output_to_cart (RamOutputData),
    .Ram_Bank_Id(ram_bank_id),
    .is_accessing_ram(isAccessingRam)
);

assign isReadingRAM = isAccessingRam && !top_nRD && !top_nCS;

// modules using bram

wire            FlipBuffer;
wire            RequestWriteReg;
wire    [7:0]   RegWriteData;
wire    [9:0]   RegWriteAddr;
wire            RegWriteDataDone;
wire            RequestWriteBuffer;
wire    [7:0]   BufferWriteData;
wire    [9:0]   BufferWriteOffset;
wire            BufferWriteDataDone;
wire            RequestReadReg;
wire    [9:0]   RegReadAddr;
wire    [7:0]   RegReadOutput;
wire            RegReadDataReady;
wire            RequestReadBuffer;
wire    [9:0]   BufferReadOffset;
wire    [7:0]   BufferReadOutput;
wire            BufferReadDataReady;

ag32gbd_bram_ctrl gbdbram_ctrl(
    .sys_clock(sys_clock),
    .resetn(resetn),

    .FlipBuffer(FlipBuffer),

    .RequestWriteReg(RequestWriteReg),
    .RegWriteData(RegWriteData),
    .RegWriteAddr(RegWriteAddr),
    .RegWriteDataDone(RegWriteDataDone),
    
    .RequestWriteBuffer(RequestWriteBuffer),
    .BufferWriteData(BufferWriteData),
    .BufferWriteOffset(BufferWriteOffset),
    .BufferWriteDataDone(BufferWriteDataDone),
    
    .RequestReadReg(RequestReadReg),
    .RegReadAddr(RegReadAddr),
    .RegReadOutput(RegReadOutput),
    .RegReadDataReady(RegReadDataReady),
    
    .RequestReadBuffer(RequestReadBuffer),
    .BufferReadOffset(BufferReadOffset),
    .BufferReadOutput(BufferReadOutput),
    .BufferReadDataReady(BufferReadDataReady)
);


wire topBlockDataReady;
wire top_ramNewRunReset;

ag32gbd_ram_write gbdram_write(
    .sys_resetn(resetn),
    .sys_clock(sys_clock),
    .cart_CLK(top_CLK),

    .NewRunReset(top_ramNewRunReset),
    .BlockDataReady(topBlockDataReady),

    .Gbd_Writing_Ram(top_isGbdWritingRam),
    .Ram_Writing_Addr_Low(ram_a_low_writing),
    .Ram_Writing_Data(top_gbd_ram_writing_data),
    .Ram_Writing_nCS(ram_nCS_writing),
    .Ram_Writing_nWE(ram_nWE_writing),

    .RequestReadBuffer(RequestReadBuffer),
    .ReadBufferOffset(BufferReadOffset),
    .BufferReadResult(BufferReadOutput),
    .BufferDataReady(BufferReadDataReady)
);

wire                 Reg_OutputValid;
wire   [7:0]         Reg_OutputData;

wire   [7:0]         Reg_A000;
wire   [7:0]         Reg_A001;
wire   [7:0]         Reg_A002;
wire   [7:0]         Reg_A003;
wire   [7:0]         Reg_A004;
wire   [7:0]         Reg_A005;

wire                 Flag_CamCapture;
wire                 Flag_CamCaptureFinish;

ag32gbd_reg gbdreg(
    .Cart_a(top_A),
    .Cart_d(top_D),
    .Cart_nRD(top_nRD),
    .Cart_nWR(top_nWR),
    .Cart_nCS(top_nCS),

    .sys_resetn(resetn),
    .sys_clock(sys_clock),
    .Ram_bank_id(ram_bank_id),
    .Reg_OutputValid(Reg_OutputValid),
    .Reg_OutputData(Reg_OutputData),
    .Bram_Req_Write(RequestWriteReg),
    .Bram_Addr(RegWriteAddr),
    .Bram_Data(RegWriteData),
    .Bram_WriteRegDone(RegWriteDataDone),

    .Reg_A000(Reg_A000),
    .Reg_A001(Reg_A001),
    .Reg_A002(Reg_A002),
    .Reg_A003(Reg_A003),
    .Reg_A004(Reg_A004),
    .Reg_A005(Reg_A005),
    .Cam_Capture(Flag_CamCapture),

    .Sig_CamCaptureFinish(Flag_CamCaptureFinish)
);

ag32gbd_cam gbdcam(
    .Cam_Capture(Flag_CamCapture),
    .Cart_CLK(top_CLK),
    .Reg_A000(Reg_A000),
    .Reg_A001(Reg_A001),
    .Reg_A002(Reg_A002),
    .Reg_A003(Reg_A003),
    .Reg_A004(Reg_A004),
    .Reg_A005(Reg_A005),

    .sys_clock(sys_clock),
    .adc_clock(bus_clock),
    .sys_resetn(resetn),

    .Sens_START(top_SENS_START),
    .Sens_SIN(top_SENS_SIN),
    .Sens_LOAD(top_SENS_LOAD),
    .Sens_RESET(top_SENS_RESET),
    .Sens_XCK(top_SENS_XCK),
    .Sens_READ(top_SENS_READ),
    .Cam_Capture_Finish(Flag_CamCaptureFinish),

    .RequestReadReg(RequestReadReg),
    .RegReadAddr(RegReadAddr),
    .RegReadOutput(RegReadOutput),
    .RegReadDataReady(RegReadDataReady),

    .FlipBuffer(FlipBuffer),
    .BufferWriteData(BufferWriteData),
    .BufferWriteOffset(BufferWriteOffset),
    .RequestWriteBuffer(RequestWriteBuffer),
    .BufferWriteDataDone(BufferWriteDataDone),

    .isGbdWritingRam(top_isGbdWritingRam),
    .RamNewRun(top_ramNewRunReset),
    .BlockBufferDataReady(topBlockDataReady),
);


//clock debug
reg sys_clock_x10;
reg [2:0] clk_counter;
always @(posedge sys_clock or negedge resetn) begin
    if (!resetn) begin
        sys_clock_x10 <= 0;
        clk_counter <= 0;
    end else begin
        if (clk_counter == 3'd4) begin
            sys_clock_x10 <= ~sys_clock_x10;
            clk_counter <= 0;
        end else begin
            clk_counter <= clk_counter + 3'd1;
        end
    end
end

assign top_nLED_REC = ~Flag_CamCapture;
assign top_nLED_RAMIO = 1'b1;

//output assignments
wire isReadingReg = Reg_OutputValid;
//wire isReadRAM = cart_a[15:13] == 3'b101 && !cart_nRD && !cart_nCS;

assign top_D[7:0] = (isReadingReg ? Reg_OutputData[7:0] : (isReadingRAM ? RamOutputData[7:0] : 8'bz));

endmodule

`default_nettype wire