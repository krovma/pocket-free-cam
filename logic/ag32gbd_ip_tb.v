`timescale 1ns/1ps

module ag32gbd_ip_tb;

reg           i_resetn    = 1;
reg           i_sys_clock = 1;

wire          i_cart_clk;
reg   [15:0]  i_cart_a;
wire  [7:0]   i_cart_d;



reg           i_cart_nCS = 1;
reg           i_cart_nRD = 1;
wire          i_cart_nRST;
reg           i_cart_nWR = 1;
wire  [16:13] i_ram_a;
wire          i_ram_ce2;
wire          i_ram_nCS;
wire          i_ram_nWE;
wire  [22:14] i_rom_a;
wire          i_rom_nCS;
wire          i_sens_load;
wire          i_sens_read;
wire          i_sens_reset;
wire          i_sens_sin;
wire          i_sens_start;
wire          i_sens_xck;

// wire         i_slave_ahb_hsel;
// wire         i_slave_ahb_hready;
// reg          i_slave_ahb_hreadyout = 1;
// wire  [1:0]  i_slave_ahb_htrans;
// wire  [2:0]  i_slave_ahb_hsize;
// wire  [2:0]  i_slave_ahb_hburst;
// wire         i_slave_ahb_hwrite;
// wire  [31:0] i_slave_ahb_haddr;
// wire  [31:0] i_slave_ahb_hwdata;
// reg          i_slave_ahb_hresp  = 0;
// reg [31:0]   i_slave_ahb_hrdata = 0;

//debug
// wire  i_OUT_cam_reg_selected;
// wire  i_OUT_is_ram_addr;
// wire  i_OUT_is_capturing;
//wire  [7:0] i_OUT_data_output_r;
// wire [4:0] i_OUT_ram_bank_id;
// wire i_OUT_cam_reg_write_clk;
// wire [2:0] i_OUT_a000;
// wire [31:0] i_OUT_xck_count;

//wire           i_debug44;
wire           i_dbgout_xck;
wire           i_dbgout_nWR;

  wire  [7:0] i_debug_ROM_BANK;
  wire  [7:0] i_debug_RAM_BANK;
wire [7:0]      i_debug_bram_output;

ag32gbd_ip gbd_inst(
  //////////////////// MAC-GBD
  .cart_CLK   (i_cart_clk),
  .cart_a     (i_cart_a),
  .cart_d     (i_cart_d),
  .cart_nCS   (i_cart_nCS),
  .cart_nRD   (i_cart_nRD),
  .cart_nRST  (i_cart_nRST),
  .cart_nWR   (i_cart_nWR),
  .ram_a      (i_ram_a),
  .ram_ce2    (i_ram_ce2),
  .ram_nCS    (i_ram_nCS),
  .ram_nWE    (i_ram_nWE),
  .rom_a      (i_rom_a),
  .rom_nCS    (i_rom_nCS),
  .dbgout6 (i_dbgout_xck),
  .dbgout8 (i_dbgout_nWR),
  .sens_load  (i_sens_load),
  .sens_read  (i_sens_read),
  .sens_reset (i_sens_reset),
  .sens_sin   (i_sens_sin),
  .sens_start (i_sens_start),
  .sens_xck   (i_sens_xck),
  /////////////////// AG32 Clock and AHB
  .sys_clock  (i_sys_clock),
  //.bus_clock,
  .resetn     (i_resetn)
  //.stop,
  //.mem_ahb_htrans,
  //.mem_ahb_hready,
  //.mem_ahb_hwrite,
  //.mem_ahb_haddr,
  //.mem_ahb_hsize,
  //.mem_ahb_hburst,
  //.mem_ahb_hwdata,
  //.mem_ahb_hreadyout,
  //.mem_ahb_hresp,
  //.mem_ahb_hrdata,
  //.slave_ahb_hsel       (i_slave_ahb_hsel),
  //.slave_ahb_hready     (i_slave_ahb_hready),
  //.slave_ahb_hreadyout  (i_slave_ahb_hreadyout),
  //.slave_ahb_htrans     (i_slave_ahb_htrans),
  //.slave_ahb_hsize      (i_slave_ahb_hsize),
  //.slave_ahb_hburst     (i_slave_ahb_hburst),
  //.slave_ahb_hwrite     (i_slave_ahb_hwrite),
  //.slave_ahb_haddr      (i_slave_ahb_haddr),
  //.slave_ahb_hwdata     (i_slave_ahb_hwdata),
  //.slave_ahb_hresp      (i_slave_ahb_hresp),
  //.slave_ahb_hrdata     (i_slave_ahb_hrdata)
  // .ext_dma_DMACBREQ,
  // .ext_dma_DMACLBREQ,
  // .ext_dma_DMACSREQ,
  // .ext_dma_DMACLSREQ,
  // .ext_dma_DMACCLR,
  // .ext_dma_DMACTC,
  // .local_int
  // , .OUT_cam_reg_selected (i_OUT_cam_reg_selected)
  // , .OUT_is_ram_addr      (i_OUT_is_ram_addr)
  // , .OUT_is_capturing     (i_OUT_is_capturing)
  //, .OUT_data_output_r    (i_OUT_data_output_r)
  // , .OUT_ram_bank_id      (i_OUT_ram_bank_id)
  // , .OUT_cam_reg_write_clk (i_OUT_cam_reg_write_clk)
  // , .OUT_a000 (i_OUT_a000)
  // , .OUT_xck_count (i_OUT_xck_count)
  , .debug_RAM_BANK(i_debug_RAM_BANK)
  , .debug_ROM_BANK(i_debug_ROM_BANK)
  , .debug_bram_output(i_debug_bram_output)
);

reg gb_clk = 0;
always begin
  gb_clk = ~gb_clk;
  #250;
end

always begin
  i_sys_clock = ~i_sys_clock;
  #5;
end

reg gb_clk_div2 = 0;
always @(posedge gb_clk) begin
  gb_clk_div2 = ~gb_clk_div2;
end

reg gb_clk_div4 = 0;
always @(posedge gb_clk_div2) begin
  gb_clk_div4 = ~gb_clk_div4;
end

assign i_cart_clk = gb_clk_div4;

integer cnt_ready;
always @(negedge i_resetn or posedge i_sys_clock) begin
    if (!i_resetn) begin
        cnt_ready = 0;
    end
    else begin
        #2;
        if (cnt_ready == 15) begin
            cnt_ready <= 0;
        end
        else begin
            cnt_ready <= cnt_ready+1;
        end
    end
end

reg [7:0] cart_d_r = 8'b0;
reg is_writing = 1'b1;
assign i_cart_d[7:0] = is_writing ? cart_d_r[7:0] : 8'hz;

reg [7:0] d_output = 8'b0;

// 1CLK(4MHz) = 250ns;
// 1PHI(1MHz) = 1000ns;
// 1Xck(500KHz) = 2000ns;
// 100Xck = 200000 ns;

task writeReg;
  input [15:0] address;
  input [7:0] data;
  begin
    i_cart_nRD = 0;
    i_cart_nCS = 1;
    i_cart_nWR = 1;
    #125;
    is_writing = 1;
    i_cart_nRD = 1;
    i_cart_a = address;
    #125;

    i_cart_a[15] = 0;
    #250;

    i_cart_nWR = 0;
    cart_d_r = data;
    #250;

    #125;
    i_cart_nWR = 1;
    #125;
    i_cart_nRD = 0;
    is_writing = 0;
  end
endtask

task writeRamCam;
  input [15:0] address;
  input [7:0] data;
  begin
    i_cart_nRD = 0;
    i_cart_nCS = 1;
    i_cart_nWR = 1;
    #125;
    is_writing = 1;
    i_cart_nRD = 1;
    i_cart_a = address;
    #125;

    i_cart_nCS = 0;
    #250;

    i_cart_nWR = 0;
    cart_d_r = data;
    #250;

    #125;
    i_cart_nWR = 1;
    #125;
    i_cart_nCS = 1;
    i_cart_nRD = 0;
    is_writing = 0;
  end
endtask

task readRam;
  input [15:0] address;
  begin
    i_cart_nRD = 0;
    i_cart_nWR = 1;
    is_writing = 0;
    i_cart_nCS = 1;
    #125;
    i_cart_a = address;
    #125;
    i_cart_nCS = 0;
    #250;
    #250;
    d_output = i_cart_d;
    #250;
  end
endtask

task readRom;
  input [15:0] address;
  begin
    i_cart_nRD = 0;
    i_cart_nWR = 1;
    is_writing = 0;
    i_cart_nCS = 1;
    i_cart_a[15] = 1;
    #125;
    i_cart_a = address;
    #250;
    #250;
    d_output = i_cart_d;
    #250;
  end
endtask

task tryCapture;
  begin
    writeReg(16'h4000, 8'h10); // enable cam reg
    writeRamCam(16'hA000, 8'h03); // start capture
  end
endtask


initial begin
  #1000;
  i_resetn = 0;
  #20;
  i_resetn = 1;
  #200;

  // read from bank 0;
  readRom(16'h2000);  // -> 00
  #1000;
  
  // read from bank 0;  // -> 00
  readRom(16'h6000);
  #1000;
  
  // set bank 5 and read;
  writeReg(16'h2000, 8'h05);
  #250;
  readRom(16'h6000); // -> 05

  // read ram bank 0;
  readRam(16'hA010); // -> F0
  #1000;

  // set ram bank 1 and read;
  writeReg(16'h4000, 8'h01);
  #250;
  readRam(16'hA010); // -> F1
  #1000;

  // sholve some camera regs
  writeReg(16'h4000, 8'h10); // enable cam reg
  writeRamCam(16'hA001, 8'hA1);
  #250;
  writeRamCam(16'hA002, 8'hA2);
  #250;
  writeRamCam(16'hA003, 8'hA3);
  #250;
  tryCapture();
  #10000;
  readRam(16'hA000); // -> E1
  #600000;
  readRam(16'hA000); // -> E0
  #1000;
  $stop;
end

endmodule