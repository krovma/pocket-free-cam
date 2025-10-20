`default_nettype none
`timescale 1ps/1ps
module ag32gbd_ip (
    input              cart_CLK,
    inout       [15:0] cart_a,
    inout       [7:0]  cart_d,
    input              cart_nCS,
    input              cart_nRD,
    output tri0        cart_nRST,
    input              cart_nWR,
    output tri0 [16:13] ram_a,
    output tri0        ram_ce2,
    output tri0        ram_nCS,
    output tri0        ram_nWE,
    output tri0 [22:14] rom_a,
    output tri0        rom_nCS,
    output tri0        sens_load,
    output tri0        sens_read,
    output tri0        sens_reset,
    output tri0        sens_sin,
    output tri0        sens_start,
    output tri0        sens_xck,
    input              sys_clock,
    input              bus_clock,
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

// BEGIN Instantiate ADC
// analog_ip analog_ip_inst(
//     .stop                       (stop),
//     .sys_clock                  (sys_clock),
//     .bus_clock                  (bus_clock),
//     .resetn                     (resetn),
//     .mem_ahb_htrans             (mem_ahb_htrans),
//     .mem_ahb_hready             (mem_ahb_hready),
//     .mem_ahb_hwrite             (mem_ahb_hwrite),
//     .mem_ahb_haddr              (mem_ahb_haddr),
//     .mem_ahb_hsize              (mem_ahb_hsize),
//     .mem_ahb_hburst             (mem_ahb_hburst[2:0]),
//     .mem_ahb_hwdata             (mem_ahb_hwdata[31:0]),
//     .mem_ahb_hreadyout          (mem_ahb_hreadyout),
//     .mem_ahb_hresp              (mem_ahb_hresp),
//     .mem_ahb_hrdata             (mem_ahb_hrdata[31:0]),
//     .slave_ahb_hsel             (slave_ahb_hsel),
//     .slave_ahb_hready           (slave_ahb_hready),
//     .slave_ahb_hreadyout        (slave_ahb_hreadyout),
//     .slave_ahb_htrans           (slave_ahb_htrans[1:0]),
//     .slave_ahb_hsize            (slave_ahb_hsize[2:0]),
//     .slave_ahb_hburst           (slave_ahb_hburst[2:0]),
//     .slave_ahb_hwrite           (slave_ahb_hwrite),
//     .slave_ahb_haddr            (slave_ahb_haddr[31:0]),
//     .slave_ahb_hwdata           (slave_ahb_hwdata[31:0]),
//     .slave_ahb_hresp            (slave_ahb_hresp),
//     .slave_ahb_hrdata           (slave_ahb_hrdata[31:0]),
//     .ext_dma_DMACBREQ           (ext_dma_DMACBREQ[3:0]),
//     .ext_dma_DMACLBREQ          (ext_dma_DMACLBREQ[3:0]),
//     .ext_dma_DMACSREQ           (ext_dma_DMACSREQ[3:0]),
//     .ext_dma_DMACLSREQ          (ext_dma_DMACLSREQ[3:0]),
//     .ext_dma_DMACCLR            (ext_dma_DMACCLR[3:0]),
//     .ext_dma_DMACTC             (ext_dma_DMACTC[3:0]),
//     .local_int                  (local_int[3:0])
// );
// END Instantiate ADC


///////////////////
// bram allocation
//  16byte per tile (8*8), each 8 lines (128*8) has 16 tiles = 256 Bytes
//  000-0FF output image buffer A
//      [000] -> A-H of (0,0)to(7,0)  [001] -> I-P of (0,0)to(7,0)
//      [002] -> A-H of (8,0)to(15,0) [003] -> I-P of (8,0)to(15,0)
//      ...
//      [0FE] -> A-H of (120,8) to (127,8) [0FF] -> I-P of (120,8)(127,8)
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

assign cart_nRST = 1'bz;
assign ram_ce2 = 1'b1;

wire [22:14] output_rom_a;
wire output_rom_nCS;

ag32gbd_rom gbdrom(
    .Cart_a(cart_a),
    .Cart_d(cart_d),
    .Cart_nWR(cart_nWR),
    //.Cart_nCS(cart_nCS),

    .sys_resetn(resetn),
    .sys_clock(sys_clock),

    .Rom_a(output_rom_a),
    .Rom_nCS(output_rom_nCS)
);

assign rom_a = output_rom_a;
assign rom_nCS = output_rom_nCS;

wire [16:13] ram_a_normal;
wire ram_nCS_normal;
wire ram_nWE_normal;
wire [4:0] ram_bank_id;

ag32gbd_ram gbdram(
    .Cart_a(cart_a),
    .Cart_d(cart_d),
    .Cart_nWR(cart_nWR),
    .Cart_nCS(cart_nCS),

    .sys_resetn(resetn),
    .sys_clock(sys_clock),

    .Ram_a(ram_a_normal),
    .Ram_nCS(ram_nCS_normal),
    .Ram_nWE(ram_nWE_normal),

    .Ram_Bank_Id(ram_bank_id)
);

// modules using bram

wire            FlipBuffer;
wire            RequestWriteReg;
wire    [7:0]   RegWriteData;
wire    [9:0]   RegWriteAddr;
wire            RequestWriteBuffer;
wire    [7:0]   BufferWriteData;
wire    [9:0]   BufferWriteOffset;
wire            RequestReadReg;
wire    [9:0]   RegReadAddr;
wire    [7:0]   RegReadOutput;
wire            RegReadDataReady;
wire            RequestReadBuffer;
wire    [9:0]   BufferReadOffset;
wire    [7:0]   BufferReadOutput;
wire            BufferReadDataReady;

ag32gbd_bram_ctrl gbdbram_ctrl(
    .FlipBuffer(FlipBuffer),
    .RequestWriteReg(RequestWriteReg),
    .RegWriteData(RegWriteData),
    .RegWriteAddr(RegWriteAddr),
    .RequestWriteBuffer(RequestWriteBuffer),
    .BufferWriteData(BufferWriteData),
    .BufferWriteOffset(BufferWriteOffset),
    .RequestReadReg(RequestReadReg),
    .RegReadAddr(RegReadAddr),
    .RegReadOutput(RegReadOutput),
    .RegReadDataReady(RegReadDataReady),
    .RequestReadBuffer(RequestReadBuffer),
    .BufferReadOffset(BufferReadOffset),
    .BufferReadOutput(BufferReadOutput),
    .BufferReadDataReady(BufferReadDataReady)
);

wire isGbdWritingRam;
wire [11:0] ram_a_low_writing;
wire [7:0] data_ram_writing;
wire ram_nCS_writing;
wire ram_nWE_writing;

ag32gbd_ram_write gbdram_write(
    .sys_resetn(resetn),
    .sys_clock(sys_clock),
    .cart_CLK(cart_CLK),
    
    .Gbd_Writing_Ram(isGbdWritingRam),
    .Ram_Writing_Addr_Low(ram_a_low_writing),
    .Ram_Writing_Data(data_ram_writing),
    .Ram_Writing_nCS(ram_nCS_writing),
    .Ram_Writing_nWE(ram_nWE_writing),

    .RequestReadBuffer(RequestReadBuffer),
    .ReadBufferOffset(BufferReadOffset),
    .BufferDataReady(BufferReadDataReady),
    .BufferReadResult(BufferReadOutput)
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
    .Cart_a(cart_a),
    .Cart_d(cart_d),
    .Cart_nRD(cart_nRD),
    .Cart_nWR(cart_nWR),
    .Cart_nCS(cart_nCS),
    .sys_resetn(resetn),
    .sys_clock(sys_clock),
    .Ram_bank_id(ram_bank_id),
    .Reg_OutputValid(Reg_OutputValid),
    .Reg_OutputData(Reg_OutputData),
    .Bram_Req_Write(RequestWriteReg),
    .Bram_Addr(RegWriteAddr),
    .Bram_Data(RegWriteData),
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
    .Cart_CLK(cart_CLK),

    .sys_clock(sys_clock),
    .sys_resetn(resetn),

    .Sens_XCK(sens_xck),
    .Cam_Capture_Finish(Flag_CamCaptureFinish)
);

assign sens_read = Flag_CamCapture;
// assign sens_xck = sys_clock;
// assign sens_start = bus_clock;


//output assignments
wire isReadingReg = Reg_OutputValid;
//wire isReadRAM = cart_a[15:13] == 3'b101 && !cart_nRD && !cart_nCS;

assign sens_reset = isReadingReg;
assign cart_a[15:13] = 3'bzzz;
assign cart_a[12:0] = 13'bz_zzzz_zzzz_zzzz;//isGbdWritingRam? {1'b0, ram_a_low_writing[11:0]} : 13'bz_zzzz_zzzz_zzzz;
assign cart_d[7:0] = //8'hzz;
    isGbdWritingRam ? data_ram_writing : (isReadingReg ? Reg_OutputData : 8'hzz);

assign ram_a[16:13] = ram_a_normal; //isGbdWritingRam ? 4'b0 : ram_a_normal;
assign ram_nCS = ram_nCS_normal; //isGbdWritingRam ? ram_nCS_writing :ram_nCS_normal;
assign ram_nWE = ram_nWE_normal; //isGbdWritingRam ? ram_nWE_writing :ram_nWE_normal;

endmodule

`default_nettype wire