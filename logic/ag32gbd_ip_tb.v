`timescale 1ns/1ps

module ag32gbd_ip_tb;

reg           i_resetn    = 1;
reg           i_sys_clock = 1;

wire          i_cart_clk;
reg   [15:0]  i_cart_a;
wire  [7:0]   i_cart_d;
reg           i_cart_nCS = 1;
reg           i_cart_nRD = 1;
reg           i_cart_nWR = 1;

wire  [16:0]  i_RAM_A;
wire   [7:0]   i_RAM_DQ;
wire          i_RAM_nCS;
wire          i_RAM_nRD;
wire          i_RAM_nWE;

wire Rec;
wire Ramio;

ag32gbd_ip gbd_inst(
    .sys_clock(i_sys_clock),
    .resetn(i_resetn),

    .top_A(i_cart_a),
    .top_D(i_cart_d),
    .top_CLK(i_cart_clk),
    .top_nWR(i_cart_nWR),
    .top_nRD(i_cart_nRD),
    .top_nCS(i_cart_nCS),

    .top_RAM_A(i_RAM_A),
    .top_RAM_DQ(i_RAM_DQ),
    .top_RAM_nCS(i_RAM_nCS),
    .top_RAM_nRD(i_RAM_nRD),
    .top_RAM_nWE(i_RAM_nWE),

    .top_nLED_RAMIO(Ramio),
    .top_nLED_REC(Rec)
);


reg gb_clk = 0;
always begin
    gb_clk = ~gb_clk;
    #250;
end

always begin
    i_sys_clock = ~i_sys_clock; // 100MHz
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
    #200;
    i_resetn = 1;
    #200;
    writeReg(16'h4000, 8'h10); // enable cam reg
    #200
    writeRamCam(16'hA001, 8'b10000000);
    #200;
    writeRamCam(16'hA002, 8'd0);
    #200
    writeRamCam(16'hA003, 8'd10);
    #10000;   
    tryCapture();
    #500000000;

    $stop;
end

endmodule