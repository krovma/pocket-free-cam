`timescale 1 ps/ 1 ps

module gbd(
	GPIO1_0,
	PIN_HSE,
	PIN_HSI,
	PLL_CLKIN,
	cart_CLK,
	cart_a,
	cart_d,
	cart_nCS,
	cart_nRD,
	cart_nRST,
	cart_nWR,
	ram_a,
	ram_ce2,
	ram_nCS,
	ram_nWE,
	rom_a,
	rom_nCS,
	sens_load,
	sens_read,
	sens_reset,
	sens_sin,
	sens_start,
	sens_xck);
inout	GPIO1_0;
input	PIN_HSE;
input	PIN_HSI;
input	PLL_CLKIN;
input	cart_CLK;
inout	[15:0] cart_a;
inout	[7:0] cart_d;
input	cart_nCS;
input	cart_nRD;
output	cart_nRST;
input	cart_nWR;
output	[16:13] ram_a;
output	ram_ce2;
output	ram_nCS;
output	ram_nWE;
output	[22:14] rom_a;
output	rom_nCS;
output	sens_load;
output	sens_read;
output	sens_reset;
output	sens_sin;
output	sens_start;
output	sens_xck;

//wire	gnd;
//wire	vcc;
//wire	unknown;
wire	\GPIO1_0~input_o ;
wire	\PIN_HSE~input_o ;
wire	\PIN_HSI~input_o ;
wire	\PLL_CLKIN~input_o ;
wire	\PLL_ENABLE~clkctrl_outclk ;
wire	\PLL_ENABLE~clkctrl_outclk__AsyncReset_X49_Y1_SIG ;
wire	\PLL_ENABLE~combout ;
wire	\PLL_LOCK~combout ;
wire	SyncLoad_X57_Y1_VCC;
wire	SyncLoad_X58_Y1_VCC;
wire	SyncLoad_X59_Y3_VCC;
wire	SyncLoad_X60_Y2_GND;
wire	SyncLoad_X60_Y3_GND;
wire	SyncReset_X57_Y1_GND;
wire	SyncReset_X58_Y1_GND;
wire	SyncReset_X59_Y3_GND;
wire	\auto_generated_inst.hbo_13_83378d4b1997463f_bp ;
wire	\auto_generated_inst.hbo_13_83378d4b1997463f_bp_X49_Y1_SIG_VCC ;
wire	\auto_generated_inst.hbo_22_f9ff3d300b43c0f2_bp ;
wire	\auto_generated_inst.hbo_22_f9ff3d300b43c0f2_bp_X58_Y1_SIG_VCC ;
wire	\auto_generated_inst.hbo_22_f9ff3d300b43c0f2_bp_X59_Y3_SIG_VCC ;
wire	\auto_generated_inst.hbo_22_f9ff3d300b43c0f2_bp_X60_Y1_SIG_VCC ;
wire	\auto_generated_inst.hbo_22_f9ff3d300b43c0f2_bp_X61_Y1_SIG_VCC ;
wire	\auto_generated_inst.hbo_22_f9ff3d300b43c0f2_bp__macro_inst|gbdcam|counter0[23]~32_combout_X60_Y2_SIG_SIG ;
wire	\auto_generated_inst.hbo_22_f9ff3d300b43c0f2_bp__macro_inst|gbdcam|counter0[23]~32_combout_X60_Y3_SIG_SIG ;
wire	\auto_generated_inst.hbo_22_f9ff3d300b43c0f2_bp__macro_inst|gbdram|ram_bank_id[0]~1_combout_X58_Y1_SIG_SIG ;
wire	\auto_generated_inst.hbo_22_f9ff3d300b43c0f2_bp__macro_inst|gbdreg|Cam_Capture~0_combout_X60_Y1_SIG_SIG ;
wire	\auto_generated_inst.hbo_22_f9ff3d300b43c0f2_bp__macro_inst|gbdreg|Reg_OutputData[0]~3_combout_X59_Y1_SIG_SIG ;
wire	\auto_generated_inst.hbo_22_f9ff3d300b43c0f2_bp__macro_inst|gbdrom|bank_id[0]~0_combout_X57_Y1_SIG_SIG ;
wire	\cart_CLK~input_o ;
wire	\cart_CLK~input_o_X44_Y1_SIG_VCC ;
wire	\cart_a[0]~input_o ;
wire	\cart_a[10]~input_o ;
wire	\cart_a[11]~input_o ;
wire	\cart_a[12]~input_o ;
wire	\cart_a[13]~input_o ;
wire	\cart_a[14]~input_o ;
wire	\cart_a[15]~input_o ;
wire	\cart_a[1]~input_o ;
wire	\cart_a[2]~input_o ;
wire	\cart_a[3]~input_o ;
wire	\cart_a[4]~input_o ;
wire	\cart_a[5]~input_o ;
wire	\cart_a[6]~input_o ;
wire	\cart_a[7]~input_o ;
wire	\cart_a[8]~input_o ;
wire	\cart_a[9]~input_o ;
wire	\cart_d[0]~input_o ;
wire	\cart_d[1]~input_o ;
wire	\cart_d[2]~input_o ;
wire	\cart_d[3]~input_o ;
wire	\cart_d[4]~input_o ;
wire	\cart_d[5]~input_o ;
wire	\cart_d[6]~input_o ;
wire	\cart_d[7]~input_o ;
wire	\cart_nCS~input_o ;
wire	\cart_nRD~input_o ;
wire	\cart_nWR~input_o ;
tri1	devclrn;
tri1	devoe;
tri1	devpor;
wire	\gclksw_inst|gclk_switch__alta_gclksw__clkout ;
wire	[7:0] gpio1_io_in;
//wire	gpio1_io_in[0];
//wire	gpio1_io_in[1];
//wire	gpio1_io_in[2];
//wire	gpio1_io_in[3];
//wire	gpio1_io_in[4];
//wire	gpio1_io_in[5];
//wire	gpio1_io_in[6];
//wire	gpio1_io_in[7];
wire	[7:0] gpio1_io_out_data;
//wire	gpio1_io_out_data[0];
//wire	gpio1_io_out_data[1];
//wire	gpio1_io_out_data[2];
//wire	gpio1_io_out_data[3];
//wire	gpio1_io_out_data[4];
//wire	gpio1_io_out_data[5];
//wire	gpio1_io_out_data[6];
//wire	gpio1_io_out_data[7];
wire	[7:0] gpio1_io_out_en;
//wire	gpio1_io_out_en[0];
//wire	gpio1_io_out_en[1];
//wire	gpio1_io_out_en[2];
//wire	gpio1_io_out_en[3];
//wire	gpio1_io_out_en[4];
//wire	gpio1_io_out_en[5];
//wire	gpio1_io_out_en[6];
//wire	gpio1_io_out_en[7];
wire	hbi_272_0_9cb2c0024f9919c5_bp;
wire	hbi_272_1_9cb2c0024f9919c5_bp;
wire	\macro_inst|gbdcam|Cam_Capture_Finish~q ;
wire	\macro_inst|gbdcam|Equal0~0_combout ;
wire	\macro_inst|gbdcam|Equal0~1_combout ;
wire	\macro_inst|gbdcam|Equal0~2_combout ;
wire	\macro_inst|gbdcam|Equal0~3_combout ;
wire	\macro_inst|gbdcam|Equal0~4_combout ;
wire	[1:0] \macro_inst|gbdcam|Last_XCK_Reg ;
//wire	\macro_inst|gbdcam|Last_XCK_Reg [0];
wire	\macro_inst|gbdcam|Last_XCK_Reg[0]~feeder_combout ;
//wire	\macro_inst|gbdcam|Last_XCK_Reg [1];
wire	\macro_inst|gbdcam|Sens_XCK_Reg~0_combout ;
wire	\macro_inst|gbdcam|Sens_XCK_Reg~q ;
wire	\macro_inst|gbdcam|always4~0_combout ;
wire	[23:0] \macro_inst|gbdcam|counter0 ;
//wire	\macro_inst|gbdcam|counter0 [0];
wire	\macro_inst|gbdcam|counter0[0]~30_combout ;
wire	\macro_inst|gbdcam|counter0[0]~31 ;
//wire	\macro_inst|gbdcam|counter0 [10];
wire	\macro_inst|gbdcam|counter0[10]~51_combout ;
wire	\macro_inst|gbdcam|counter0[10]~52 ;
//wire	\macro_inst|gbdcam|counter0 [11];
wire	\macro_inst|gbdcam|counter0[11]~53_combout ;
wire	\macro_inst|gbdcam|counter0[11]~54 ;
//wire	\macro_inst|gbdcam|counter0 [12];
wire	\macro_inst|gbdcam|counter0[12]~55_combout ;
wire	\macro_inst|gbdcam|counter0[12]~56 ;
//wire	\macro_inst|gbdcam|counter0 [13];
wire	\macro_inst|gbdcam|counter0[13]~57_combout ;
wire	\macro_inst|gbdcam|counter0[13]~58 ;
//wire	\macro_inst|gbdcam|counter0 [14];
wire	\macro_inst|gbdcam|counter0[14]~59_combout ;
wire	\macro_inst|gbdcam|counter0[14]~60 ;
//wire	\macro_inst|gbdcam|counter0 [15];
wire	\macro_inst|gbdcam|counter0[15]~61_combout ;
wire	\macro_inst|gbdcam|counter0[15]~62 ;
//wire	\macro_inst|gbdcam|counter0 [16];
wire	\macro_inst|gbdcam|counter0[16]~63_combout ;
wire	\macro_inst|gbdcam|counter0[16]~64 ;
//wire	\macro_inst|gbdcam|counter0 [17];
wire	\macro_inst|gbdcam|counter0[17]~65_combout ;
wire	\macro_inst|gbdcam|counter0[17]~66 ;
//wire	\macro_inst|gbdcam|counter0 [18];
wire	\macro_inst|gbdcam|counter0[18]~67_combout ;
wire	\macro_inst|gbdcam|counter0[18]~68 ;
//wire	\macro_inst|gbdcam|counter0 [19];
wire	\macro_inst|gbdcam|counter0[19]~69_combout ;
wire	\macro_inst|gbdcam|counter0[19]~70 ;
//wire	\macro_inst|gbdcam|counter0 [1];
wire	\macro_inst|gbdcam|counter0[1]~33_combout ;
wire	\macro_inst|gbdcam|counter0[1]~34 ;
//wire	\macro_inst|gbdcam|counter0 [20];
wire	\macro_inst|gbdcam|counter0[20]~71_combout ;
wire	\macro_inst|gbdcam|counter0[20]~72 ;
//wire	\macro_inst|gbdcam|counter0 [21];
wire	\macro_inst|gbdcam|counter0[21]~73_combout ;
wire	\macro_inst|gbdcam|counter0[21]~74 ;
//wire	\macro_inst|gbdcam|counter0 [22];
wire	\macro_inst|gbdcam|counter0[22]~75_combout ;
wire	\macro_inst|gbdcam|counter0[22]~76 ;
//wire	\macro_inst|gbdcam|counter0 [23];
wire	\macro_inst|gbdcam|counter0[23]~28_RESYN0_BDD1 ;
wire	\macro_inst|gbdcam|counter0[23]~28_RESYN2_BDD3 ;
wire	\macro_inst|gbdcam|counter0[23]~28_combout ;
wire	\macro_inst|gbdcam|counter0[23]~29_combout ;
wire	\macro_inst|gbdcam|counter0[23]~32_combout ;
wire	\macro_inst|gbdcam|counter0[23]~77_combout ;
//wire	\macro_inst|gbdcam|counter0 [2];
wire	\macro_inst|gbdcam|counter0[2]~35_combout ;
wire	\macro_inst|gbdcam|counter0[2]~36 ;
//wire	\macro_inst|gbdcam|counter0 [3];
wire	\macro_inst|gbdcam|counter0[3]~37_combout ;
wire	\macro_inst|gbdcam|counter0[3]~38 ;
//wire	\macro_inst|gbdcam|counter0 [4];
wire	\macro_inst|gbdcam|counter0[4]~39_combout ;
wire	\macro_inst|gbdcam|counter0[4]~40 ;
//wire	\macro_inst|gbdcam|counter0 [5];
wire	\macro_inst|gbdcam|counter0[5]~41_combout ;
wire	\macro_inst|gbdcam|counter0[5]~42 ;
//wire	\macro_inst|gbdcam|counter0 [6];
wire	\macro_inst|gbdcam|counter0[6]~43_combout ;
wire	\macro_inst|gbdcam|counter0[6]~44 ;
//wire	\macro_inst|gbdcam|counter0 [7];
wire	\macro_inst|gbdcam|counter0[7]~45_combout ;
wire	\macro_inst|gbdcam|counter0[7]~46 ;
//wire	\macro_inst|gbdcam|counter0 [8];
wire	\macro_inst|gbdcam|counter0[8]~47_combout ;
wire	\macro_inst|gbdcam|counter0[8]~48 ;
//wire	\macro_inst|gbdcam|counter0 [9];
wire	\macro_inst|gbdcam|counter0[9]~49_combout ;
wire	\macro_inst|gbdcam|counter0[9]~50 ;
wire	\macro_inst|gbdcam|main_state.S_WAIT0~0_combout ;
wire	\macro_inst|gbdcam|main_state.S_WAIT0~q ;
wire	\macro_inst|gbdcam|main_state.S_WAIT0~q__SyncReset_X60_Y2_INV ;
wire	\macro_inst|gbdcam|main_state.S_WAIT0~q__SyncReset_X60_Y3_INV ;
wire	\macro_inst|gbdram|Ram_nCS~0_combout ;
wire	\macro_inst|gbdram|Ram_nWE~0_combout ;
wire	[1:0] \macro_inst|gbdram|last_nWR ;
//wire	\macro_inst|gbdram|last_nWR [0];
wire	\macro_inst|gbdram|last_nWR[0]~0_combout ;
//wire	\macro_inst|gbdram|last_nWR [1];
wire	[4:0] \macro_inst|gbdram|ram_bank_id ;
//wire	\macro_inst|gbdram|ram_bank_id [0];
wire	\macro_inst|gbdram|ram_bank_id[0]~0_combout ;
wire	\macro_inst|gbdram|ram_bank_id[0]~1_combout ;
//wire	\macro_inst|gbdram|ram_bank_id [1];
//wire	\macro_inst|gbdram|ram_bank_id [2];
//wire	\macro_inst|gbdram|ram_bank_id [3];
//wire	\macro_inst|gbdram|ram_bank_id [4];
wire	\macro_inst|gbdram|ram_wren~0_combout ;
wire	\macro_inst|gbdram|ram_wren~1_combout ;
wire	\macro_inst|gbdram|ram_wren~2_combout ;
wire	\macro_inst|gbdram|ram_wren~q ;
wire	\macro_inst|gbdreg|Bram_Req_Write~0_combout ;
wire	\macro_inst|gbdreg|Bram_Req_Write~1_combout ;
wire	\macro_inst|gbdreg|Bram_Req_Write~2_combout ;
wire	\macro_inst|gbdreg|Bram_Req_Write~3_combout ;
wire	\macro_inst|gbdreg|Bram_Req_Write~q ;
wire	\macro_inst|gbdreg|Cam_Capture~0_combout ;
wire	\macro_inst|gbdreg|Cam_Capture~q ;
wire	\macro_inst|gbdreg|Decoder0~0_combout ;
wire	\macro_inst|gbdreg|Decoder0~1_combout ;
wire	\macro_inst|gbdreg|Decoder0~2_combout ;
wire	[7:0] \macro_inst|gbdreg|Reg_A000 ;
//wire	\macro_inst|gbdreg|Reg_A000 [0];
//wire	\macro_inst|gbdreg|Reg_A000 [1];
//wire	\macro_inst|gbdreg|Reg_A000 [2];
//wire	\macro_inst|gbdreg|Reg_A000 [3];
//wire	\macro_inst|gbdreg|Reg_A000 [4];
//wire	\macro_inst|gbdreg|Reg_A000 [5];
//wire	\macro_inst|gbdreg|Reg_A000 [6];
//wire	\macro_inst|gbdreg|Reg_A000 [7];
wire	\macro_inst|gbdreg|Reg_A000~0_combout ;
wire	\macro_inst|gbdreg|Reg_A000~1_combout ;
wire	\macro_inst|gbdreg|Reg_A000~2_combout ;
wire	\macro_inst|gbdreg|Reg_A000~3_combout ;
wire	\macro_inst|gbdreg|Reg_A000~4_combout ;
wire	\macro_inst|gbdreg|Reg_A000~5_combout ;
wire	\macro_inst|gbdreg|Reg_A000~6_combout ;
wire	\macro_inst|gbdreg|Reg_A000~7_combout ;
wire	[7:0] \macro_inst|gbdreg|Reg_OutputData ;
//wire	\macro_inst|gbdreg|Reg_OutputData [0];
wire	\macro_inst|gbdreg|Reg_OutputData[0]~1_combout ;
wire	\macro_inst|gbdreg|Reg_OutputData[0]~2_combout ;
wire	\macro_inst|gbdreg|Reg_OutputData[0]~3_combout ;
//wire	\macro_inst|gbdreg|Reg_OutputData [1];
//wire	\macro_inst|gbdreg|Reg_OutputData [2];
//wire	\macro_inst|gbdreg|Reg_OutputData [3];
//wire	\macro_inst|gbdreg|Reg_OutputData [4];
//wire	\macro_inst|gbdreg|Reg_OutputData [5];
//wire	\macro_inst|gbdreg|Reg_OutputData [6];
//wire	\macro_inst|gbdreg|Reg_OutputData [7];
wire	\macro_inst|gbdreg|Reg_OutputData~0_combout ;
wire	\macro_inst|gbdreg|Reg_OutputData~10_combout ;
wire	\macro_inst|gbdreg|Reg_OutputData~4_combout ;
wire	\macro_inst|gbdreg|Reg_OutputData~5_combout ;
wire	\macro_inst|gbdreg|Reg_OutputData~6_combout ;
wire	\macro_inst|gbdreg|Reg_OutputData~7_combout ;
wire	\macro_inst|gbdreg|Reg_OutputData~8_combout ;
wire	\macro_inst|gbdreg|Reg_OutputData~9_combout ;
wire	\macro_inst|gbdreg|Reg_OutputValid~0_combout ;
wire	\macro_inst|gbdreg|Reg_OutputValid~1_combout ;
wire	\macro_inst|gbdreg|Reg_OutputValid~2_combout ;
wire	\macro_inst|gbdreg|Reg_OutputValid~q ;
wire	\macro_inst|gbdreg|WideOr0~0_combout ;
wire	[2:0] \macro_inst|gbdreg|bram_signal_reset_cnt ;
//wire	\macro_inst|gbdreg|bram_signal_reset_cnt [0];
wire	\macro_inst|gbdreg|bram_signal_reset_cnt[0]~2_combout ;
//wire	\macro_inst|gbdreg|bram_signal_reset_cnt [1];
wire	\macro_inst|gbdreg|bram_signal_reset_cnt[1]~1_combout ;
//wire	\macro_inst|gbdreg|bram_signal_reset_cnt [2];
wire	\macro_inst|gbdreg|bram_signal_reset_cnt[2]~0_combout ;
wire	\macro_inst|gbdreg|is_accessing_reg~0_combout ;
wire	\macro_inst|gbdreg|is_accessing_reg~1_combout ;
wire	[1:0] \macro_inst|gbdreg|last_CamCaptureFinish ;
//wire	\macro_inst|gbdreg|last_CamCaptureFinish [0];
wire	\macro_inst|gbdreg|last_CamCaptureFinish[0]~feeder_combout ;
//wire	\macro_inst|gbdreg|last_CamCaptureFinish [1];
wire	\macro_inst|gbdreg|last_CamCaptureFinish[1]~feeder_combout ;
wire	[1:0] \macro_inst|gbdreg|last_nCS ;
//wire	\macro_inst|gbdreg|last_nCS [0];
wire	\macro_inst|gbdreg|last_nCS[0]~0_combout ;
//wire	\macro_inst|gbdreg|last_nCS [1];
wire	\macro_inst|gbdrom|Rom_a[14]~0_combout ;
wire	\macro_inst|gbdrom|Rom_a[15]~1_combout ;
wire	\macro_inst|gbdrom|Rom_a[16]~2_combout ;
wire	\macro_inst|gbdrom|Rom_a[17]~3_combout ;
wire	\macro_inst|gbdrom|Rom_a[18]~4_combout ;
wire	\macro_inst|gbdrom|Rom_a[19]~5_combout ;
wire	[5:0] \macro_inst|gbdrom|bank_id ;
//wire	\macro_inst|gbdrom|bank_id [0];
wire	\macro_inst|gbdrom|bank_id[0]~0_combout ;
wire	\macro_inst|gbdrom|bank_id[0]~1_combout ;
//wire	\macro_inst|gbdrom|bank_id [1];
//wire	\macro_inst|gbdrom|bank_id [2];
//wire	\macro_inst|gbdrom|bank_id [3];
//wire	\macro_inst|gbdrom|bank_id [4];
//wire	\macro_inst|gbdrom|bank_id [5];
wire	[4:0] \pll_inst|auto_generated|clk ;
//wire	\pll_inst|auto_generated|clk [0];
//wire	\pll_inst|auto_generated|clk [1];
//wire	\pll_inst|auto_generated|clk [2];
//wire	\pll_inst|auto_generated|clk [3];
//wire	\pll_inst|auto_generated|clk [4];
wire	[4:0] \pll_inst|auto_generated|pll1_CLK_bus ;
//wire	\pll_inst|auto_generated|pll1_CLK_bus [0];
//wire	\pll_inst|auto_generated|pll1_CLK_bus [1];
//wire	\pll_inst|auto_generated|pll1_CLK_bus [2];
//wire	\pll_inst|auto_generated|pll1_CLK_bus [3];
//wire	\pll_inst|auto_generated|pll1_CLK_bus [4];
wire	\pll_inst|auto_generated|pll1~FBOUT ;
wire	\pll_inst|auto_generated|pll_lock_sync~feeder_combout ;
wire	\pll_inst|auto_generated|pll_lock_sync~q ;
wire	\rv32.dmactive ;
wire	\rv32.ext_dma_DMACCLR[0] ;
wire	\rv32.ext_dma_DMACCLR[1] ;
wire	\rv32.ext_dma_DMACCLR[2] ;
wire	\rv32.ext_dma_DMACCLR[3] ;
wire	\rv32.ext_dma_DMACTC[0] ;
wire	\rv32.ext_dma_DMACTC[1] ;
wire	\rv32.ext_dma_DMACTC[2] ;
wire	\rv32.ext_dma_DMACTC[3] ;
wire	\rv32.gpio0_io_out_data[0] ;
wire	\rv32.gpio0_io_out_data[1] ;
wire	\rv32.gpio0_io_out_data[2] ;
wire	\rv32.gpio0_io_out_data[3] ;
wire	\rv32.gpio0_io_out_data[4] ;
wire	\rv32.gpio0_io_out_data[5] ;
wire	\rv32.gpio0_io_out_data[6] ;
wire	\rv32.gpio0_io_out_data[7] ;
wire	\rv32.gpio0_io_out_en[0] ;
wire	\rv32.gpio0_io_out_en[1] ;
wire	\rv32.gpio0_io_out_en[2] ;
wire	\rv32.gpio0_io_out_en[3] ;
wire	\rv32.gpio0_io_out_en[4] ;
wire	\rv32.gpio0_io_out_en[5] ;
wire	\rv32.gpio0_io_out_en[6] ;
wire	\rv32.gpio0_io_out_en[7] ;
wire	\rv32.gpio1_io_out_data[0] ;
wire	\rv32.gpio1_io_out_data[1] ;
wire	\rv32.gpio1_io_out_data[2] ;
wire	\rv32.gpio1_io_out_data[3] ;
wire	\rv32.gpio1_io_out_data[4] ;
wire	\rv32.gpio1_io_out_data[5] ;
wire	\rv32.gpio1_io_out_data[6] ;
wire	\rv32.gpio1_io_out_data[7] ;
wire	\rv32.gpio1_io_out_en[0] ;
wire	\rv32.gpio1_io_out_en[1] ;
wire	\rv32.gpio1_io_out_en[2] ;
wire	\rv32.gpio1_io_out_en[3] ;
wire	\rv32.gpio1_io_out_en[4] ;
wire	\rv32.gpio1_io_out_en[5] ;
wire	\rv32.gpio1_io_out_en[6] ;
wire	\rv32.gpio1_io_out_en[7] ;
wire	\rv32.gpio2_io_out_data[0] ;
wire	\rv32.gpio2_io_out_data[1] ;
wire	\rv32.gpio2_io_out_data[2] ;
wire	\rv32.gpio2_io_out_data[3] ;
wire	\rv32.gpio2_io_out_data[4] ;
wire	\rv32.gpio2_io_out_data[5] ;
wire	\rv32.gpio2_io_out_data[6] ;
wire	\rv32.gpio2_io_out_data[7] ;
wire	\rv32.gpio2_io_out_en[0] ;
wire	\rv32.gpio2_io_out_en[1] ;
wire	\rv32.gpio2_io_out_en[2] ;
wire	\rv32.gpio2_io_out_en[3] ;
wire	\rv32.gpio2_io_out_en[4] ;
wire	\rv32.gpio2_io_out_en[5] ;
wire	\rv32.gpio2_io_out_en[6] ;
wire	\rv32.gpio2_io_out_en[7] ;
wire	\rv32.gpio3_io_out_data[0] ;
wire	\rv32.gpio3_io_out_data[1] ;
wire	\rv32.gpio3_io_out_data[2] ;
wire	\rv32.gpio3_io_out_data[3] ;
wire	\rv32.gpio3_io_out_data[4] ;
wire	\rv32.gpio3_io_out_data[5] ;
wire	\rv32.gpio3_io_out_data[6] ;
wire	\rv32.gpio3_io_out_data[7] ;
wire	\rv32.gpio3_io_out_en[0] ;
wire	\rv32.gpio3_io_out_en[1] ;
wire	\rv32.gpio3_io_out_en[2] ;
wire	\rv32.gpio3_io_out_en[3] ;
wire	\rv32.gpio3_io_out_en[4] ;
wire	\rv32.gpio3_io_out_en[5] ;
wire	\rv32.gpio3_io_out_en[6] ;
wire	\rv32.gpio3_io_out_en[7] ;
wire	\rv32.gpio4_io_out_data[0] ;
wire	\rv32.gpio4_io_out_data[1] ;
wire	\rv32.gpio4_io_out_data[2] ;
wire	\rv32.gpio4_io_out_data[3] ;
wire	\rv32.gpio4_io_out_data[4] ;
wire	\rv32.gpio4_io_out_data[5] ;
wire	\rv32.gpio4_io_out_data[6] ;
wire	\rv32.gpio4_io_out_data[7] ;
wire	\rv32.gpio4_io_out_en[0] ;
wire	\rv32.gpio4_io_out_en[1] ;
wire	\rv32.gpio4_io_out_en[2] ;
wire	\rv32.gpio4_io_out_en[3] ;
wire	\rv32.gpio4_io_out_en[4] ;
wire	\rv32.gpio4_io_out_en[5] ;
wire	\rv32.gpio4_io_out_en[6] ;
wire	\rv32.gpio4_io_out_en[7] ;
wire	\rv32.gpio5_io_out_data[0] ;
wire	\rv32.gpio5_io_out_data[1] ;
wire	\rv32.gpio5_io_out_data[2] ;
wire	\rv32.gpio5_io_out_data[3] ;
wire	\rv32.gpio5_io_out_data[4] ;
wire	\rv32.gpio5_io_out_data[5] ;
wire	\rv32.gpio5_io_out_data[6] ;
wire	\rv32.gpio5_io_out_data[7] ;
wire	\rv32.gpio5_io_out_en[0] ;
wire	\rv32.gpio5_io_out_en[1] ;
wire	\rv32.gpio5_io_out_en[2] ;
wire	\rv32.gpio5_io_out_en[3] ;
wire	\rv32.gpio5_io_out_en[4] ;
wire	\rv32.gpio5_io_out_en[5] ;
wire	\rv32.gpio5_io_out_en[6] ;
wire	\rv32.gpio5_io_out_en[7] ;
wire	\rv32.gpio6_io_out_data[0] ;
wire	\rv32.gpio6_io_out_data[1] ;
wire	\rv32.gpio6_io_out_data[2] ;
wire	\rv32.gpio6_io_out_data[3] ;
wire	\rv32.gpio6_io_out_data[4] ;
wire	\rv32.gpio6_io_out_data[5] ;
wire	\rv32.gpio6_io_out_data[6] ;
wire	\rv32.gpio6_io_out_data[7] ;
wire	\rv32.gpio6_io_out_en[0] ;
wire	\rv32.gpio6_io_out_en[1] ;
wire	\rv32.gpio6_io_out_en[2] ;
wire	\rv32.gpio6_io_out_en[3] ;
wire	\rv32.gpio6_io_out_en[4] ;
wire	\rv32.gpio6_io_out_en[5] ;
wire	\rv32.gpio6_io_out_en[6] ;
wire	\rv32.gpio6_io_out_en[7] ;
wire	\rv32.gpio7_io_out_data[0] ;
wire	\rv32.gpio7_io_out_data[1] ;
wire	\rv32.gpio7_io_out_data[2] ;
wire	\rv32.gpio7_io_out_data[3] ;
wire	\rv32.gpio7_io_out_data[4] ;
wire	\rv32.gpio7_io_out_data[5] ;
wire	\rv32.gpio7_io_out_data[6] ;
wire	\rv32.gpio7_io_out_data[7] ;
wire	\rv32.gpio7_io_out_en[0] ;
wire	\rv32.gpio7_io_out_en[1] ;
wire	\rv32.gpio7_io_out_en[2] ;
wire	\rv32.gpio7_io_out_en[3] ;
wire	\rv32.gpio7_io_out_en[4] ;
wire	\rv32.gpio7_io_out_en[5] ;
wire	\rv32.gpio7_io_out_en[6] ;
wire	\rv32.gpio7_io_out_en[7] ;
wire	\rv32.gpio8_io_out_data[0] ;
wire	\rv32.gpio8_io_out_data[1] ;
wire	\rv32.gpio8_io_out_data[2] ;
wire	\rv32.gpio8_io_out_data[3] ;
wire	\rv32.gpio8_io_out_data[4] ;
wire	\rv32.gpio8_io_out_data[5] ;
wire	\rv32.gpio8_io_out_data[6] ;
wire	\rv32.gpio8_io_out_data[7] ;
wire	\rv32.gpio8_io_out_en[0] ;
wire	\rv32.gpio8_io_out_en[1] ;
wire	\rv32.gpio8_io_out_en[2] ;
wire	\rv32.gpio8_io_out_en[3] ;
wire	\rv32.gpio8_io_out_en[4] ;
wire	\rv32.gpio8_io_out_en[5] ;
wire	\rv32.gpio8_io_out_en[6] ;
wire	\rv32.gpio8_io_out_en[7] ;
wire	\rv32.gpio9_io_out_data[0] ;
wire	\rv32.gpio9_io_out_data[1] ;
wire	\rv32.gpio9_io_out_data[2] ;
wire	\rv32.gpio9_io_out_data[3] ;
wire	\rv32.gpio9_io_out_data[4] ;
wire	\rv32.gpio9_io_out_data[5] ;
wire	\rv32.gpio9_io_out_data[6] ;
wire	\rv32.gpio9_io_out_data[7] ;
wire	\rv32.gpio9_io_out_en[0] ;
wire	\rv32.gpio9_io_out_en[1] ;
wire	\rv32.gpio9_io_out_en[2] ;
wire	\rv32.gpio9_io_out_en[3] ;
wire	\rv32.gpio9_io_out_en[4] ;
wire	\rv32.gpio9_io_out_en[5] ;
wire	\rv32.gpio9_io_out_en[6] ;
wire	\rv32.gpio9_io_out_en[7] ;
wire	\rv32.mem_ahb_haddr[0] ;
wire	\rv32.mem_ahb_haddr[10] ;
wire	\rv32.mem_ahb_haddr[11] ;
wire	\rv32.mem_ahb_haddr[12] ;
wire	\rv32.mem_ahb_haddr[13] ;
wire	\rv32.mem_ahb_haddr[14] ;
wire	\rv32.mem_ahb_haddr[15] ;
wire	\rv32.mem_ahb_haddr[16] ;
wire	\rv32.mem_ahb_haddr[17] ;
wire	\rv32.mem_ahb_haddr[18] ;
wire	\rv32.mem_ahb_haddr[19] ;
wire	\rv32.mem_ahb_haddr[1] ;
wire	\rv32.mem_ahb_haddr[20] ;
wire	\rv32.mem_ahb_haddr[21] ;
wire	\rv32.mem_ahb_haddr[22] ;
wire	\rv32.mem_ahb_haddr[23] ;
wire	\rv32.mem_ahb_haddr[24] ;
wire	\rv32.mem_ahb_haddr[25] ;
wire	\rv32.mem_ahb_haddr[26] ;
wire	\rv32.mem_ahb_haddr[27] ;
wire	\rv32.mem_ahb_haddr[28] ;
wire	\rv32.mem_ahb_haddr[29] ;
wire	\rv32.mem_ahb_haddr[2] ;
wire	\rv32.mem_ahb_haddr[30] ;
wire	\rv32.mem_ahb_haddr[31] ;
wire	\rv32.mem_ahb_haddr[3] ;
wire	\rv32.mem_ahb_haddr[4] ;
wire	\rv32.mem_ahb_haddr[5] ;
wire	\rv32.mem_ahb_haddr[6] ;
wire	\rv32.mem_ahb_haddr[7] ;
wire	\rv32.mem_ahb_haddr[8] ;
wire	\rv32.mem_ahb_haddr[9] ;
wire	\rv32.mem_ahb_hburst[0] ;
wire	\rv32.mem_ahb_hburst[1] ;
wire	\rv32.mem_ahb_hburst[2] ;
wire	\rv32.mem_ahb_hready ;
wire	\rv32.mem_ahb_hsize[0] ;
wire	\rv32.mem_ahb_hsize[1] ;
wire	\rv32.mem_ahb_hsize[2] ;
wire	\rv32.mem_ahb_htrans[0] ;
wire	\rv32.mem_ahb_htrans[1] ;
wire	\rv32.mem_ahb_hwdata[0] ;
wire	\rv32.mem_ahb_hwdata[10] ;
wire	\rv32.mem_ahb_hwdata[11] ;
wire	\rv32.mem_ahb_hwdata[12] ;
wire	\rv32.mem_ahb_hwdata[13] ;
wire	\rv32.mem_ahb_hwdata[14] ;
wire	\rv32.mem_ahb_hwdata[15] ;
wire	\rv32.mem_ahb_hwdata[16] ;
wire	\rv32.mem_ahb_hwdata[17] ;
wire	\rv32.mem_ahb_hwdata[18] ;
wire	\rv32.mem_ahb_hwdata[19] ;
wire	\rv32.mem_ahb_hwdata[1] ;
wire	\rv32.mem_ahb_hwdata[20] ;
wire	\rv32.mem_ahb_hwdata[21] ;
wire	\rv32.mem_ahb_hwdata[22] ;
wire	\rv32.mem_ahb_hwdata[23] ;
wire	\rv32.mem_ahb_hwdata[24] ;
wire	\rv32.mem_ahb_hwdata[25] ;
wire	\rv32.mem_ahb_hwdata[26] ;
wire	\rv32.mem_ahb_hwdata[27] ;
wire	\rv32.mem_ahb_hwdata[28] ;
wire	\rv32.mem_ahb_hwdata[29] ;
wire	\rv32.mem_ahb_hwdata[2] ;
wire	\rv32.mem_ahb_hwdata[30] ;
wire	\rv32.mem_ahb_hwdata[31] ;
wire	\rv32.mem_ahb_hwdata[3] ;
wire	\rv32.mem_ahb_hwdata[4] ;
wire	\rv32.mem_ahb_hwdata[5] ;
wire	\rv32.mem_ahb_hwdata[6] ;
wire	\rv32.mem_ahb_hwdata[7] ;
wire	\rv32.mem_ahb_hwdata[8] ;
wire	\rv32.mem_ahb_hwdata[9] ;
wire	\rv32.mem_ahb_hwrite ;
wire	\rv32.resetn_out ;
wire	\rv32.slave_ahb_hrdata[0] ;
wire	\rv32.slave_ahb_hrdata[10] ;
wire	\rv32.slave_ahb_hrdata[11] ;
wire	\rv32.slave_ahb_hrdata[12] ;
wire	\rv32.slave_ahb_hrdata[13] ;
wire	\rv32.slave_ahb_hrdata[14] ;
wire	\rv32.slave_ahb_hrdata[15] ;
wire	\rv32.slave_ahb_hrdata[16] ;
wire	\rv32.slave_ahb_hrdata[17] ;
wire	\rv32.slave_ahb_hrdata[18] ;
wire	\rv32.slave_ahb_hrdata[19] ;
wire	\rv32.slave_ahb_hrdata[1] ;
wire	\rv32.slave_ahb_hrdata[20] ;
wire	\rv32.slave_ahb_hrdata[21] ;
wire	\rv32.slave_ahb_hrdata[22] ;
wire	\rv32.slave_ahb_hrdata[23] ;
wire	\rv32.slave_ahb_hrdata[24] ;
wire	\rv32.slave_ahb_hrdata[25] ;
wire	\rv32.slave_ahb_hrdata[26] ;
wire	\rv32.slave_ahb_hrdata[27] ;
wire	\rv32.slave_ahb_hrdata[28] ;
wire	\rv32.slave_ahb_hrdata[29] ;
wire	\rv32.slave_ahb_hrdata[2] ;
wire	\rv32.slave_ahb_hrdata[30] ;
wire	\rv32.slave_ahb_hrdata[31] ;
wire	\rv32.slave_ahb_hrdata[3] ;
wire	\rv32.slave_ahb_hrdata[4] ;
wire	\rv32.slave_ahb_hrdata[5] ;
wire	\rv32.slave_ahb_hrdata[6] ;
wire	\rv32.slave_ahb_hrdata[7] ;
wire	\rv32.slave_ahb_hrdata[8] ;
wire	\rv32.slave_ahb_hrdata[9] ;
wire	\rv32.slave_ahb_hreadyout ;
wire	\rv32.slave_ahb_hresp ;
wire	\rv32.swj_JTAGIR[0] ;
wire	\rv32.swj_JTAGIR[1] ;
wire	\rv32.swj_JTAGIR[2] ;
wire	\rv32.swj_JTAGIR[3] ;
wire	\rv32.swj_JTAGNSW ;
wire	\rv32.swj_JTAGSTATE[0] ;
wire	\rv32.swj_JTAGSTATE[1] ;
wire	\rv32.swj_JTAGSTATE[2] ;
wire	\rv32.swj_JTAGSTATE[3] ;
wire	\rv32.sys_ctrl_clkSource[0] ;
wire	\rv32.sys_ctrl_clkSource[1] ;
wire	\rv32.sys_ctrl_hseBypass ;
wire	\rv32.sys_ctrl_hseEnable ;
wire	\rv32.sys_ctrl_pllEnable ;
wire	\rv32.sys_ctrl_sleep ;
wire	\rv32.sys_ctrl_standby ;
wire	\rv32.sys_ctrl_stop ;
wire	\sys_resetn~clkctrl_outclk ;
wire	\sys_resetn~clkctrl_outclk__AsyncReset_X44_Y1_SIG ;
wire	\sys_resetn~clkctrl_outclk__AsyncReset_X57_Y1_SIG ;
wire	\sys_resetn~clkctrl_outclk__AsyncReset_X58_Y1_SIG ;
wire	\sys_resetn~clkctrl_outclk__AsyncReset_X59_Y1_SIG ;
wire	\sys_resetn~clkctrl_outclk__AsyncReset_X59_Y3_SIG ;
wire	\sys_resetn~clkctrl_outclk__AsyncReset_X60_Y1_SIG ;
wire	\sys_resetn~clkctrl_outclk__AsyncReset_X60_Y2_SIG ;
wire	\sys_resetn~clkctrl_outclk__AsyncReset_X60_Y3_SIG ;
wire	\sys_resetn~clkctrl_outclk__AsyncReset_X61_Y1_SIG ;
wire	\sys_resetn~combout ;
wire	\~GND~combout ;
wire	\~VCC~combout ;

wire vcc;
wire gnd;
assign vcc = 1'b1;
assign gnd = 1'b0;
wire unknown;
assign unknown = 1'bx;

alta_rio \GPIO1_0~output (
	.padio(GPIO1_0),
	.datain(\rv32.gpio1_io_out_data[0] ),
	.oe(\rv32.gpio1_io_out_en[0] ),
	.outclk(gnd),
	.outclkena(vcc),
	.inclk(gnd),
	.inclkena(vcc),
	.areset(gnd),
	.sreset(gnd),
	.combout(\GPIO1_0~input_o ),
	.regout());
defparam \GPIO1_0~output .coord_x = 16;
defparam \GPIO1_0~output .coord_y = 13;
defparam \GPIO1_0~output .coord_z = 1;
defparam \GPIO1_0~output .IN_ASYNC_MODE = 1'b0;
defparam \GPIO1_0~output .IN_SYNC_MODE = 1'b0;
defparam \GPIO1_0~output .IN_POWERUP = 1'b0;
defparam \GPIO1_0~output .OUT_REG_MODE = 1'b0;
defparam \GPIO1_0~output .OUT_ASYNC_MODE = 1'b0;
defparam \GPIO1_0~output .OUT_SYNC_MODE = 1'b0;
defparam \GPIO1_0~output .OUT_POWERUP = 1'b0;
defparam \GPIO1_0~output .OE_REG_MODE = 1'b0;
defparam \GPIO1_0~output .OE_ASYNC_MODE = 1'b0;
defparam \GPIO1_0~output .OE_SYNC_MODE = 1'b0;
defparam \GPIO1_0~output .OE_POWERUP = 1'b0;
defparam \GPIO1_0~output .CFG_TRI_INPUT = 1'b0;
defparam \GPIO1_0~output .CFG_INPUT_EN = 1'b1;
defparam \GPIO1_0~output .CFG_PULL_UP = 1'b0;
defparam \GPIO1_0~output .CFG_SLR = 1'b0;
defparam \GPIO1_0~output .CFG_OPEN_DRAIN = 1'b0;
defparam \GPIO1_0~output .CFG_PDRCTRL = 4'b0100;
defparam \GPIO1_0~output .CFG_KEEP = 2'b00;
defparam \GPIO1_0~output .CFG_LVDS_OUT_EN = 1'b0;
defparam \GPIO1_0~output .CFG_LVDS_SEL_CUA = 2'b00;
defparam \GPIO1_0~output .CFG_LVDS_IREF = 10'b0110000000;
defparam \GPIO1_0~output .CFG_LVDS_IN_EN = 1'b0;
defparam \GPIO1_0~output .DPCLK_DELAY = 4'b0000;
defparam \GPIO1_0~output .OUT_DELAY = 1'b0;
defparam \GPIO1_0~output .IN_DATA_DELAY = 3'b000;
defparam \GPIO1_0~output .IN_REG_DELAY = 3'b000;

alta_rio \PIN_HSE~input (
	.padio(PIN_HSE),
	.datain(gnd),
	.oe(gnd),
	.outclk(gnd),
	.outclkena(vcc),
	.inclk(gnd),
	.inclkena(vcc),
	.areset(gnd),
	.sreset(gnd),
	.combout(\PIN_HSE~input_o ),
	.regout());
defparam \PIN_HSE~input .coord_x = 22;
defparam \PIN_HSE~input .coord_y = 4;
defparam \PIN_HSE~input .coord_z = 1;
defparam \PIN_HSE~input .IN_ASYNC_MODE = 1'b0;
defparam \PIN_HSE~input .IN_SYNC_MODE = 1'b0;
defparam \PIN_HSE~input .IN_POWERUP = 1'b0;
defparam \PIN_HSE~input .OUT_REG_MODE = 1'b0;
defparam \PIN_HSE~input .OUT_ASYNC_MODE = 1'b0;
defparam \PIN_HSE~input .OUT_SYNC_MODE = 1'b0;
defparam \PIN_HSE~input .OUT_POWERUP = 1'b0;
defparam \PIN_HSE~input .OE_REG_MODE = 1'b0;
defparam \PIN_HSE~input .OE_ASYNC_MODE = 1'b0;
defparam \PIN_HSE~input .OE_SYNC_MODE = 1'b0;
defparam \PIN_HSE~input .OE_POWERUP = 1'b0;
defparam \PIN_HSE~input .CFG_TRI_INPUT = 1'b0;
defparam \PIN_HSE~input .CFG_PULL_UP = 1'b0;
defparam \PIN_HSE~input .CFG_SLR = 1'b0;
defparam \PIN_HSE~input .CFG_OPEN_DRAIN = 1'b0;
defparam \PIN_HSE~input .CFG_PDRCTRL = 4'b0010;
defparam \PIN_HSE~input .CFG_KEEP = 2'b00;
defparam \PIN_HSE~input .CFG_LVDS_OUT_EN = 1'b0;
defparam \PIN_HSE~input .CFG_LVDS_SEL_CUA = 2'b00;
defparam \PIN_HSE~input .CFG_LVDS_IREF = 10'b0110000000;
defparam \PIN_HSE~input .CFG_LVDS_IN_EN = 1'b0;
defparam \PIN_HSE~input .DPCLK_DELAY = 4'b0000;
defparam \PIN_HSE~input .OUT_DELAY = 1'b0;
defparam \PIN_HSE~input .IN_DATA_DELAY = 3'b000;
defparam \PIN_HSE~input .IN_REG_DELAY = 3'b000;

alta_rio \PIN_HSI~input (
	.padio(PIN_HSI),
	.datain(gnd),
	.oe(gnd),
	.outclk(gnd),
	.outclkena(vcc),
	.inclk(gnd),
	.inclkena(vcc),
	.areset(gnd),
	.sreset(gnd),
	.combout(\PIN_HSI~input_o ),
	.regout());
defparam \PIN_HSI~input .coord_x = 22;
defparam \PIN_HSI~input .coord_y = 4;
defparam \PIN_HSI~input .coord_z = 0;
defparam \PIN_HSI~input .IN_ASYNC_MODE = 1'b0;
defparam \PIN_HSI~input .IN_SYNC_MODE = 1'b0;
defparam \PIN_HSI~input .IN_POWERUP = 1'b0;
defparam \PIN_HSI~input .OUT_REG_MODE = 1'b0;
defparam \PIN_HSI~input .OUT_ASYNC_MODE = 1'b0;
defparam \PIN_HSI~input .OUT_SYNC_MODE = 1'b0;
defparam \PIN_HSI~input .OUT_POWERUP = 1'b0;
defparam \PIN_HSI~input .OE_REG_MODE = 1'b0;
defparam \PIN_HSI~input .OE_ASYNC_MODE = 1'b0;
defparam \PIN_HSI~input .OE_SYNC_MODE = 1'b0;
defparam \PIN_HSI~input .OE_POWERUP = 1'b0;
defparam \PIN_HSI~input .CFG_TRI_INPUT = 1'b0;
defparam \PIN_HSI~input .CFG_PULL_UP = 1'b0;
defparam \PIN_HSI~input .CFG_SLR = 1'b0;
defparam \PIN_HSI~input .CFG_OPEN_DRAIN = 1'b0;
defparam \PIN_HSI~input .CFG_PDRCTRL = 4'b0010;
defparam \PIN_HSI~input .CFG_KEEP = 2'b00;
defparam \PIN_HSI~input .CFG_LVDS_OUT_EN = 1'b0;
defparam \PIN_HSI~input .CFG_LVDS_SEL_CUA = 2'b00;
defparam \PIN_HSI~input .CFG_LVDS_IREF = 10'b0110000000;
defparam \PIN_HSI~input .CFG_LVDS_IN_EN = 1'b0;
defparam \PIN_HSI~input .DPCLK_DELAY = 4'b0000;
defparam \PIN_HSI~input .OUT_DELAY = 1'b0;
defparam \PIN_HSI~input .IN_DATA_DELAY = 3'b000;
defparam \PIN_HSI~input .IN_REG_DELAY = 3'b000;

alta_rio \PLL_CLKIN~input (
	.padio(PLL_CLKIN),
	.datain(gnd),
	.oe(gnd),
	.outclk(gnd),
	.outclkena(vcc),
	.inclk(gnd),
	.inclkena(vcc),
	.areset(gnd),
	.sreset(gnd),
	.combout(\PLL_CLKIN~input_o ),
	.regout());
defparam \PLL_CLKIN~input .coord_x = 22;
defparam \PLL_CLKIN~input .coord_y = 4;
defparam \PLL_CLKIN~input .coord_z = 2;
defparam \PLL_CLKIN~input .IN_ASYNC_MODE = 1'b0;
defparam \PLL_CLKIN~input .IN_SYNC_MODE = 1'b0;
defparam \PLL_CLKIN~input .IN_POWERUP = 1'b0;
defparam \PLL_CLKIN~input .OUT_REG_MODE = 1'b0;
defparam \PLL_CLKIN~input .OUT_ASYNC_MODE = 1'b0;
defparam \PLL_CLKIN~input .OUT_SYNC_MODE = 1'b0;
defparam \PLL_CLKIN~input .OUT_POWERUP = 1'b0;
defparam \PLL_CLKIN~input .OE_REG_MODE = 1'b0;
defparam \PLL_CLKIN~input .OE_ASYNC_MODE = 1'b0;
defparam \PLL_CLKIN~input .OE_SYNC_MODE = 1'b0;
defparam \PLL_CLKIN~input .OE_POWERUP = 1'b0;
defparam \PLL_CLKIN~input .CFG_TRI_INPUT = 1'b0;
defparam \PLL_CLKIN~input .CFG_PULL_UP = 1'b0;
defparam \PLL_CLKIN~input .CFG_SLR = 1'b0;
defparam \PLL_CLKIN~input .CFG_OPEN_DRAIN = 1'b0;
defparam \PLL_CLKIN~input .CFG_PDRCTRL = 4'b0010;
defparam \PLL_CLKIN~input .CFG_KEEP = 2'b00;
defparam \PLL_CLKIN~input .CFG_LVDS_OUT_EN = 1'b0;
defparam \PLL_CLKIN~input .CFG_LVDS_SEL_CUA = 2'b00;
defparam \PLL_CLKIN~input .CFG_LVDS_IREF = 10'b0110000000;
defparam \PLL_CLKIN~input .CFG_LVDS_IN_EN = 1'b0;
defparam \PLL_CLKIN~input .DPCLK_DELAY = 4'b0000;
defparam \PLL_CLKIN~input .OUT_DELAY = 1'b0;
defparam \PLL_CLKIN~input .IN_DATA_DELAY = 3'b000;
defparam \PLL_CLKIN~input .IN_REG_DELAY = 3'b000;

alta_slice PLL_ENABLE(
	.A(vcc),
	.B(vcc),
	.C(vcc),
	.D(\rv32.sys_ctrl_pllEnable ),
	.Cin(),
	.Qin(),
	.Clk(),
	.AsyncReset(),
	.SyncReset(),
	.ShiftData(),
	.SyncLoad(),
	.LutOut(\PLL_ENABLE~combout ),
	.Cout(),
	.Q());
defparam PLL_ENABLE.coord_x = 20;
defparam PLL_ENABLE.coord_y = 5;
defparam PLL_ENABLE.coord_z = 14;
defparam PLL_ENABLE.mask = 16'h00FF;
defparam PLL_ENABLE.modeMux = 1'b0;
defparam PLL_ENABLE.FeedbackMux = 1'b0;
defparam PLL_ENABLE.ShiftMux = 1'b0;
defparam PLL_ENABLE.BypassEn = 1'b0;
defparam PLL_ENABLE.CarryEnb = 1'b1;

alta_io_gclk \PLL_ENABLE~clkctrl (
	.inclk(\PLL_ENABLE~combout ),
	.outclk(\PLL_ENABLE~clkctrl_outclk ));
defparam \PLL_ENABLE~clkctrl .coord_x = 22;
defparam \PLL_ENABLE~clkctrl .coord_y = 4;
defparam \PLL_ENABLE~clkctrl .coord_z = 4;

alta_slice PLL_LOCK(
	.A(vcc),
	.B(vcc),
	.C(\pll_inst|auto_generated|pll_lock_sync~q ),
	.D(\auto_generated_inst.hbo_13_83378d4b1997463f_bp ),
	.Cin(),
	.Qin(),
	.Clk(),
	.AsyncReset(),
	.SyncReset(),
	.ShiftData(),
	.SyncLoad(),
	.LutOut(\PLL_LOCK~combout ),
	.Cout(),
	.Q());
defparam PLL_LOCK.coord_x = 20;
defparam PLL_LOCK.coord_y = 5;
defparam PLL_LOCK.coord_z = 1;
defparam PLL_LOCK.mask = 16'hF000;
defparam PLL_LOCK.modeMux = 1'b0;
defparam PLL_LOCK.FeedbackMux = 1'b0;
defparam PLL_LOCK.ShiftMux = 1'b0;
defparam PLL_LOCK.BypassEn = 1'b0;
defparam PLL_LOCK.CarryEnb = 1'b1;

alta_asyncctrl asyncreset_ctrl_X44_Y1_N0(
	.Din(\sys_resetn~clkctrl_outclk ),
	.Dout(\sys_resetn~clkctrl_outclk__AsyncReset_X44_Y1_SIG ));
defparam asyncreset_ctrl_X44_Y1_N0.coord_x = 17;
defparam asyncreset_ctrl_X44_Y1_N0.coord_y = 2;
defparam asyncreset_ctrl_X44_Y1_N0.coord_z = 0;
defparam asyncreset_ctrl_X44_Y1_N0.AsyncCtrlMux = 2'b10;

alta_asyncctrl asyncreset_ctrl_X49_Y1_N0(
	.Din(\PLL_ENABLE~clkctrl_outclk ),
	.Dout(\PLL_ENABLE~clkctrl_outclk__AsyncReset_X49_Y1_SIG ));
defparam asyncreset_ctrl_X49_Y1_N0.coord_x = 20;
defparam asyncreset_ctrl_X49_Y1_N0.coord_y = 5;
defparam asyncreset_ctrl_X49_Y1_N0.coord_z = 0;
defparam asyncreset_ctrl_X49_Y1_N0.AsyncCtrlMux = 2'b10;

alta_asyncctrl asyncreset_ctrl_X57_Y1_N0(
	.Din(\sys_resetn~clkctrl_outclk ),
	.Dout(\sys_resetn~clkctrl_outclk__AsyncReset_X57_Y1_SIG ));
defparam asyncreset_ctrl_X57_Y1_N0.coord_x = 8;
defparam asyncreset_ctrl_X57_Y1_N0.coord_y = 3;
defparam asyncreset_ctrl_X57_Y1_N0.coord_z = 0;
defparam asyncreset_ctrl_X57_Y1_N0.AsyncCtrlMux = 2'b10;

alta_asyncctrl asyncreset_ctrl_X58_Y1_N0(
	.Din(\sys_resetn~clkctrl_outclk ),
	.Dout(\sys_resetn~clkctrl_outclk__AsyncReset_X58_Y1_SIG ));
defparam asyncreset_ctrl_X58_Y1_N0.coord_x = 7;
defparam asyncreset_ctrl_X58_Y1_N0.coord_y = 3;
defparam asyncreset_ctrl_X58_Y1_N0.coord_z = 0;
defparam asyncreset_ctrl_X58_Y1_N0.AsyncCtrlMux = 2'b10;

alta_asyncctrl asyncreset_ctrl_X59_Y1_N0(
	.Din(\sys_resetn~clkctrl_outclk ),
	.Dout(\sys_resetn~clkctrl_outclk__AsyncReset_X59_Y1_SIG ));
defparam asyncreset_ctrl_X59_Y1_N0.coord_x = 6;
defparam asyncreset_ctrl_X59_Y1_N0.coord_y = 2;
defparam asyncreset_ctrl_X59_Y1_N0.coord_z = 0;
defparam asyncreset_ctrl_X59_Y1_N0.AsyncCtrlMux = 2'b10;

alta_asyncctrl asyncreset_ctrl_X59_Y3_N0(
	.Din(\sys_resetn~clkctrl_outclk ),
	.Dout(\sys_resetn~clkctrl_outclk__AsyncReset_X59_Y3_SIG ));
defparam asyncreset_ctrl_X59_Y3_N0.coord_x = 15;
defparam asyncreset_ctrl_X59_Y3_N0.coord_y = 2;
defparam asyncreset_ctrl_X59_Y3_N0.coord_z = 0;
defparam asyncreset_ctrl_X59_Y3_N0.AsyncCtrlMux = 2'b10;

alta_asyncctrl asyncreset_ctrl_X60_Y1_N0(
	.Din(\sys_resetn~clkctrl_outclk ),
	.Dout(\sys_resetn~clkctrl_outclk__AsyncReset_X60_Y1_SIG ));
defparam asyncreset_ctrl_X60_Y1_N0.coord_x = 7;
defparam asyncreset_ctrl_X60_Y1_N0.coord_y = 2;
defparam asyncreset_ctrl_X60_Y1_N0.coord_z = 0;
defparam asyncreset_ctrl_X60_Y1_N0.AsyncCtrlMux = 2'b10;

alta_asyncctrl asyncreset_ctrl_X60_Y2_N1(
	.Din(\sys_resetn~clkctrl_outclk ),
	.Dout(\sys_resetn~clkctrl_outclk__AsyncReset_X60_Y2_SIG ));
defparam asyncreset_ctrl_X60_Y2_N1.coord_x = 16;
defparam asyncreset_ctrl_X60_Y2_N1.coord_y = 1;
defparam asyncreset_ctrl_X60_Y2_N1.coord_z = 1;
defparam asyncreset_ctrl_X60_Y2_N1.AsyncCtrlMux = 2'b10;

alta_asyncctrl asyncreset_ctrl_X60_Y3_N1(
	.Din(\sys_resetn~clkctrl_outclk ),
	.Dout(\sys_resetn~clkctrl_outclk__AsyncReset_X60_Y3_SIG ));
defparam asyncreset_ctrl_X60_Y3_N1.coord_x = 16;
defparam asyncreset_ctrl_X60_Y3_N1.coord_y = 2;
defparam asyncreset_ctrl_X60_Y3_N1.coord_z = 1;
defparam asyncreset_ctrl_X60_Y3_N1.AsyncCtrlMux = 2'b10;

alta_asyncctrl asyncreset_ctrl_X61_Y1_N0(
	.Din(\sys_resetn~clkctrl_outclk ),
	.Dout(\sys_resetn~clkctrl_outclk__AsyncReset_X61_Y1_SIG ));
defparam asyncreset_ctrl_X61_Y1_N0.coord_x = 6;
defparam asyncreset_ctrl_X61_Y1_N0.coord_y = 3;
defparam asyncreset_ctrl_X61_Y1_N0.coord_z = 0;
defparam asyncreset_ctrl_X61_Y1_N0.AsyncCtrlMux = 2'b10;

alta_rio \cart_CLK~input (
	.padio(cart_CLK),
	.datain(gnd),
	.oe(gnd),
	.outclk(gnd),
	.outclkena(vcc),
	.inclk(gnd),
	.inclkena(vcc),
	.areset(gnd),
	.sreset(gnd),
	.combout(\cart_CLK~input_o ),
	.regout());
defparam \cart_CLK~input .coord_x = 0;
defparam \cart_CLK~input .coord_y = 3;
defparam \cart_CLK~input .coord_z = 1;
defparam \cart_CLK~input .IN_ASYNC_MODE = 1'b0;
defparam \cart_CLK~input .IN_SYNC_MODE = 1'b0;
defparam \cart_CLK~input .IN_POWERUP = 1'b0;
defparam \cart_CLK~input .OUT_REG_MODE = 1'b0;
defparam \cart_CLK~input .OUT_ASYNC_MODE = 1'b0;
defparam \cart_CLK~input .OUT_SYNC_MODE = 1'b0;
defparam \cart_CLK~input .OUT_POWERUP = 1'b0;
defparam \cart_CLK~input .OE_REG_MODE = 1'b0;
defparam \cart_CLK~input .OE_ASYNC_MODE = 1'b0;
defparam \cart_CLK~input .OE_SYNC_MODE = 1'b0;
defparam \cart_CLK~input .OE_POWERUP = 1'b0;
defparam \cart_CLK~input .CFG_TRI_INPUT = 1'b0;
defparam \cart_CLK~input .CFG_INPUT_EN = 1'b1;
defparam \cart_CLK~input .CFG_PULL_UP = 1'b0;
defparam \cart_CLK~input .CFG_SLR = 1'b0;
defparam \cart_CLK~input .CFG_OPEN_DRAIN = 1'b0;
defparam \cart_CLK~input .CFG_PDRCTRL = 4'b0100;
defparam \cart_CLK~input .CFG_KEEP = 2'b00;
defparam \cart_CLK~input .CFG_LVDS_OUT_EN = 1'b0;
defparam \cart_CLK~input .CFG_LVDS_SEL_CUA = 2'b00;
defparam \cart_CLK~input .CFG_LVDS_IREF = 10'b0110000000;
defparam \cart_CLK~input .CFG_LVDS_IN_EN = 1'b0;
defparam \cart_CLK~input .DPCLK_DELAY = 4'b0000;
defparam \cart_CLK~input .OUT_DELAY = 1'b0;
defparam \cart_CLK~input .IN_DATA_DELAY = 3'b000;
defparam \cart_CLK~input .IN_REG_DELAY = 3'b000;

alta_rio \cart_a[0]~output (
	.padio(cart_a[0]),
	.datain(gnd),
	.oe(gnd),
	.outclk(gnd),
	.outclkena(vcc),
	.inclk(gnd),
	.inclkena(vcc),
	.areset(gnd),
	.sreset(gnd),
	.combout(\cart_a[0]~input_o ),
	.regout());
defparam \cart_a[0]~output .coord_x = 0;
defparam \cart_a[0]~output .coord_y = 2;
defparam \cart_a[0]~output .coord_z = 4;
defparam \cart_a[0]~output .IN_ASYNC_MODE = 1'b0;
defparam \cart_a[0]~output .IN_SYNC_MODE = 1'b0;
defparam \cart_a[0]~output .IN_POWERUP = 1'b0;
defparam \cart_a[0]~output .OUT_REG_MODE = 1'b0;
defparam \cart_a[0]~output .OUT_ASYNC_MODE = 1'b0;
defparam \cart_a[0]~output .OUT_SYNC_MODE = 1'b0;
defparam \cart_a[0]~output .OUT_POWERUP = 1'b0;
defparam \cart_a[0]~output .OE_REG_MODE = 1'b0;
defparam \cart_a[0]~output .OE_ASYNC_MODE = 1'b0;
defparam \cart_a[0]~output .OE_SYNC_MODE = 1'b0;
defparam \cart_a[0]~output .OE_POWERUP = 1'b0;
defparam \cart_a[0]~output .CFG_TRI_INPUT = 1'b0;
defparam \cart_a[0]~output .CFG_INPUT_EN = 1'b1;
defparam \cart_a[0]~output .CFG_PULL_UP = 1'b0;
defparam \cart_a[0]~output .CFG_SLR = 1'b0;
defparam \cart_a[0]~output .CFG_OPEN_DRAIN = 1'b0;
defparam \cart_a[0]~output .CFG_PDRCTRL = 4'b0100;
defparam \cart_a[0]~output .CFG_KEEP = 2'b00;
defparam \cart_a[0]~output .CFG_LVDS_OUT_EN = 1'b0;
defparam \cart_a[0]~output .CFG_LVDS_SEL_CUA = 2'b00;
defparam \cart_a[0]~output .CFG_LVDS_IREF = 10'b0110000000;
defparam \cart_a[0]~output .CFG_LVDS_IN_EN = 1'b0;
defparam \cart_a[0]~output .DPCLK_DELAY = 4'b0000;
defparam \cart_a[0]~output .OUT_DELAY = 1'b0;
defparam \cart_a[0]~output .IN_DATA_DELAY = 3'b000;
defparam \cart_a[0]~output .IN_REG_DELAY = 3'b000;

alta_rio \cart_a[10]~output (
	.padio(cart_a[10]),
	.datain(gnd),
	.oe(gnd),
	.outclk(gnd),
	.outclkena(vcc),
	.inclk(gnd),
	.inclkena(vcc),
	.areset(gnd),
	.sreset(gnd),
	.combout(\cart_a[10]~input_o ),
	.regout());
defparam \cart_a[10]~output .coord_x = 22;
defparam \cart_a[10]~output .coord_y = 1;
defparam \cart_a[10]~output .coord_z = 0;
defparam \cart_a[10]~output .IN_ASYNC_MODE = 1'b0;
defparam \cart_a[10]~output .IN_SYNC_MODE = 1'b0;
defparam \cart_a[10]~output .IN_POWERUP = 1'b0;
defparam \cart_a[10]~output .OUT_REG_MODE = 1'b0;
defparam \cart_a[10]~output .OUT_ASYNC_MODE = 1'b0;
defparam \cart_a[10]~output .OUT_SYNC_MODE = 1'b0;
defparam \cart_a[10]~output .OUT_POWERUP = 1'b0;
defparam \cart_a[10]~output .OE_REG_MODE = 1'b0;
defparam \cart_a[10]~output .OE_ASYNC_MODE = 1'b0;
defparam \cart_a[10]~output .OE_SYNC_MODE = 1'b0;
defparam \cart_a[10]~output .OE_POWERUP = 1'b0;
defparam \cart_a[10]~output .CFG_TRI_INPUT = 1'b0;
defparam \cart_a[10]~output .CFG_INPUT_EN = 1'b0;
defparam \cart_a[10]~output .CFG_PULL_UP = 1'b0;
defparam \cart_a[10]~output .CFG_SLR = 1'b0;
defparam \cart_a[10]~output .CFG_OPEN_DRAIN = 1'b0;
defparam \cart_a[10]~output .CFG_PDRCTRL = 4'b0100;
defparam \cart_a[10]~output .CFG_KEEP = 2'b00;
defparam \cart_a[10]~output .CFG_LVDS_OUT_EN = 1'b0;
defparam \cart_a[10]~output .CFG_LVDS_SEL_CUA = 2'b00;
defparam \cart_a[10]~output .CFG_LVDS_IREF = 10'b0110000000;
defparam \cart_a[10]~output .CFG_LVDS_IN_EN = 1'b0;
defparam \cart_a[10]~output .DPCLK_DELAY = 4'b0000;
defparam \cart_a[10]~output .OUT_DELAY = 1'b0;
defparam \cart_a[10]~output .IN_DATA_DELAY = 3'b000;
defparam \cart_a[10]~output .IN_REG_DELAY = 3'b000;

alta_rio \cart_a[11]~output (
	.padio(cart_a[11]),
	.datain(gnd),
	.oe(gnd),
	.outclk(gnd),
	.outclkena(vcc),
	.inclk(gnd),
	.inclkena(vcc),
	.areset(gnd),
	.sreset(gnd),
	.combout(\cart_a[11]~input_o ),
	.regout());
defparam \cart_a[11]~output .coord_x = 22;
defparam \cart_a[11]~output .coord_y = 2;
defparam \cart_a[11]~output .coord_z = 5;
defparam \cart_a[11]~output .IN_ASYNC_MODE = 1'b0;
defparam \cart_a[11]~output .IN_SYNC_MODE = 1'b0;
defparam \cart_a[11]~output .IN_POWERUP = 1'b0;
defparam \cart_a[11]~output .OUT_REG_MODE = 1'b0;
defparam \cart_a[11]~output .OUT_ASYNC_MODE = 1'b0;
defparam \cart_a[11]~output .OUT_SYNC_MODE = 1'b0;
defparam \cart_a[11]~output .OUT_POWERUP = 1'b0;
defparam \cart_a[11]~output .OE_REG_MODE = 1'b0;
defparam \cart_a[11]~output .OE_ASYNC_MODE = 1'b0;
defparam \cart_a[11]~output .OE_SYNC_MODE = 1'b0;
defparam \cart_a[11]~output .OE_POWERUP = 1'b0;
defparam \cart_a[11]~output .CFG_TRI_INPUT = 1'b0;
defparam \cart_a[11]~output .CFG_INPUT_EN = 1'b0;
defparam \cart_a[11]~output .CFG_PULL_UP = 1'b0;
defparam \cart_a[11]~output .CFG_SLR = 1'b0;
defparam \cart_a[11]~output .CFG_OPEN_DRAIN = 1'b0;
defparam \cart_a[11]~output .CFG_PDRCTRL = 4'b0100;
defparam \cart_a[11]~output .CFG_KEEP = 2'b00;
defparam \cart_a[11]~output .CFG_LVDS_OUT_EN = 1'b0;
defparam \cart_a[11]~output .CFG_LVDS_SEL_CUA = 2'b00;
defparam \cart_a[11]~output .CFG_LVDS_IREF = 10'b0110000000;
defparam \cart_a[11]~output .CFG_LVDS_IN_EN = 1'b0;
defparam \cart_a[11]~output .DPCLK_DELAY = 4'b0000;
defparam \cart_a[11]~output .OUT_DELAY = 1'b0;
defparam \cart_a[11]~output .IN_DATA_DELAY = 3'b000;
defparam \cart_a[11]~output .IN_REG_DELAY = 3'b000;

alta_rio \cart_a[12]~output (
	.padio(cart_a[12]),
	.datain(gnd),
	.oe(gnd),
	.outclk(gnd),
	.outclkena(vcc),
	.inclk(gnd),
	.inclkena(vcc),
	.areset(gnd),
	.sreset(gnd),
	.combout(\cart_a[12]~input_o ),
	.regout());
defparam \cart_a[12]~output .coord_x = 22;
defparam \cart_a[12]~output .coord_y = 2;
defparam \cart_a[12]~output .coord_z = 3;
defparam \cart_a[12]~output .IN_ASYNC_MODE = 1'b0;
defparam \cart_a[12]~output .IN_SYNC_MODE = 1'b0;
defparam \cart_a[12]~output .IN_POWERUP = 1'b0;
defparam \cart_a[12]~output .OUT_REG_MODE = 1'b0;
defparam \cart_a[12]~output .OUT_ASYNC_MODE = 1'b0;
defparam \cart_a[12]~output .OUT_SYNC_MODE = 1'b0;
defparam \cart_a[12]~output .OUT_POWERUP = 1'b0;
defparam \cart_a[12]~output .OE_REG_MODE = 1'b0;
defparam \cart_a[12]~output .OE_ASYNC_MODE = 1'b0;
defparam \cart_a[12]~output .OE_SYNC_MODE = 1'b0;
defparam \cart_a[12]~output .OE_POWERUP = 1'b0;
defparam \cart_a[12]~output .CFG_TRI_INPUT = 1'b0;
defparam \cart_a[12]~output .CFG_INPUT_EN = 1'b0;
defparam \cart_a[12]~output .CFG_PULL_UP = 1'b0;
defparam \cart_a[12]~output .CFG_SLR = 1'b0;
defparam \cart_a[12]~output .CFG_OPEN_DRAIN = 1'b0;
defparam \cart_a[12]~output .CFG_PDRCTRL = 4'b0100;
defparam \cart_a[12]~output .CFG_KEEP = 2'b00;
defparam \cart_a[12]~output .CFG_LVDS_OUT_EN = 1'b0;
defparam \cart_a[12]~output .CFG_LVDS_SEL_CUA = 2'b00;
defparam \cart_a[12]~output .CFG_LVDS_IREF = 10'b0110000000;
defparam \cart_a[12]~output .CFG_LVDS_IN_EN = 1'b0;
defparam \cart_a[12]~output .DPCLK_DELAY = 4'b0000;
defparam \cart_a[12]~output .OUT_DELAY = 1'b0;
defparam \cart_a[12]~output .IN_DATA_DELAY = 3'b000;
defparam \cart_a[12]~output .IN_REG_DELAY = 3'b000;

alta_rio \cart_a[13]~output (
	.padio(cart_a[13]),
	.datain(gnd),
	.oe(gnd),
	.outclk(gnd),
	.outclkena(vcc),
	.inclk(gnd),
	.inclkena(vcc),
	.areset(gnd),
	.sreset(gnd),
	.combout(\cart_a[13]~input_o ),
	.regout());
defparam \cart_a[13]~output .coord_x = 22;
defparam \cart_a[13]~output .coord_y = 3;
defparam \cart_a[13]~output .coord_z = 3;
defparam \cart_a[13]~output .IN_ASYNC_MODE = 1'b0;
defparam \cart_a[13]~output .IN_SYNC_MODE = 1'b0;
defparam \cart_a[13]~output .IN_POWERUP = 1'b0;
defparam \cart_a[13]~output .OUT_REG_MODE = 1'b0;
defparam \cart_a[13]~output .OUT_ASYNC_MODE = 1'b0;
defparam \cart_a[13]~output .OUT_SYNC_MODE = 1'b0;
defparam \cart_a[13]~output .OUT_POWERUP = 1'b0;
defparam \cart_a[13]~output .OE_REG_MODE = 1'b0;
defparam \cart_a[13]~output .OE_ASYNC_MODE = 1'b0;
defparam \cart_a[13]~output .OE_SYNC_MODE = 1'b0;
defparam \cart_a[13]~output .OE_POWERUP = 1'b0;
defparam \cart_a[13]~output .CFG_TRI_INPUT = 1'b0;
defparam \cart_a[13]~output .CFG_INPUT_EN = 1'b1;
defparam \cart_a[13]~output .CFG_PULL_UP = 1'b0;
defparam \cart_a[13]~output .CFG_SLR = 1'b0;
defparam \cart_a[13]~output .CFG_OPEN_DRAIN = 1'b0;
defparam \cart_a[13]~output .CFG_PDRCTRL = 4'b0100;
defparam \cart_a[13]~output .CFG_KEEP = 2'b00;
defparam \cart_a[13]~output .CFG_LVDS_OUT_EN = 1'b0;
defparam \cart_a[13]~output .CFG_LVDS_SEL_CUA = 2'b00;
defparam \cart_a[13]~output .CFG_LVDS_IREF = 10'b0110000000;
defparam \cart_a[13]~output .CFG_LVDS_IN_EN = 1'b0;
defparam \cart_a[13]~output .DPCLK_DELAY = 4'b0000;
defparam \cart_a[13]~output .OUT_DELAY = 1'b0;
defparam \cart_a[13]~output .IN_DATA_DELAY = 3'b000;
defparam \cart_a[13]~output .IN_REG_DELAY = 3'b000;

alta_rio \cart_a[14]~output (
	.padio(cart_a[14]),
	.datain(gnd),
	.oe(gnd),
	.outclk(gnd),
	.outclkena(vcc),
	.inclk(gnd),
	.inclkena(vcc),
	.areset(gnd),
	.sreset(gnd),
	.combout(\cart_a[14]~input_o ),
	.regout());
defparam \cart_a[14]~output .coord_x = 20;
defparam \cart_a[14]~output .coord_y = 13;
defparam \cart_a[14]~output .coord_z = 2;
defparam \cart_a[14]~output .IN_ASYNC_MODE = 1'b0;
defparam \cart_a[14]~output .IN_SYNC_MODE = 1'b0;
defparam \cart_a[14]~output .IN_POWERUP = 1'b0;
defparam \cart_a[14]~output .OUT_REG_MODE = 1'b0;
defparam \cart_a[14]~output .OUT_ASYNC_MODE = 1'b0;
defparam \cart_a[14]~output .OUT_SYNC_MODE = 1'b0;
defparam \cart_a[14]~output .OUT_POWERUP = 1'b0;
defparam \cart_a[14]~output .OE_REG_MODE = 1'b0;
defparam \cart_a[14]~output .OE_ASYNC_MODE = 1'b0;
defparam \cart_a[14]~output .OE_SYNC_MODE = 1'b0;
defparam \cart_a[14]~output .OE_POWERUP = 1'b0;
defparam \cart_a[14]~output .CFG_TRI_INPUT = 1'b0;
defparam \cart_a[14]~output .CFG_INPUT_EN = 1'b1;
defparam \cart_a[14]~output .CFG_PULL_UP = 1'b0;
defparam \cart_a[14]~output .CFG_SLR = 1'b0;
defparam \cart_a[14]~output .CFG_OPEN_DRAIN = 1'b0;
defparam \cart_a[14]~output .CFG_PDRCTRL = 4'b0100;
defparam \cart_a[14]~output .CFG_KEEP = 2'b00;
defparam \cart_a[14]~output .CFG_LVDS_OUT_EN = 1'b0;
defparam \cart_a[14]~output .CFG_LVDS_SEL_CUA = 2'b00;
defparam \cart_a[14]~output .CFG_LVDS_IREF = 10'b0110000000;
defparam \cart_a[14]~output .CFG_LVDS_IN_EN = 1'b0;
defparam \cart_a[14]~output .DPCLK_DELAY = 4'b0000;
defparam \cart_a[14]~output .OUT_DELAY = 1'b0;
defparam \cart_a[14]~output .IN_DATA_DELAY = 3'b000;
defparam \cart_a[14]~output .IN_REG_DELAY = 3'b000;

alta_rio \cart_a[15]~output (
	.padio(cart_a[15]),
	.datain(gnd),
	.oe(gnd),
	.outclk(gnd),
	.outclkena(vcc),
	.inclk(gnd),
	.inclkena(vcc),
	.areset(gnd),
	.sreset(gnd),
	.combout(\cart_a[15]~input_o ),
	.regout());
defparam \cart_a[15]~output .coord_x = 20;
defparam \cart_a[15]~output .coord_y = 13;
defparam \cart_a[15]~output .coord_z = 3;
defparam \cart_a[15]~output .IN_ASYNC_MODE = 1'b0;
defparam \cart_a[15]~output .IN_SYNC_MODE = 1'b0;
defparam \cart_a[15]~output .IN_POWERUP = 1'b0;
defparam \cart_a[15]~output .OUT_REG_MODE = 1'b0;
defparam \cart_a[15]~output .OUT_ASYNC_MODE = 1'b0;
defparam \cart_a[15]~output .OUT_SYNC_MODE = 1'b0;
defparam \cart_a[15]~output .OUT_POWERUP = 1'b0;
defparam \cart_a[15]~output .OE_REG_MODE = 1'b0;
defparam \cart_a[15]~output .OE_ASYNC_MODE = 1'b0;
defparam \cart_a[15]~output .OE_SYNC_MODE = 1'b0;
defparam \cart_a[15]~output .OE_POWERUP = 1'b0;
defparam \cart_a[15]~output .CFG_TRI_INPUT = 1'b0;
defparam \cart_a[15]~output .CFG_INPUT_EN = 1'b1;
defparam \cart_a[15]~output .CFG_PULL_UP = 1'b0;
defparam \cart_a[15]~output .CFG_SLR = 1'b0;
defparam \cart_a[15]~output .CFG_OPEN_DRAIN = 1'b0;
defparam \cart_a[15]~output .CFG_PDRCTRL = 4'b0100;
defparam \cart_a[15]~output .CFG_KEEP = 2'b00;
defparam \cart_a[15]~output .CFG_LVDS_OUT_EN = 1'b0;
defparam \cart_a[15]~output .CFG_LVDS_SEL_CUA = 2'b00;
defparam \cart_a[15]~output .CFG_LVDS_IREF = 10'b0110000000;
defparam \cart_a[15]~output .CFG_LVDS_IN_EN = 1'b0;
defparam \cart_a[15]~output .DPCLK_DELAY = 4'b0000;
defparam \cart_a[15]~output .OUT_DELAY = 1'b0;
defparam \cart_a[15]~output .IN_DATA_DELAY = 3'b000;
defparam \cart_a[15]~output .IN_REG_DELAY = 3'b000;

alta_rio \cart_a[1]~output (
	.padio(cart_a[1]),
	.datain(gnd),
	.oe(gnd),
	.outclk(gnd),
	.outclkena(vcc),
	.inclk(gnd),
	.inclkena(vcc),
	.areset(gnd),
	.sreset(gnd),
	.combout(\cart_a[1]~input_o ),
	.regout());
defparam \cart_a[1]~output .coord_x = 0;
defparam \cart_a[1]~output .coord_y = 1;
defparam \cart_a[1]~output .coord_z = 2;
defparam \cart_a[1]~output .IN_ASYNC_MODE = 1'b0;
defparam \cart_a[1]~output .IN_SYNC_MODE = 1'b0;
defparam \cart_a[1]~output .IN_POWERUP = 1'b0;
defparam \cart_a[1]~output .OUT_REG_MODE = 1'b0;
defparam \cart_a[1]~output .OUT_ASYNC_MODE = 1'b0;
defparam \cart_a[1]~output .OUT_SYNC_MODE = 1'b0;
defparam \cart_a[1]~output .OUT_POWERUP = 1'b0;
defparam \cart_a[1]~output .OE_REG_MODE = 1'b0;
defparam \cart_a[1]~output .OE_ASYNC_MODE = 1'b0;
defparam \cart_a[1]~output .OE_SYNC_MODE = 1'b0;
defparam \cart_a[1]~output .OE_POWERUP = 1'b0;
defparam \cart_a[1]~output .CFG_TRI_INPUT = 1'b0;
defparam \cart_a[1]~output .CFG_INPUT_EN = 1'b1;
defparam \cart_a[1]~output .CFG_PULL_UP = 1'b0;
defparam \cart_a[1]~output .CFG_SLR = 1'b0;
defparam \cart_a[1]~output .CFG_OPEN_DRAIN = 1'b0;
defparam \cart_a[1]~output .CFG_PDRCTRL = 4'b0100;
defparam \cart_a[1]~output .CFG_KEEP = 2'b00;
defparam \cart_a[1]~output .CFG_LVDS_OUT_EN = 1'b0;
defparam \cart_a[1]~output .CFG_LVDS_SEL_CUA = 2'b00;
defparam \cart_a[1]~output .CFG_LVDS_IREF = 10'b0110000000;
defparam \cart_a[1]~output .CFG_LVDS_IN_EN = 1'b0;
defparam \cart_a[1]~output .DPCLK_DELAY = 4'b0000;
defparam \cart_a[1]~output .OUT_DELAY = 1'b0;
defparam \cart_a[1]~output .IN_DATA_DELAY = 3'b000;
defparam \cart_a[1]~output .IN_REG_DELAY = 3'b000;

alta_rio \cart_a[2]~output (
	.padio(cart_a[2]),
	.datain(gnd),
	.oe(gnd),
	.outclk(gnd),
	.outclkena(vcc),
	.inclk(gnd),
	.inclkena(vcc),
	.areset(gnd),
	.sreset(gnd),
	.combout(\cart_a[2]~input_o ),
	.regout());
defparam \cart_a[2]~output .coord_x = 0;
defparam \cart_a[2]~output .coord_y = 1;
defparam \cart_a[2]~output .coord_z = 3;
defparam \cart_a[2]~output .IN_ASYNC_MODE = 1'b0;
defparam \cart_a[2]~output .IN_SYNC_MODE = 1'b0;
defparam \cart_a[2]~output .IN_POWERUP = 1'b0;
defparam \cart_a[2]~output .OUT_REG_MODE = 1'b0;
defparam \cart_a[2]~output .OUT_ASYNC_MODE = 1'b0;
defparam \cart_a[2]~output .OUT_SYNC_MODE = 1'b0;
defparam \cart_a[2]~output .OUT_POWERUP = 1'b0;
defparam \cart_a[2]~output .OE_REG_MODE = 1'b0;
defparam \cart_a[2]~output .OE_ASYNC_MODE = 1'b0;
defparam \cart_a[2]~output .OE_SYNC_MODE = 1'b0;
defparam \cart_a[2]~output .OE_POWERUP = 1'b0;
defparam \cart_a[2]~output .CFG_TRI_INPUT = 1'b0;
defparam \cart_a[2]~output .CFG_INPUT_EN = 1'b1;
defparam \cart_a[2]~output .CFG_PULL_UP = 1'b0;
defparam \cart_a[2]~output .CFG_SLR = 1'b0;
defparam \cart_a[2]~output .CFG_OPEN_DRAIN = 1'b0;
defparam \cart_a[2]~output .CFG_PDRCTRL = 4'b0100;
defparam \cart_a[2]~output .CFG_KEEP = 2'b00;
defparam \cart_a[2]~output .CFG_LVDS_OUT_EN = 1'b0;
defparam \cart_a[2]~output .CFG_LVDS_SEL_CUA = 2'b00;
defparam \cart_a[2]~output .CFG_LVDS_IREF = 10'b0110000000;
defparam \cart_a[2]~output .CFG_LVDS_IN_EN = 1'b0;
defparam \cart_a[2]~output .DPCLK_DELAY = 4'b0000;
defparam \cart_a[2]~output .OUT_DELAY = 1'b0;
defparam \cart_a[2]~output .IN_DATA_DELAY = 3'b000;
defparam \cart_a[2]~output .IN_REG_DELAY = 3'b000;

alta_rio \cart_a[3]~output (
	.padio(cart_a[3]),
	.datain(gnd),
	.oe(gnd),
	.outclk(gnd),
	.outclkena(vcc),
	.inclk(gnd),
	.inclkena(vcc),
	.areset(gnd),
	.sreset(gnd),
	.combout(\cart_a[3]~input_o ),
	.regout());
defparam \cart_a[3]~output .coord_x = 1;
defparam \cart_a[3]~output .coord_y = 0;
defparam \cart_a[3]~output .coord_z = 1;
defparam \cart_a[3]~output .IN_ASYNC_MODE = 1'b0;
defparam \cart_a[3]~output .IN_SYNC_MODE = 1'b0;
defparam \cart_a[3]~output .IN_POWERUP = 1'b0;
defparam \cart_a[3]~output .OUT_REG_MODE = 1'b0;
defparam \cart_a[3]~output .OUT_ASYNC_MODE = 1'b0;
defparam \cart_a[3]~output .OUT_SYNC_MODE = 1'b0;
defparam \cart_a[3]~output .OUT_POWERUP = 1'b0;
defparam \cart_a[3]~output .OE_REG_MODE = 1'b0;
defparam \cart_a[3]~output .OE_ASYNC_MODE = 1'b0;
defparam \cart_a[3]~output .OE_SYNC_MODE = 1'b0;
defparam \cart_a[3]~output .OE_POWERUP = 1'b0;
defparam \cart_a[3]~output .CFG_TRI_INPUT = 1'b0;
defparam \cart_a[3]~output .CFG_INPUT_EN = 1'b1;
defparam \cart_a[3]~output .CFG_PULL_UP = 1'b0;
defparam \cart_a[3]~output .CFG_SLR = 1'b0;
defparam \cart_a[3]~output .CFG_OPEN_DRAIN = 1'b0;
defparam \cart_a[3]~output .CFG_PDRCTRL = 4'b0100;
defparam \cart_a[3]~output .CFG_KEEP = 2'b00;
defparam \cart_a[3]~output .CFG_LVDS_OUT_EN = 1'b0;
defparam \cart_a[3]~output .CFG_LVDS_SEL_CUA = 2'b00;
defparam \cart_a[3]~output .CFG_LVDS_IREF = 10'b0110000000;
defparam \cart_a[3]~output .CFG_LVDS_IN_EN = 1'b0;
defparam \cart_a[3]~output .DPCLK_DELAY = 4'b0000;
defparam \cart_a[3]~output .OUT_DELAY = 1'b0;
defparam \cart_a[3]~output .IN_DATA_DELAY = 3'b000;
defparam \cart_a[3]~output .IN_REG_DELAY = 3'b000;

alta_rio \cart_a[4]~output (
	.padio(cart_a[4]),
	.datain(gnd),
	.oe(gnd),
	.outclk(gnd),
	.outclkena(vcc),
	.inclk(gnd),
	.inclkena(vcc),
	.areset(gnd),
	.sreset(gnd),
	.combout(\cart_a[4]~input_o ),
	.regout());
defparam \cart_a[4]~output .coord_x = 8;
defparam \cart_a[4]~output .coord_y = 0;
defparam \cart_a[4]~output .coord_z = 1;
defparam \cart_a[4]~output .IN_ASYNC_MODE = 1'b0;
defparam \cart_a[4]~output .IN_SYNC_MODE = 1'b0;
defparam \cart_a[4]~output .IN_POWERUP = 1'b0;
defparam \cart_a[4]~output .OUT_REG_MODE = 1'b0;
defparam \cart_a[4]~output .OUT_ASYNC_MODE = 1'b0;
defparam \cart_a[4]~output .OUT_SYNC_MODE = 1'b0;
defparam \cart_a[4]~output .OUT_POWERUP = 1'b0;
defparam \cart_a[4]~output .OE_REG_MODE = 1'b0;
defparam \cart_a[4]~output .OE_ASYNC_MODE = 1'b0;
defparam \cart_a[4]~output .OE_SYNC_MODE = 1'b0;
defparam \cart_a[4]~output .OE_POWERUP = 1'b0;
defparam \cart_a[4]~output .CFG_TRI_INPUT = 1'b0;
defparam \cart_a[4]~output .CFG_INPUT_EN = 1'b1;
defparam \cart_a[4]~output .CFG_PULL_UP = 1'b0;
defparam \cart_a[4]~output .CFG_SLR = 1'b0;
defparam \cart_a[4]~output .CFG_OPEN_DRAIN = 1'b0;
defparam \cart_a[4]~output .CFG_PDRCTRL = 4'b0100;
defparam \cart_a[4]~output .CFG_KEEP = 2'b00;
defparam \cart_a[4]~output .CFG_LVDS_OUT_EN = 1'b0;
defparam \cart_a[4]~output .CFG_LVDS_SEL_CUA = 2'b00;
defparam \cart_a[4]~output .CFG_LVDS_IREF = 10'b0110000000;
defparam \cart_a[4]~output .CFG_LVDS_IN_EN = 1'b0;
defparam \cart_a[4]~output .DPCLK_DELAY = 4'b0000;
defparam \cart_a[4]~output .OUT_DELAY = 1'b0;
defparam \cart_a[4]~output .IN_DATA_DELAY = 3'b000;
defparam \cart_a[4]~output .IN_REG_DELAY = 3'b000;

alta_rio \cart_a[5]~output (
	.padio(cart_a[5]),
	.datain(gnd),
	.oe(gnd),
	.outclk(gnd),
	.outclkena(vcc),
	.inclk(gnd),
	.inclkena(vcc),
	.areset(gnd),
	.sreset(gnd),
	.combout(\cart_a[5]~input_o ),
	.regout());
defparam \cart_a[5]~output .coord_x = 8;
defparam \cart_a[5]~output .coord_y = 0;
defparam \cart_a[5]~output .coord_z = 2;
defparam \cart_a[5]~output .IN_ASYNC_MODE = 1'b0;
defparam \cart_a[5]~output .IN_SYNC_MODE = 1'b0;
defparam \cart_a[5]~output .IN_POWERUP = 1'b0;
defparam \cart_a[5]~output .OUT_REG_MODE = 1'b0;
defparam \cart_a[5]~output .OUT_ASYNC_MODE = 1'b0;
defparam \cart_a[5]~output .OUT_SYNC_MODE = 1'b0;
defparam \cart_a[5]~output .OUT_POWERUP = 1'b0;
defparam \cart_a[5]~output .OE_REG_MODE = 1'b0;
defparam \cart_a[5]~output .OE_ASYNC_MODE = 1'b0;
defparam \cart_a[5]~output .OE_SYNC_MODE = 1'b0;
defparam \cart_a[5]~output .OE_POWERUP = 1'b0;
defparam \cart_a[5]~output .CFG_TRI_INPUT = 1'b0;
defparam \cart_a[5]~output .CFG_INPUT_EN = 1'b1;
defparam \cart_a[5]~output .CFG_PULL_UP = 1'b0;
defparam \cart_a[5]~output .CFG_SLR = 1'b0;
defparam \cart_a[5]~output .CFG_OPEN_DRAIN = 1'b0;
defparam \cart_a[5]~output .CFG_PDRCTRL = 4'b0100;
defparam \cart_a[5]~output .CFG_KEEP = 2'b00;
defparam \cart_a[5]~output .CFG_LVDS_OUT_EN = 1'b0;
defparam \cart_a[5]~output .CFG_LVDS_SEL_CUA = 2'b00;
defparam \cart_a[5]~output .CFG_LVDS_IREF = 10'b0110000000;
defparam \cart_a[5]~output .CFG_LVDS_IN_EN = 1'b0;
defparam \cart_a[5]~output .DPCLK_DELAY = 4'b0000;
defparam \cart_a[5]~output .OUT_DELAY = 1'b0;
defparam \cart_a[5]~output .IN_DATA_DELAY = 3'b000;
defparam \cart_a[5]~output .IN_REG_DELAY = 3'b000;

alta_rio \cart_a[6]~output (
	.padio(cart_a[6]),
	.datain(gnd),
	.oe(gnd),
	.outclk(gnd),
	.outclkena(vcc),
	.inclk(gnd),
	.inclkena(vcc),
	.areset(gnd),
	.sreset(gnd),
	.combout(\cart_a[6]~input_o ),
	.regout());
defparam \cart_a[6]~output .coord_x = 8;
defparam \cart_a[6]~output .coord_y = 0;
defparam \cart_a[6]~output .coord_z = 3;
defparam \cart_a[6]~output .IN_ASYNC_MODE = 1'b0;
defparam \cart_a[6]~output .IN_SYNC_MODE = 1'b0;
defparam \cart_a[6]~output .IN_POWERUP = 1'b0;
defparam \cart_a[6]~output .OUT_REG_MODE = 1'b0;
defparam \cart_a[6]~output .OUT_ASYNC_MODE = 1'b0;
defparam \cart_a[6]~output .OUT_SYNC_MODE = 1'b0;
defparam \cart_a[6]~output .OUT_POWERUP = 1'b0;
defparam \cart_a[6]~output .OE_REG_MODE = 1'b0;
defparam \cart_a[6]~output .OE_ASYNC_MODE = 1'b0;
defparam \cart_a[6]~output .OE_SYNC_MODE = 1'b0;
defparam \cart_a[6]~output .OE_POWERUP = 1'b0;
defparam \cart_a[6]~output .CFG_TRI_INPUT = 1'b0;
defparam \cart_a[6]~output .CFG_INPUT_EN = 1'b1;
defparam \cart_a[6]~output .CFG_PULL_UP = 1'b0;
defparam \cart_a[6]~output .CFG_SLR = 1'b0;
defparam \cart_a[6]~output .CFG_OPEN_DRAIN = 1'b0;
defparam \cart_a[6]~output .CFG_PDRCTRL = 4'b0100;
defparam \cart_a[6]~output .CFG_KEEP = 2'b00;
defparam \cart_a[6]~output .CFG_LVDS_OUT_EN = 1'b0;
defparam \cart_a[6]~output .CFG_LVDS_SEL_CUA = 2'b00;
defparam \cart_a[6]~output .CFG_LVDS_IREF = 10'b0110000000;
defparam \cart_a[6]~output .CFG_LVDS_IN_EN = 1'b0;
defparam \cart_a[6]~output .DPCLK_DELAY = 4'b0000;
defparam \cart_a[6]~output .OUT_DELAY = 1'b0;
defparam \cart_a[6]~output .IN_DATA_DELAY = 3'b000;
defparam \cart_a[6]~output .IN_REG_DELAY = 3'b000;

alta_rio \cart_a[7]~output (
	.padio(cart_a[7]),
	.datain(gnd),
	.oe(gnd),
	.outclk(gnd),
	.outclkena(vcc),
	.inclk(gnd),
	.inclkena(vcc),
	.areset(gnd),
	.sreset(gnd),
	.combout(\cart_a[7]~input_o ),
	.regout());
defparam \cart_a[7]~output .coord_x = 17;
defparam \cart_a[7]~output .coord_y = 0;
defparam \cart_a[7]~output .coord_z = 2;
defparam \cart_a[7]~output .IN_ASYNC_MODE = 1'b0;
defparam \cart_a[7]~output .IN_SYNC_MODE = 1'b0;
defparam \cart_a[7]~output .IN_POWERUP = 1'b0;
defparam \cart_a[7]~output .OUT_REG_MODE = 1'b0;
defparam \cart_a[7]~output .OUT_ASYNC_MODE = 1'b0;
defparam \cart_a[7]~output .OUT_SYNC_MODE = 1'b0;
defparam \cart_a[7]~output .OUT_POWERUP = 1'b0;
defparam \cart_a[7]~output .OE_REG_MODE = 1'b0;
defparam \cart_a[7]~output .OE_ASYNC_MODE = 1'b0;
defparam \cart_a[7]~output .OE_SYNC_MODE = 1'b0;
defparam \cart_a[7]~output .OE_POWERUP = 1'b0;
defparam \cart_a[7]~output .CFG_TRI_INPUT = 1'b0;
defparam \cart_a[7]~output .CFG_INPUT_EN = 1'b0;
defparam \cart_a[7]~output .CFG_PULL_UP = 1'b0;
defparam \cart_a[7]~output .CFG_SLR = 1'b0;
defparam \cart_a[7]~output .CFG_OPEN_DRAIN = 1'b0;
defparam \cart_a[7]~output .CFG_PDRCTRL = 4'b0100;
defparam \cart_a[7]~output .CFG_KEEP = 2'b00;
defparam \cart_a[7]~output .CFG_LVDS_OUT_EN = 1'b0;
defparam \cart_a[7]~output .CFG_LVDS_SEL_CUA = 2'b00;
defparam \cart_a[7]~output .CFG_LVDS_IREF = 10'b0110000000;
defparam \cart_a[7]~output .CFG_LVDS_IN_EN = 1'b0;
defparam \cart_a[7]~output .DPCLK_DELAY = 4'b0000;
defparam \cart_a[7]~output .OUT_DELAY = 1'b0;
defparam \cart_a[7]~output .IN_DATA_DELAY = 3'b000;
defparam \cart_a[7]~output .IN_REG_DELAY = 3'b000;

alta_rio \cart_a[8]~output (
	.padio(cart_a[8]),
	.datain(gnd),
	.oe(gnd),
	.outclk(gnd),
	.outclkena(vcc),
	.inclk(gnd),
	.inclkena(vcc),
	.areset(gnd),
	.sreset(gnd),
	.combout(\cart_a[8]~input_o ),
	.regout());
defparam \cart_a[8]~output .coord_x = 18;
defparam \cart_a[8]~output .coord_y = 0;
defparam \cart_a[8]~output .coord_z = 0;
defparam \cart_a[8]~output .IN_ASYNC_MODE = 1'b0;
defparam \cart_a[8]~output .IN_SYNC_MODE = 1'b0;
defparam \cart_a[8]~output .IN_POWERUP = 1'b0;
defparam \cart_a[8]~output .OUT_REG_MODE = 1'b0;
defparam \cart_a[8]~output .OUT_ASYNC_MODE = 1'b0;
defparam \cart_a[8]~output .OUT_SYNC_MODE = 1'b0;
defparam \cart_a[8]~output .OUT_POWERUP = 1'b0;
defparam \cart_a[8]~output .OE_REG_MODE = 1'b0;
defparam \cart_a[8]~output .OE_ASYNC_MODE = 1'b0;
defparam \cart_a[8]~output .OE_SYNC_MODE = 1'b0;
defparam \cart_a[8]~output .OE_POWERUP = 1'b0;
defparam \cart_a[8]~output .CFG_TRI_INPUT = 1'b0;
defparam \cart_a[8]~output .CFG_INPUT_EN = 1'b0;
defparam \cart_a[8]~output .CFG_PULL_UP = 1'b0;
defparam \cart_a[8]~output .CFG_SLR = 1'b0;
defparam \cart_a[8]~output .CFG_OPEN_DRAIN = 1'b0;
defparam \cart_a[8]~output .CFG_PDRCTRL = 4'b0100;
defparam \cart_a[8]~output .CFG_KEEP = 2'b00;
defparam \cart_a[8]~output .CFG_LVDS_OUT_EN = 1'b0;
defparam \cart_a[8]~output .CFG_LVDS_SEL_CUA = 2'b00;
defparam \cart_a[8]~output .CFG_LVDS_IREF = 10'b0110000000;
defparam \cart_a[8]~output .CFG_LVDS_IN_EN = 1'b0;
defparam \cart_a[8]~output .DPCLK_DELAY = 4'b0000;
defparam \cart_a[8]~output .OUT_DELAY = 1'b0;
defparam \cart_a[8]~output .IN_DATA_DELAY = 3'b000;
defparam \cart_a[8]~output .IN_REG_DELAY = 3'b000;

alta_rio \cart_a[9]~output (
	.padio(cart_a[9]),
	.datain(gnd),
	.oe(gnd),
	.outclk(gnd),
	.outclkena(vcc),
	.inclk(gnd),
	.inclkena(vcc),
	.areset(gnd),
	.sreset(gnd),
	.combout(\cart_a[9]~input_o ),
	.regout());
defparam \cart_a[9]~output .coord_x = 22;
defparam \cart_a[9]~output .coord_y = 1;
defparam \cart_a[9]~output .coord_z = 2;
defparam \cart_a[9]~output .IN_ASYNC_MODE = 1'b0;
defparam \cart_a[9]~output .IN_SYNC_MODE = 1'b0;
defparam \cart_a[9]~output .IN_POWERUP = 1'b0;
defparam \cart_a[9]~output .OUT_REG_MODE = 1'b0;
defparam \cart_a[9]~output .OUT_ASYNC_MODE = 1'b0;
defparam \cart_a[9]~output .OUT_SYNC_MODE = 1'b0;
defparam \cart_a[9]~output .OUT_POWERUP = 1'b0;
defparam \cart_a[9]~output .OE_REG_MODE = 1'b0;
defparam \cart_a[9]~output .OE_ASYNC_MODE = 1'b0;
defparam \cart_a[9]~output .OE_SYNC_MODE = 1'b0;
defparam \cart_a[9]~output .OE_POWERUP = 1'b0;
defparam \cart_a[9]~output .CFG_TRI_INPUT = 1'b0;
defparam \cart_a[9]~output .CFG_INPUT_EN = 1'b0;
defparam \cart_a[9]~output .CFG_PULL_UP = 1'b0;
defparam \cart_a[9]~output .CFG_SLR = 1'b0;
defparam \cart_a[9]~output .CFG_OPEN_DRAIN = 1'b0;
defparam \cart_a[9]~output .CFG_PDRCTRL = 4'b0100;
defparam \cart_a[9]~output .CFG_KEEP = 2'b00;
defparam \cart_a[9]~output .CFG_LVDS_OUT_EN = 1'b0;
defparam \cart_a[9]~output .CFG_LVDS_SEL_CUA = 2'b00;
defparam \cart_a[9]~output .CFG_LVDS_IREF = 10'b0110000000;
defparam \cart_a[9]~output .CFG_LVDS_IN_EN = 1'b0;
defparam \cart_a[9]~output .DPCLK_DELAY = 4'b0000;
defparam \cart_a[9]~output .OUT_DELAY = 1'b0;
defparam \cart_a[9]~output .IN_DATA_DELAY = 3'b000;
defparam \cart_a[9]~output .IN_REG_DELAY = 3'b000;

alta_rio \cart_d[0]~output (
	.padio(cart_d[0]),
	.datain(\macro_inst|gbdreg|Reg_OutputData [0]),
	.oe(\macro_inst|gbdreg|Reg_OutputValid~q ),
	.outclk(gnd),
	.outclkena(vcc),
	.inclk(gnd),
	.inclkena(vcc),
	.areset(gnd),
	.sreset(gnd),
	.combout(\cart_d[0]~input_o ),
	.regout());
defparam \cart_d[0]~output .coord_x = 1;
defparam \cart_d[0]~output .coord_y = 0;
defparam \cart_d[0]~output .coord_z = 2;
defparam \cart_d[0]~output .IN_ASYNC_MODE = 1'b0;
defparam \cart_d[0]~output .IN_SYNC_MODE = 1'b0;
defparam \cart_d[0]~output .IN_POWERUP = 1'b0;
defparam \cart_d[0]~output .OUT_REG_MODE = 1'b0;
defparam \cart_d[0]~output .OUT_ASYNC_MODE = 1'b0;
defparam \cart_d[0]~output .OUT_SYNC_MODE = 1'b0;
defparam \cart_d[0]~output .OUT_POWERUP = 1'b0;
defparam \cart_d[0]~output .OE_REG_MODE = 1'b0;
defparam \cart_d[0]~output .OE_ASYNC_MODE = 1'b0;
defparam \cart_d[0]~output .OE_SYNC_MODE = 1'b0;
defparam \cart_d[0]~output .OE_POWERUP = 1'b0;
defparam \cart_d[0]~output .CFG_TRI_INPUT = 1'b0;
defparam \cart_d[0]~output .CFG_INPUT_EN = 1'b1;
defparam \cart_d[0]~output .CFG_PULL_UP = 1'b0;
defparam \cart_d[0]~output .CFG_SLR = 1'b0;
defparam \cart_d[0]~output .CFG_OPEN_DRAIN = 1'b0;
defparam \cart_d[0]~output .CFG_PDRCTRL = 4'b0100;
defparam \cart_d[0]~output .CFG_KEEP = 2'b00;
defparam \cart_d[0]~output .CFG_LVDS_OUT_EN = 1'b0;
defparam \cart_d[0]~output .CFG_LVDS_SEL_CUA = 2'b00;
defparam \cart_d[0]~output .CFG_LVDS_IREF = 10'b0110000000;
defparam \cart_d[0]~output .CFG_LVDS_IN_EN = 1'b0;
defparam \cart_d[0]~output .DPCLK_DELAY = 4'b0000;
defparam \cart_d[0]~output .OUT_DELAY = 1'b0;
defparam \cart_d[0]~output .IN_DATA_DELAY = 3'b000;
defparam \cart_d[0]~output .IN_REG_DELAY = 3'b000;

alta_rio \cart_d[1]~output (
	.padio(cart_d[1]),
	.datain(\macro_inst|gbdreg|Reg_OutputData [1]),
	.oe(\macro_inst|gbdreg|Reg_OutputValid~q ),
	.outclk(gnd),
	.outclkena(vcc),
	.inclk(gnd),
	.inclkena(vcc),
	.areset(gnd),
	.sreset(gnd),
	.combout(\cart_d[1]~input_o ),
	.regout());
defparam \cart_d[1]~output .coord_x = 1;
defparam \cart_d[1]~output .coord_y = 0;
defparam \cart_d[1]~output .coord_z = 3;
defparam \cart_d[1]~output .IN_ASYNC_MODE = 1'b0;
defparam \cart_d[1]~output .IN_SYNC_MODE = 1'b0;
defparam \cart_d[1]~output .IN_POWERUP = 1'b0;
defparam \cart_d[1]~output .OUT_REG_MODE = 1'b0;
defparam \cart_d[1]~output .OUT_ASYNC_MODE = 1'b0;
defparam \cart_d[1]~output .OUT_SYNC_MODE = 1'b0;
defparam \cart_d[1]~output .OUT_POWERUP = 1'b0;
defparam \cart_d[1]~output .OE_REG_MODE = 1'b0;
defparam \cart_d[1]~output .OE_ASYNC_MODE = 1'b0;
defparam \cart_d[1]~output .OE_SYNC_MODE = 1'b0;
defparam \cart_d[1]~output .OE_POWERUP = 1'b0;
defparam \cart_d[1]~output .CFG_TRI_INPUT = 1'b0;
defparam \cart_d[1]~output .CFG_INPUT_EN = 1'b1;
defparam \cart_d[1]~output .CFG_PULL_UP = 1'b0;
defparam \cart_d[1]~output .CFG_SLR = 1'b0;
defparam \cart_d[1]~output .CFG_OPEN_DRAIN = 1'b0;
defparam \cart_d[1]~output .CFG_PDRCTRL = 4'b0100;
defparam \cart_d[1]~output .CFG_KEEP = 2'b00;
defparam \cart_d[1]~output .CFG_LVDS_OUT_EN = 1'b0;
defparam \cart_d[1]~output .CFG_LVDS_SEL_CUA = 2'b00;
defparam \cart_d[1]~output .CFG_LVDS_IREF = 10'b0110000000;
defparam \cart_d[1]~output .CFG_LVDS_IN_EN = 1'b0;
defparam \cart_d[1]~output .DPCLK_DELAY = 4'b0000;
defparam \cart_d[1]~output .OUT_DELAY = 1'b0;
defparam \cart_d[1]~output .IN_DATA_DELAY = 3'b000;
defparam \cart_d[1]~output .IN_REG_DELAY = 3'b000;

alta_rio \cart_d[2]~output (
	.padio(cart_d[2]),
	.datain(\macro_inst|gbdreg|Reg_OutputData [2]),
	.oe(\macro_inst|gbdreg|Reg_OutputValid~q ),
	.outclk(gnd),
	.outclkena(vcc),
	.inclk(gnd),
	.inclkena(vcc),
	.areset(gnd),
	.sreset(gnd),
	.combout(\cart_d[2]~input_o ),
	.regout());
defparam \cart_d[2]~output .coord_x = 6;
defparam \cart_d[2]~output .coord_y = 0;
defparam \cart_d[2]~output .coord_z = 0;
defparam \cart_d[2]~output .IN_ASYNC_MODE = 1'b0;
defparam \cart_d[2]~output .IN_SYNC_MODE = 1'b0;
defparam \cart_d[2]~output .IN_POWERUP = 1'b0;
defparam \cart_d[2]~output .OUT_REG_MODE = 1'b0;
defparam \cart_d[2]~output .OUT_ASYNC_MODE = 1'b0;
defparam \cart_d[2]~output .OUT_SYNC_MODE = 1'b0;
defparam \cart_d[2]~output .OUT_POWERUP = 1'b0;
defparam \cart_d[2]~output .OE_REG_MODE = 1'b0;
defparam \cart_d[2]~output .OE_ASYNC_MODE = 1'b0;
defparam \cart_d[2]~output .OE_SYNC_MODE = 1'b0;
defparam \cart_d[2]~output .OE_POWERUP = 1'b0;
defparam \cart_d[2]~output .CFG_TRI_INPUT = 1'b0;
defparam \cart_d[2]~output .CFG_INPUT_EN = 1'b1;
defparam \cart_d[2]~output .CFG_PULL_UP = 1'b0;
defparam \cart_d[2]~output .CFG_SLR = 1'b0;
defparam \cart_d[2]~output .CFG_OPEN_DRAIN = 1'b0;
defparam \cart_d[2]~output .CFG_PDRCTRL = 4'b0100;
defparam \cart_d[2]~output .CFG_KEEP = 2'b00;
defparam \cart_d[2]~output .CFG_LVDS_OUT_EN = 1'b0;
defparam \cart_d[2]~output .CFG_LVDS_SEL_CUA = 2'b00;
defparam \cart_d[2]~output .CFG_LVDS_IREF = 10'b0110000000;
defparam \cart_d[2]~output .CFG_LVDS_IN_EN = 1'b0;
defparam \cart_d[2]~output .DPCLK_DELAY = 4'b0000;
defparam \cart_d[2]~output .OUT_DELAY = 1'b0;
defparam \cart_d[2]~output .IN_DATA_DELAY = 3'b000;
defparam \cart_d[2]~output .IN_REG_DELAY = 3'b000;

alta_rio \cart_d[3]~output (
	.padio(cart_d[3]),
	.datain(\macro_inst|gbdreg|Reg_OutputData [3]),
	.oe(\macro_inst|gbdreg|Reg_OutputValid~q ),
	.outclk(gnd),
	.outclkena(vcc),
	.inclk(gnd),
	.inclkena(vcc),
	.areset(gnd),
	.sreset(gnd),
	.combout(\cart_d[3]~input_o ),
	.regout());
defparam \cart_d[3]~output .coord_x = 6;
defparam \cart_d[3]~output .coord_y = 0;
defparam \cart_d[3]~output .coord_z = 3;
defparam \cart_d[3]~output .IN_ASYNC_MODE = 1'b0;
defparam \cart_d[3]~output .IN_SYNC_MODE = 1'b0;
defparam \cart_d[3]~output .IN_POWERUP = 1'b0;
defparam \cart_d[3]~output .OUT_REG_MODE = 1'b0;
defparam \cart_d[3]~output .OUT_ASYNC_MODE = 1'b0;
defparam \cart_d[3]~output .OUT_SYNC_MODE = 1'b0;
defparam \cart_d[3]~output .OUT_POWERUP = 1'b0;
defparam \cart_d[3]~output .OE_REG_MODE = 1'b0;
defparam \cart_d[3]~output .OE_ASYNC_MODE = 1'b0;
defparam \cart_d[3]~output .OE_SYNC_MODE = 1'b0;
defparam \cart_d[3]~output .OE_POWERUP = 1'b0;
defparam \cart_d[3]~output .CFG_TRI_INPUT = 1'b0;
defparam \cart_d[3]~output .CFG_INPUT_EN = 1'b1;
defparam \cart_d[3]~output .CFG_PULL_UP = 1'b0;
defparam \cart_d[3]~output .CFG_SLR = 1'b0;
defparam \cart_d[3]~output .CFG_OPEN_DRAIN = 1'b0;
defparam \cart_d[3]~output .CFG_PDRCTRL = 4'b0100;
defparam \cart_d[3]~output .CFG_KEEP = 2'b00;
defparam \cart_d[3]~output .CFG_LVDS_OUT_EN = 1'b0;
defparam \cart_d[3]~output .CFG_LVDS_SEL_CUA = 2'b00;
defparam \cart_d[3]~output .CFG_LVDS_IREF = 10'b0110000000;
defparam \cart_d[3]~output .CFG_LVDS_IN_EN = 1'b0;
defparam \cart_d[3]~output .DPCLK_DELAY = 4'b0000;
defparam \cart_d[3]~output .OUT_DELAY = 1'b0;
defparam \cart_d[3]~output .IN_DATA_DELAY = 3'b000;
defparam \cart_d[3]~output .IN_REG_DELAY = 3'b000;

alta_rio \cart_d[4]~output (
	.padio(cart_d[4]),
	.datain(\macro_inst|gbdreg|Reg_OutputData [4]),
	.oe(\macro_inst|gbdreg|Reg_OutputValid~q ),
	.outclk(gnd),
	.outclkena(vcc),
	.inclk(gnd),
	.inclkena(vcc),
	.areset(gnd),
	.sreset(gnd),
	.combout(\cart_d[4]~input_o ),
	.regout());
defparam \cart_d[4]~output .coord_x = 7;
defparam \cart_d[4]~output .coord_y = 0;
defparam \cart_d[4]~output .coord_z = 0;
defparam \cart_d[4]~output .IN_ASYNC_MODE = 1'b0;
defparam \cart_d[4]~output .IN_SYNC_MODE = 1'b0;
defparam \cart_d[4]~output .IN_POWERUP = 1'b0;
defparam \cart_d[4]~output .OUT_REG_MODE = 1'b0;
defparam \cart_d[4]~output .OUT_ASYNC_MODE = 1'b0;
defparam \cart_d[4]~output .OUT_SYNC_MODE = 1'b0;
defparam \cart_d[4]~output .OUT_POWERUP = 1'b0;
defparam \cart_d[4]~output .OE_REG_MODE = 1'b0;
defparam \cart_d[4]~output .OE_ASYNC_MODE = 1'b0;
defparam \cart_d[4]~output .OE_SYNC_MODE = 1'b0;
defparam \cart_d[4]~output .OE_POWERUP = 1'b0;
defparam \cart_d[4]~output .CFG_TRI_INPUT = 1'b0;
defparam \cart_d[4]~output .CFG_INPUT_EN = 1'b1;
defparam \cart_d[4]~output .CFG_PULL_UP = 1'b0;
defparam \cart_d[4]~output .CFG_SLR = 1'b0;
defparam \cart_d[4]~output .CFG_OPEN_DRAIN = 1'b0;
defparam \cart_d[4]~output .CFG_PDRCTRL = 4'b0100;
defparam \cart_d[4]~output .CFG_KEEP = 2'b00;
defparam \cart_d[4]~output .CFG_LVDS_OUT_EN = 1'b0;
defparam \cart_d[4]~output .CFG_LVDS_SEL_CUA = 2'b00;
defparam \cart_d[4]~output .CFG_LVDS_IREF = 10'b0110000000;
defparam \cart_d[4]~output .CFG_LVDS_IN_EN = 1'b0;
defparam \cart_d[4]~output .DPCLK_DELAY = 4'b0000;
defparam \cart_d[4]~output .OUT_DELAY = 1'b0;
defparam \cart_d[4]~output .IN_DATA_DELAY = 3'b000;
defparam \cart_d[4]~output .IN_REG_DELAY = 3'b000;

alta_rio \cart_d[5]~output (
	.padio(cart_d[5]),
	.datain(\macro_inst|gbdreg|Reg_OutputData [5]),
	.oe(\macro_inst|gbdreg|Reg_OutputValid~q ),
	.outclk(gnd),
	.outclkena(vcc),
	.inclk(gnd),
	.inclkena(vcc),
	.areset(gnd),
	.sreset(gnd),
	.combout(\cart_d[5]~input_o ),
	.regout());
defparam \cart_d[5]~output .coord_x = 7;
defparam \cart_d[5]~output .coord_y = 0;
defparam \cart_d[5]~output .coord_z = 1;
defparam \cart_d[5]~output .IN_ASYNC_MODE = 1'b0;
defparam \cart_d[5]~output .IN_SYNC_MODE = 1'b0;
defparam \cart_d[5]~output .IN_POWERUP = 1'b0;
defparam \cart_d[5]~output .OUT_REG_MODE = 1'b0;
defparam \cart_d[5]~output .OUT_ASYNC_MODE = 1'b0;
defparam \cart_d[5]~output .OUT_SYNC_MODE = 1'b0;
defparam \cart_d[5]~output .OUT_POWERUP = 1'b0;
defparam \cart_d[5]~output .OE_REG_MODE = 1'b0;
defparam \cart_d[5]~output .OE_ASYNC_MODE = 1'b0;
defparam \cart_d[5]~output .OE_SYNC_MODE = 1'b0;
defparam \cart_d[5]~output .OE_POWERUP = 1'b0;
defparam \cart_d[5]~output .CFG_TRI_INPUT = 1'b0;
defparam \cart_d[5]~output .CFG_INPUT_EN = 1'b1;
defparam \cart_d[5]~output .CFG_PULL_UP = 1'b0;
defparam \cart_d[5]~output .CFG_SLR = 1'b0;
defparam \cart_d[5]~output .CFG_OPEN_DRAIN = 1'b0;
defparam \cart_d[5]~output .CFG_PDRCTRL = 4'b0100;
defparam \cart_d[5]~output .CFG_KEEP = 2'b00;
defparam \cart_d[5]~output .CFG_LVDS_OUT_EN = 1'b0;
defparam \cart_d[5]~output .CFG_LVDS_SEL_CUA = 2'b00;
defparam \cart_d[5]~output .CFG_LVDS_IREF = 10'b0110000000;
defparam \cart_d[5]~output .CFG_LVDS_IN_EN = 1'b0;
defparam \cart_d[5]~output .DPCLK_DELAY = 4'b0000;
defparam \cart_d[5]~output .OUT_DELAY = 1'b0;
defparam \cart_d[5]~output .IN_DATA_DELAY = 3'b000;
defparam \cart_d[5]~output .IN_REG_DELAY = 3'b000;

alta_rio \cart_d[6]~output (
	.padio(cart_d[6]),
	.datain(\macro_inst|gbdreg|Reg_OutputData [6]),
	.oe(\macro_inst|gbdreg|Reg_OutputValid~q ),
	.outclk(gnd),
	.outclkena(vcc),
	.inclk(gnd),
	.inclkena(vcc),
	.areset(gnd),
	.sreset(gnd),
	.combout(\cart_d[6]~input_o ),
	.regout());
defparam \cart_d[6]~output .coord_x = 7;
defparam \cart_d[6]~output .coord_y = 0;
defparam \cart_d[6]~output .coord_z = 3;
defparam \cart_d[6]~output .IN_ASYNC_MODE = 1'b0;
defparam \cart_d[6]~output .IN_SYNC_MODE = 1'b0;
defparam \cart_d[6]~output .IN_POWERUP = 1'b0;
defparam \cart_d[6]~output .OUT_REG_MODE = 1'b0;
defparam \cart_d[6]~output .OUT_ASYNC_MODE = 1'b0;
defparam \cart_d[6]~output .OUT_SYNC_MODE = 1'b0;
defparam \cart_d[6]~output .OUT_POWERUP = 1'b0;
defparam \cart_d[6]~output .OE_REG_MODE = 1'b0;
defparam \cart_d[6]~output .OE_ASYNC_MODE = 1'b0;
defparam \cart_d[6]~output .OE_SYNC_MODE = 1'b0;
defparam \cart_d[6]~output .OE_POWERUP = 1'b0;
defparam \cart_d[6]~output .CFG_TRI_INPUT = 1'b0;
defparam \cart_d[6]~output .CFG_INPUT_EN = 1'b1;
defparam \cart_d[6]~output .CFG_PULL_UP = 1'b0;
defparam \cart_d[6]~output .CFG_SLR = 1'b0;
defparam \cart_d[6]~output .CFG_OPEN_DRAIN = 1'b0;
defparam \cart_d[6]~output .CFG_PDRCTRL = 4'b0100;
defparam \cart_d[6]~output .CFG_KEEP = 2'b00;
defparam \cart_d[6]~output .CFG_LVDS_OUT_EN = 1'b0;
defparam \cart_d[6]~output .CFG_LVDS_SEL_CUA = 2'b00;
defparam \cart_d[6]~output .CFG_LVDS_IREF = 10'b0110000000;
defparam \cart_d[6]~output .CFG_LVDS_IN_EN = 1'b0;
defparam \cart_d[6]~output .DPCLK_DELAY = 4'b0000;
defparam \cart_d[6]~output .OUT_DELAY = 1'b0;
defparam \cart_d[6]~output .IN_DATA_DELAY = 3'b000;
defparam \cart_d[6]~output .IN_REG_DELAY = 3'b000;

alta_rio \cart_d[7]~output (
	.padio(cart_d[7]),
	.datain(\macro_inst|gbdreg|Reg_OutputData [7]),
	.oe(\macro_inst|gbdreg|Reg_OutputValid~q ),
	.outclk(gnd),
	.outclkena(vcc),
	.inclk(gnd),
	.inclkena(vcc),
	.areset(gnd),
	.sreset(gnd),
	.combout(\cart_d[7]~input_o ),
	.regout());
defparam \cart_d[7]~output .coord_x = 8;
defparam \cart_d[7]~output .coord_y = 0;
defparam \cart_d[7]~output .coord_z = 0;
defparam \cart_d[7]~output .IN_ASYNC_MODE = 1'b0;
defparam \cart_d[7]~output .IN_SYNC_MODE = 1'b0;
defparam \cart_d[7]~output .IN_POWERUP = 1'b0;
defparam \cart_d[7]~output .OUT_REG_MODE = 1'b0;
defparam \cart_d[7]~output .OUT_ASYNC_MODE = 1'b0;
defparam \cart_d[7]~output .OUT_SYNC_MODE = 1'b0;
defparam \cart_d[7]~output .OUT_POWERUP = 1'b0;
defparam \cart_d[7]~output .OE_REG_MODE = 1'b0;
defparam \cart_d[7]~output .OE_ASYNC_MODE = 1'b0;
defparam \cart_d[7]~output .OE_SYNC_MODE = 1'b0;
defparam \cart_d[7]~output .OE_POWERUP = 1'b0;
defparam \cart_d[7]~output .CFG_TRI_INPUT = 1'b0;
defparam \cart_d[7]~output .CFG_INPUT_EN = 1'b1;
defparam \cart_d[7]~output .CFG_PULL_UP = 1'b0;
defparam \cart_d[7]~output .CFG_SLR = 1'b0;
defparam \cart_d[7]~output .CFG_OPEN_DRAIN = 1'b0;
defparam \cart_d[7]~output .CFG_PDRCTRL = 4'b0100;
defparam \cart_d[7]~output .CFG_KEEP = 2'b00;
defparam \cart_d[7]~output .CFG_LVDS_OUT_EN = 1'b0;
defparam \cart_d[7]~output .CFG_LVDS_SEL_CUA = 2'b00;
defparam \cart_d[7]~output .CFG_LVDS_IREF = 10'b0110000000;
defparam \cart_d[7]~output .CFG_LVDS_IN_EN = 1'b0;
defparam \cart_d[7]~output .DPCLK_DELAY = 4'b0000;
defparam \cart_d[7]~output .OUT_DELAY = 1'b0;
defparam \cart_d[7]~output .IN_DATA_DELAY = 3'b000;
defparam \cart_d[7]~output .IN_REG_DELAY = 3'b000;

alta_rio \cart_nCS~input (
	.padio(cart_nCS),
	.datain(gnd),
	.oe(gnd),
	.outclk(gnd),
	.outclkena(vcc),
	.inclk(gnd),
	.inclkena(vcc),
	.areset(gnd),
	.sreset(gnd),
	.combout(\cart_nCS~input_o ),
	.regout());
defparam \cart_nCS~input .coord_x = 0;
defparam \cart_nCS~input .coord_y = 2;
defparam \cart_nCS~input .coord_z = 2;
defparam \cart_nCS~input .IN_ASYNC_MODE = 1'b0;
defparam \cart_nCS~input .IN_SYNC_MODE = 1'b0;
defparam \cart_nCS~input .IN_POWERUP = 1'b0;
defparam \cart_nCS~input .OUT_REG_MODE = 1'b0;
defparam \cart_nCS~input .OUT_ASYNC_MODE = 1'b0;
defparam \cart_nCS~input .OUT_SYNC_MODE = 1'b0;
defparam \cart_nCS~input .OUT_POWERUP = 1'b0;
defparam \cart_nCS~input .OE_REG_MODE = 1'b0;
defparam \cart_nCS~input .OE_ASYNC_MODE = 1'b0;
defparam \cart_nCS~input .OE_SYNC_MODE = 1'b0;
defparam \cart_nCS~input .OE_POWERUP = 1'b0;
defparam \cart_nCS~input .CFG_TRI_INPUT = 1'b0;
defparam \cart_nCS~input .CFG_INPUT_EN = 1'b1;
defparam \cart_nCS~input .CFG_PULL_UP = 1'b0;
defparam \cart_nCS~input .CFG_SLR = 1'b0;
defparam \cart_nCS~input .CFG_OPEN_DRAIN = 1'b0;
defparam \cart_nCS~input .CFG_PDRCTRL = 4'b0100;
defparam \cart_nCS~input .CFG_KEEP = 2'b00;
defparam \cart_nCS~input .CFG_LVDS_OUT_EN = 1'b0;
defparam \cart_nCS~input .CFG_LVDS_SEL_CUA = 2'b00;
defparam \cart_nCS~input .CFG_LVDS_IREF = 10'b0110000000;
defparam \cart_nCS~input .CFG_LVDS_IN_EN = 1'b0;
defparam \cart_nCS~input .DPCLK_DELAY = 4'b0000;
defparam \cart_nCS~input .OUT_DELAY = 1'b0;
defparam \cart_nCS~input .IN_DATA_DELAY = 3'b000;
defparam \cart_nCS~input .IN_REG_DELAY = 3'b000;

alta_rio \cart_nRD~input (
	.padio(cart_nRD),
	.datain(gnd),
	.oe(gnd),
	.outclk(gnd),
	.outclkena(vcc),
	.inclk(gnd),
	.inclkena(vcc),
	.areset(gnd),
	.sreset(gnd),
	.combout(\cart_nRD~input_o ),
	.regout());
defparam \cart_nRD~input .coord_x = 0;
defparam \cart_nRD~input .coord_y = 4;
defparam \cart_nRD~input .coord_z = 2;
defparam \cart_nRD~input .IN_ASYNC_MODE = 1'b0;
defparam \cart_nRD~input .IN_SYNC_MODE = 1'b0;
defparam \cart_nRD~input .IN_POWERUP = 1'b0;
defparam \cart_nRD~input .OUT_REG_MODE = 1'b0;
defparam \cart_nRD~input .OUT_ASYNC_MODE = 1'b0;
defparam \cart_nRD~input .OUT_SYNC_MODE = 1'b0;
defparam \cart_nRD~input .OUT_POWERUP = 1'b0;
defparam \cart_nRD~input .OE_REG_MODE = 1'b0;
defparam \cart_nRD~input .OE_ASYNC_MODE = 1'b0;
defparam \cart_nRD~input .OE_SYNC_MODE = 1'b0;
defparam \cart_nRD~input .OE_POWERUP = 1'b0;
defparam \cart_nRD~input .CFG_TRI_INPUT = 1'b0;
defparam \cart_nRD~input .CFG_INPUT_EN = 1'b1;
defparam \cart_nRD~input .CFG_PULL_UP = 1'b0;
defparam \cart_nRD~input .CFG_SLR = 1'b0;
defparam \cart_nRD~input .CFG_OPEN_DRAIN = 1'b0;
defparam \cart_nRD~input .CFG_PDRCTRL = 4'b0100;
defparam \cart_nRD~input .CFG_KEEP = 2'b00;
defparam \cart_nRD~input .CFG_LVDS_OUT_EN = 1'b0;
defparam \cart_nRD~input .CFG_LVDS_SEL_CUA = 2'b00;
defparam \cart_nRD~input .CFG_LVDS_IREF = 10'b0110000000;
defparam \cart_nRD~input .CFG_LVDS_IN_EN = 1'b0;
defparam \cart_nRD~input .DPCLK_DELAY = 4'b0000;
defparam \cart_nRD~input .OUT_DELAY = 1'b0;
defparam \cart_nRD~input .IN_DATA_DELAY = 3'b000;
defparam \cart_nRD~input .IN_REG_DELAY = 3'b000;

alta_rio \cart_nRST~output (
	.padio(cart_nRST),
	.datain(gnd),
	.oe(gnd),
	.outclk(gnd),
	.outclkena(vcc),
	.inclk(gnd),
	.inclkena(vcc),
	.areset(gnd),
	.sreset(gnd),
	.combout(),
	.regout());
defparam \cart_nRST~output .coord_x = 22;
defparam \cart_nRST~output .coord_y = 1;
defparam \cart_nRST~output .coord_z = 4;
defparam \cart_nRST~output .IN_ASYNC_MODE = 1'b0;
defparam \cart_nRST~output .IN_SYNC_MODE = 1'b0;
defparam \cart_nRST~output .IN_POWERUP = 1'b0;
defparam \cart_nRST~output .OUT_REG_MODE = 1'b0;
defparam \cart_nRST~output .OUT_ASYNC_MODE = 1'b0;
defparam \cart_nRST~output .OUT_SYNC_MODE = 1'b0;
defparam \cart_nRST~output .OUT_POWERUP = 1'b0;
defparam \cart_nRST~output .OE_REG_MODE = 1'b0;
defparam \cart_nRST~output .OE_ASYNC_MODE = 1'b0;
defparam \cart_nRST~output .OE_SYNC_MODE = 1'b0;
defparam \cart_nRST~output .OE_POWERUP = 1'b0;
defparam \cart_nRST~output .CFG_TRI_INPUT = 1'b0;
defparam \cart_nRST~output .CFG_INPUT_EN = 1'b0;
defparam \cart_nRST~output .CFG_PULL_UP = 1'b0;
defparam \cart_nRST~output .CFG_SLR = 1'b0;
defparam \cart_nRST~output .CFG_OPEN_DRAIN = 1'b0;
defparam \cart_nRST~output .CFG_PDRCTRL = 4'b0100;
defparam \cart_nRST~output .CFG_KEEP = 2'b00;
defparam \cart_nRST~output .CFG_LVDS_OUT_EN = 1'b0;
defparam \cart_nRST~output .CFG_LVDS_SEL_CUA = 2'b00;
defparam \cart_nRST~output .CFG_LVDS_IREF = 10'b0110000000;
defparam \cart_nRST~output .CFG_LVDS_IN_EN = 1'b0;
defparam \cart_nRST~output .DPCLK_DELAY = 4'b0000;
defparam \cart_nRST~output .OUT_DELAY = 1'b0;
defparam \cart_nRST~output .IN_DATA_DELAY = 3'b000;
defparam \cart_nRST~output .IN_REG_DELAY = 3'b000;

alta_rio \cart_nWR~input (
	.padio(cart_nWR),
	.datain(gnd),
	.oe(gnd),
	.outclk(gnd),
	.outclkena(vcc),
	.inclk(gnd),
	.inclkena(vcc),
	.areset(gnd),
	.sreset(gnd),
	.combout(\cart_nWR~input_o ),
	.regout());
defparam \cart_nWR~input .coord_x = 0;
defparam \cart_nWR~input .coord_y = 3;
defparam \cart_nWR~input .coord_z = 5;
defparam \cart_nWR~input .IN_ASYNC_MODE = 1'b0;
defparam \cart_nWR~input .IN_SYNC_MODE = 1'b0;
defparam \cart_nWR~input .IN_POWERUP = 1'b0;
defparam \cart_nWR~input .OUT_REG_MODE = 1'b0;
defparam \cart_nWR~input .OUT_ASYNC_MODE = 1'b0;
defparam \cart_nWR~input .OUT_SYNC_MODE = 1'b0;
defparam \cart_nWR~input .OUT_POWERUP = 1'b0;
defparam \cart_nWR~input .OE_REG_MODE = 1'b0;
defparam \cart_nWR~input .OE_ASYNC_MODE = 1'b0;
defparam \cart_nWR~input .OE_SYNC_MODE = 1'b0;
defparam \cart_nWR~input .OE_POWERUP = 1'b0;
defparam \cart_nWR~input .CFG_TRI_INPUT = 1'b0;
defparam \cart_nWR~input .CFG_INPUT_EN = 1'b1;
defparam \cart_nWR~input .CFG_PULL_UP = 1'b0;
defparam \cart_nWR~input .CFG_SLR = 1'b0;
defparam \cart_nWR~input .CFG_OPEN_DRAIN = 1'b0;
defparam \cart_nWR~input .CFG_PDRCTRL = 4'b0100;
defparam \cart_nWR~input .CFG_KEEP = 2'b00;
defparam \cart_nWR~input .CFG_LVDS_OUT_EN = 1'b0;
defparam \cart_nWR~input .CFG_LVDS_SEL_CUA = 2'b00;
defparam \cart_nWR~input .CFG_LVDS_IREF = 10'b0110000000;
defparam \cart_nWR~input .CFG_LVDS_IN_EN = 1'b0;
defparam \cart_nWR~input .DPCLK_DELAY = 4'b0000;
defparam \cart_nWR~input .OUT_DELAY = 1'b0;
defparam \cart_nWR~input .IN_DATA_DELAY = 3'b000;
defparam \cart_nWR~input .IN_REG_DELAY = 3'b000;

alta_clkenctrl clken_ctrl_X44_Y1_N0(
	.ClkIn(\cart_CLK~input_o ),
	.ClkEn(),
	.ClkOut(\cart_CLK~input_o_X44_Y1_SIG_VCC ));
defparam clken_ctrl_X44_Y1_N0.coord_x = 17;
defparam clken_ctrl_X44_Y1_N0.coord_y = 2;
defparam clken_ctrl_X44_Y1_N0.coord_z = 0;
defparam clken_ctrl_X44_Y1_N0.ClkMux = 2'b10;
defparam clken_ctrl_X44_Y1_N0.ClkEnMux = 2'b01;

alta_clkenctrl clken_ctrl_X49_Y1_N0(
	.ClkIn(\auto_generated_inst.hbo_13_83378d4b1997463f_bp ),
	.ClkEn(),
	.ClkOut(\auto_generated_inst.hbo_13_83378d4b1997463f_bp_X49_Y1_SIG_VCC ));
defparam clken_ctrl_X49_Y1_N0.coord_x = 20;
defparam clken_ctrl_X49_Y1_N0.coord_y = 5;
defparam clken_ctrl_X49_Y1_N0.coord_z = 0;
defparam clken_ctrl_X49_Y1_N0.ClkMux = 2'b10;
defparam clken_ctrl_X49_Y1_N0.ClkEnMux = 2'b01;

alta_clkenctrl clken_ctrl_X57_Y1_N0(
	.ClkIn(\auto_generated_inst.hbo_22_f9ff3d300b43c0f2_bp ),
	.ClkEn(\macro_inst|gbdrom|bank_id[0]~0_combout ),
	.ClkOut(\auto_generated_inst.hbo_22_f9ff3d300b43c0f2_bp__macro_inst|gbdrom|bank_id[0]~0_combout_X57_Y1_SIG_SIG ));
defparam clken_ctrl_X57_Y1_N0.coord_x = 8;
defparam clken_ctrl_X57_Y1_N0.coord_y = 3;
defparam clken_ctrl_X57_Y1_N0.coord_z = 0;
defparam clken_ctrl_X57_Y1_N0.ClkMux = 2'b10;
defparam clken_ctrl_X57_Y1_N0.ClkEnMux = 2'b10;

alta_clkenctrl clken_ctrl_X58_Y1_N0(
	.ClkIn(\auto_generated_inst.hbo_22_f9ff3d300b43c0f2_bp ),
	.ClkEn(\macro_inst|gbdram|ram_bank_id[0]~1_combout ),
	.ClkOut(\auto_generated_inst.hbo_22_f9ff3d300b43c0f2_bp__macro_inst|gbdram|ram_bank_id[0]~1_combout_X58_Y1_SIG_SIG ));
defparam clken_ctrl_X58_Y1_N0.coord_x = 7;
defparam clken_ctrl_X58_Y1_N0.coord_y = 3;
defparam clken_ctrl_X58_Y1_N0.coord_z = 0;
defparam clken_ctrl_X58_Y1_N0.ClkMux = 2'b10;
defparam clken_ctrl_X58_Y1_N0.ClkEnMux = 2'b10;

alta_clkenctrl clken_ctrl_X58_Y1_N1(
	.ClkIn(\auto_generated_inst.hbo_22_f9ff3d300b43c0f2_bp ),
	.ClkEn(),
	.ClkOut(\auto_generated_inst.hbo_22_f9ff3d300b43c0f2_bp_X58_Y1_SIG_VCC ));
defparam clken_ctrl_X58_Y1_N1.coord_x = 7;
defparam clken_ctrl_X58_Y1_N1.coord_y = 3;
defparam clken_ctrl_X58_Y1_N1.coord_z = 1;
defparam clken_ctrl_X58_Y1_N1.ClkMux = 2'b10;
defparam clken_ctrl_X58_Y1_N1.ClkEnMux = 2'b01;

alta_clkenctrl clken_ctrl_X59_Y1_N0(
	.ClkIn(\auto_generated_inst.hbo_22_f9ff3d300b43c0f2_bp ),
	.ClkEn(\macro_inst|gbdreg|Reg_OutputData[0]~3_combout ),
	.ClkOut(\auto_generated_inst.hbo_22_f9ff3d300b43c0f2_bp__macro_inst|gbdreg|Reg_OutputData[0]~3_combout_X59_Y1_SIG_SIG ));
defparam clken_ctrl_X59_Y1_N0.coord_x = 6;
defparam clken_ctrl_X59_Y1_N0.coord_y = 2;
defparam clken_ctrl_X59_Y1_N0.coord_z = 0;
defparam clken_ctrl_X59_Y1_N0.ClkMux = 2'b10;
defparam clken_ctrl_X59_Y1_N0.ClkEnMux = 2'b10;

alta_clkenctrl clken_ctrl_X59_Y3_N0(
	.ClkIn(\auto_generated_inst.hbo_22_f9ff3d300b43c0f2_bp ),
	.ClkEn(),
	.ClkOut(\auto_generated_inst.hbo_22_f9ff3d300b43c0f2_bp_X59_Y3_SIG_VCC ));
defparam clken_ctrl_X59_Y3_N0.coord_x = 15;
defparam clken_ctrl_X59_Y3_N0.coord_y = 2;
defparam clken_ctrl_X59_Y3_N0.coord_z = 0;
defparam clken_ctrl_X59_Y3_N0.ClkMux = 2'b10;
defparam clken_ctrl_X59_Y3_N0.ClkEnMux = 2'b01;

alta_clkenctrl clken_ctrl_X60_Y1_N0(
	.ClkIn(\auto_generated_inst.hbo_22_f9ff3d300b43c0f2_bp ),
	.ClkEn(\macro_inst|gbdreg|Cam_Capture~0_combout ),
	.ClkOut(\auto_generated_inst.hbo_22_f9ff3d300b43c0f2_bp__macro_inst|gbdreg|Cam_Capture~0_combout_X60_Y1_SIG_SIG ));
defparam clken_ctrl_X60_Y1_N0.coord_x = 7;
defparam clken_ctrl_X60_Y1_N0.coord_y = 2;
defparam clken_ctrl_X60_Y1_N0.coord_z = 0;
defparam clken_ctrl_X60_Y1_N0.ClkMux = 2'b10;
defparam clken_ctrl_X60_Y1_N0.ClkEnMux = 2'b10;

alta_clkenctrl clken_ctrl_X60_Y1_N1(
	.ClkIn(\auto_generated_inst.hbo_22_f9ff3d300b43c0f2_bp ),
	.ClkEn(),
	.ClkOut(\auto_generated_inst.hbo_22_f9ff3d300b43c0f2_bp_X60_Y1_SIG_VCC ));
defparam clken_ctrl_X60_Y1_N1.coord_x = 7;
defparam clken_ctrl_X60_Y1_N1.coord_y = 2;
defparam clken_ctrl_X60_Y1_N1.coord_z = 1;
defparam clken_ctrl_X60_Y1_N1.ClkMux = 2'b10;
defparam clken_ctrl_X60_Y1_N1.ClkEnMux = 2'b01;

alta_clkenctrl clken_ctrl_X60_Y2_N1(
	.ClkIn(\auto_generated_inst.hbo_22_f9ff3d300b43c0f2_bp ),
	.ClkEn(\macro_inst|gbdcam|counter0[23]~32_combout ),
	.ClkOut(\auto_generated_inst.hbo_22_f9ff3d300b43c0f2_bp__macro_inst|gbdcam|counter0[23]~32_combout_X60_Y2_SIG_SIG ));
defparam clken_ctrl_X60_Y2_N1.coord_x = 16;
defparam clken_ctrl_X60_Y2_N1.coord_y = 1;
defparam clken_ctrl_X60_Y2_N1.coord_z = 1;
defparam clken_ctrl_X60_Y2_N1.ClkMux = 2'b10;
defparam clken_ctrl_X60_Y2_N1.ClkEnMux = 2'b10;

alta_clkenctrl clken_ctrl_X60_Y3_N1(
	.ClkIn(\auto_generated_inst.hbo_22_f9ff3d300b43c0f2_bp ),
	.ClkEn(\macro_inst|gbdcam|counter0[23]~32_combout ),
	.ClkOut(\auto_generated_inst.hbo_22_f9ff3d300b43c0f2_bp__macro_inst|gbdcam|counter0[23]~32_combout_X60_Y3_SIG_SIG ));
defparam clken_ctrl_X60_Y3_N1.coord_x = 16;
defparam clken_ctrl_X60_Y3_N1.coord_y = 2;
defparam clken_ctrl_X60_Y3_N1.coord_z = 1;
defparam clken_ctrl_X60_Y3_N1.ClkMux = 2'b10;
defparam clken_ctrl_X60_Y3_N1.ClkEnMux = 2'b10;

alta_clkenctrl clken_ctrl_X61_Y1_N0(
	.ClkIn(\auto_generated_inst.hbo_22_f9ff3d300b43c0f2_bp ),
	.ClkEn(),
	.ClkOut(\auto_generated_inst.hbo_22_f9ff3d300b43c0f2_bp_X61_Y1_SIG_VCC ));
defparam clken_ctrl_X61_Y1_N0.coord_x = 6;
defparam clken_ctrl_X61_Y1_N0.coord_y = 3;
defparam clken_ctrl_X61_Y1_N0.coord_z = 0;
defparam clken_ctrl_X61_Y1_N0.ClkMux = 2'b10;
defparam clken_ctrl_X61_Y1_N0.ClkEnMux = 2'b01;

alta_io_gclk \gclksw_inst|gclk_switch (
	.inclk(\gclksw_inst|gclk_switch__alta_gclksw__clkout ),
	.outclk(\auto_generated_inst.hbo_22_f9ff3d300b43c0f2_bp ));
defparam \gclksw_inst|gclk_switch .coord_x = 22;
defparam \gclksw_inst|gclk_switch .coord_y = 4;
defparam \gclksw_inst|gclk_switch .coord_z = 5;

alta_gclksw \gclksw_inst|gclk_switch__alta_gclksw (
	.resetn(\rv32.resetn_out ),
	.clkin0(\PIN_HSI~input_o ),
	.clkin1(\PIN_HSE~input_o ),
	.clkin2(\pll_inst|auto_generated|pll1_CLK_bus [0]),
	.clkin3(1'bx),
	.select({\rv32.sys_ctrl_clkSource[1] , \rv32.sys_ctrl_clkSource[0] }),
	.clkout(\gclksw_inst|gclk_switch__alta_gclksw__clkout ));
defparam \gclksw_inst|gclk_switch__alta_gclksw .coord_x = 22;
defparam \gclksw_inst|gclk_switch__alta_gclksw .coord_y = 4;
defparam \gclksw_inst|gclk_switch__alta_gclksw .coord_z = 0;

alta_slice \macro_inst|gbdcam|Cam_Capture_Finish (
	.A(vcc),
	.B(\macro_inst|gbdcam|main_state.S_WAIT0~q ),
	.C(\macro_inst|gbdcam|counter0[23]~28_combout ),
	.D(\macro_inst|gbdcam|Equal0~4_combout ),
	.Cin(),
	.Qin(\macro_inst|gbdcam|Cam_Capture_Finish~q ),
	.Clk(\auto_generated_inst.hbo_22_f9ff3d300b43c0f2_bp_X59_Y3_SIG_VCC ),
	.AsyncReset(\sys_resetn~clkctrl_outclk__AsyncReset_X59_Y3_SIG ),
	.SyncReset(),
	.ShiftData(),
	.SyncLoad(),
	.LutOut(\macro_inst|gbdcam|always4~0_combout ),
	.Cout(),
	.Q(\macro_inst|gbdcam|Cam_Capture_Finish~q ));
defparam \macro_inst|gbdcam|Cam_Capture_Finish .coord_x = 15;
defparam \macro_inst|gbdcam|Cam_Capture_Finish .coord_y = 2;
defparam \macro_inst|gbdcam|Cam_Capture_Finish .coord_z = 3;
defparam \macro_inst|gbdcam|Cam_Capture_Finish .mask = 16'h3000;
defparam \macro_inst|gbdcam|Cam_Capture_Finish .modeMux = 1'b0;
defparam \macro_inst|gbdcam|Cam_Capture_Finish .FeedbackMux = 1'b0;
defparam \macro_inst|gbdcam|Cam_Capture_Finish .ShiftMux = 1'b0;
defparam \macro_inst|gbdcam|Cam_Capture_Finish .BypassEn = 1'b0;
defparam \macro_inst|gbdcam|Cam_Capture_Finish .CarryEnb = 1'b1;

alta_slice \macro_inst|gbdcam|Equal0~0 (
	.A(\macro_inst|gbdcam|counter0 [0]),
	.B(\macro_inst|gbdcam|counter0 [1]),
	.C(\macro_inst|gbdcam|counter0 [2]),
	.D(\macro_inst|gbdcam|counter0 [3]),
	.Cin(),
	.Qin(),
	.Clk(),
	.AsyncReset(),
	.SyncReset(),
	.ShiftData(),
	.SyncLoad(),
	.LutOut(\macro_inst|gbdcam|Equal0~0_combout ),
	.Cout(),
	.Q());
defparam \macro_inst|gbdcam|Equal0~0 .coord_x = 16;
defparam \macro_inst|gbdcam|Equal0~0 .coord_y = 2;
defparam \macro_inst|gbdcam|Equal0~0 .coord_z = 3;
defparam \macro_inst|gbdcam|Equal0~0 .mask = 16'h8000;
defparam \macro_inst|gbdcam|Equal0~0 .modeMux = 1'b0;
defparam \macro_inst|gbdcam|Equal0~0 .FeedbackMux = 1'b0;
defparam \macro_inst|gbdcam|Equal0~0 .ShiftMux = 1'b0;
defparam \macro_inst|gbdcam|Equal0~0 .BypassEn = 1'b0;
defparam \macro_inst|gbdcam|Equal0~0 .CarryEnb = 1'b1;

alta_slice \macro_inst|gbdcam|Equal0~1 (
	.A(\macro_inst|gbdcam|counter0 [6]),
	.B(\macro_inst|gbdcam|counter0 [5]),
	.C(\macro_inst|gbdcam|counter0 [4]),
	.D(\macro_inst|gbdcam|counter0 [7]),
	.Cin(),
	.Qin(),
	.Clk(),
	.AsyncReset(),
	.SyncReset(),
	.ShiftData(),
	.SyncLoad(),
	.LutOut(\macro_inst|gbdcam|Equal0~1_combout ),
	.Cout(),
	.Q());
defparam \macro_inst|gbdcam|Equal0~1 .coord_x = 16;
defparam \macro_inst|gbdcam|Equal0~1 .coord_y = 2;
defparam \macro_inst|gbdcam|Equal0~1 .coord_z = 0;
defparam \macro_inst|gbdcam|Equal0~1 .mask = 16'h8000;
defparam \macro_inst|gbdcam|Equal0~1 .modeMux = 1'b0;
defparam \macro_inst|gbdcam|Equal0~1 .FeedbackMux = 1'b0;
defparam \macro_inst|gbdcam|Equal0~1 .ShiftMux = 1'b0;
defparam \macro_inst|gbdcam|Equal0~1 .BypassEn = 1'b0;
defparam \macro_inst|gbdcam|Equal0~1 .CarryEnb = 1'b1;

alta_slice \macro_inst|gbdcam|Equal0~2 (
	.A(\macro_inst|gbdcam|counter0 [10]),
	.B(\macro_inst|gbdcam|counter0 [9]),
	.C(\macro_inst|gbdcam|counter0 [8]),
	.D(\macro_inst|gbdcam|counter0 [11]),
	.Cin(),
	.Qin(),
	.Clk(),
	.AsyncReset(),
	.SyncReset(),
	.ShiftData(),
	.SyncLoad(),
	.LutOut(\macro_inst|gbdcam|Equal0~2_combout ),
	.Cout(),
	.Q());
defparam \macro_inst|gbdcam|Equal0~2 .coord_x = 16;
defparam \macro_inst|gbdcam|Equal0~2 .coord_y = 2;
defparam \macro_inst|gbdcam|Equal0~2 .coord_z = 2;
defparam \macro_inst|gbdcam|Equal0~2 .mask = 16'h8000;
defparam \macro_inst|gbdcam|Equal0~2 .modeMux = 1'b0;
defparam \macro_inst|gbdcam|Equal0~2 .FeedbackMux = 1'b0;
defparam \macro_inst|gbdcam|Equal0~2 .ShiftMux = 1'b0;
defparam \macro_inst|gbdcam|Equal0~2 .BypassEn = 1'b0;
defparam \macro_inst|gbdcam|Equal0~2 .CarryEnb = 1'b1;

alta_slice \macro_inst|gbdcam|Equal0~3 (
	.A(\macro_inst|gbdcam|counter0 [14]),
	.B(vcc),
	.C(\macro_inst|gbdcam|counter0 [12]),
	.D(\macro_inst|gbdcam|counter0 [13]),
	.Cin(),
	.Qin(),
	.Clk(),
	.AsyncReset(),
	.SyncReset(),
	.ShiftData(),
	.SyncLoad(),
	.LutOut(\macro_inst|gbdcam|Equal0~3_combout ),
	.Cout(),
	.Q());
defparam \macro_inst|gbdcam|Equal0~3 .coord_x = 16;
defparam \macro_inst|gbdcam|Equal0~3 .coord_y = 1;
defparam \macro_inst|gbdcam|Equal0~3 .coord_z = 15;
defparam \macro_inst|gbdcam|Equal0~3 .mask = 16'hA000;
defparam \macro_inst|gbdcam|Equal0~3 .modeMux = 1'b0;
defparam \macro_inst|gbdcam|Equal0~3 .FeedbackMux = 1'b0;
defparam \macro_inst|gbdcam|Equal0~3 .ShiftMux = 1'b0;
defparam \macro_inst|gbdcam|Equal0~3 .BypassEn = 1'b0;
defparam \macro_inst|gbdcam|Equal0~3 .CarryEnb = 1'b1;

alta_slice \macro_inst|gbdcam|Equal0~4 (
	.A(\macro_inst|gbdcam|Equal0~1_combout ),
	.B(\macro_inst|gbdcam|Equal0~0_combout ),
	.C(\macro_inst|gbdcam|Equal0~2_combout ),
	.D(\macro_inst|gbdcam|Equal0~3_combout ),
	.Cin(),
	.Qin(),
	.Clk(),
	.AsyncReset(),
	.SyncReset(),
	.ShiftData(),
	.SyncLoad(),
	.LutOut(\macro_inst|gbdcam|Equal0~4_combout ),
	.Cout(),
	.Q());
defparam \macro_inst|gbdcam|Equal0~4 .coord_x = 16;
defparam \macro_inst|gbdcam|Equal0~4 .coord_y = 2;
defparam \macro_inst|gbdcam|Equal0~4 .coord_z = 1;
defparam \macro_inst|gbdcam|Equal0~4 .mask = 16'h8000;
defparam \macro_inst|gbdcam|Equal0~4 .modeMux = 1'b0;
defparam \macro_inst|gbdcam|Equal0~4 .FeedbackMux = 1'b0;
defparam \macro_inst|gbdcam|Equal0~4 .ShiftMux = 1'b0;
defparam \macro_inst|gbdcam|Equal0~4 .BypassEn = 1'b0;
defparam \macro_inst|gbdcam|Equal0~4 .CarryEnb = 1'b1;

alta_slice \macro_inst|gbdcam|Last_XCK_Reg[0] (
	.A(vcc),
	.B(vcc),
	.C(vcc),
	.D(\macro_inst|gbdcam|Sens_XCK_Reg~q ),
	.Cin(),
	.Qin(\macro_inst|gbdcam|Last_XCK_Reg [0]),
	.Clk(\auto_generated_inst.hbo_22_f9ff3d300b43c0f2_bp_X59_Y3_SIG_VCC ),
	.AsyncReset(\sys_resetn~clkctrl_outclk__AsyncReset_X59_Y3_SIG ),
	.SyncReset(),
	.ShiftData(),
	.SyncLoad(),
	.LutOut(\macro_inst|gbdcam|Last_XCK_Reg[0]~feeder_combout ),
	.Cout(),
	.Q(\macro_inst|gbdcam|Last_XCK_Reg [0]));
defparam \macro_inst|gbdcam|Last_XCK_Reg[0] .coord_x = 15;
defparam \macro_inst|gbdcam|Last_XCK_Reg[0] .coord_y = 2;
defparam \macro_inst|gbdcam|Last_XCK_Reg[0] .coord_z = 12;
defparam \macro_inst|gbdcam|Last_XCK_Reg[0] .mask = 16'hFF00;
defparam \macro_inst|gbdcam|Last_XCK_Reg[0] .modeMux = 1'b0;
defparam \macro_inst|gbdcam|Last_XCK_Reg[0] .FeedbackMux = 1'b0;
defparam \macro_inst|gbdcam|Last_XCK_Reg[0] .ShiftMux = 1'b0;
defparam \macro_inst|gbdcam|Last_XCK_Reg[0] .BypassEn = 1'b0;
defparam \macro_inst|gbdcam|Last_XCK_Reg[0] .CarryEnb = 1'b1;

alta_slice \macro_inst|gbdcam|Last_XCK_Reg[1] (
	.A(\macro_inst|gbdcam|Last_XCK_Reg [0]),
	.B(vcc),
	.C(\macro_inst|gbdcam|Last_XCK_Reg [0]),
	.D(\macro_inst|gbdreg|Cam_Capture~q ),
	.Cin(),
	.Qin(\macro_inst|gbdcam|Last_XCK_Reg [1]),
	.Clk(\auto_generated_inst.hbo_22_f9ff3d300b43c0f2_bp_X59_Y3_SIG_VCC ),
	.AsyncReset(\sys_resetn~clkctrl_outclk__AsyncReset_X59_Y3_SIG ),
	.SyncReset(SyncReset_X59_Y3_GND),
	.ShiftData(),
	.SyncLoad(SyncLoad_X59_Y3_VCC),
	.LutOut(\macro_inst|gbdcam|counter0[23]~29_combout ),
	.Cout(),
	.Q(\macro_inst|gbdcam|Last_XCK_Reg [1]));
defparam \macro_inst|gbdcam|Last_XCK_Reg[1] .coord_x = 15;
defparam \macro_inst|gbdcam|Last_XCK_Reg[1] .coord_y = 2;
defparam \macro_inst|gbdcam|Last_XCK_Reg[1] .coord_z = 15;
defparam \macro_inst|gbdcam|Last_XCK_Reg[1] .mask = 16'h0A00;
defparam \macro_inst|gbdcam|Last_XCK_Reg[1] .modeMux = 1'b0;
defparam \macro_inst|gbdcam|Last_XCK_Reg[1] .FeedbackMux = 1'b1;
defparam \macro_inst|gbdcam|Last_XCK_Reg[1] .ShiftMux = 1'b0;
defparam \macro_inst|gbdcam|Last_XCK_Reg[1] .BypassEn = 1'b1;
defparam \macro_inst|gbdcam|Last_XCK_Reg[1] .CarryEnb = 1'b1;

alta_slice \macro_inst|gbdcam|Sens_XCK_Reg (
	.A(vcc),
	.B(vcc),
	.C(vcc),
	.D(vcc),
	.Cin(),
	.Qin(\macro_inst|gbdcam|Sens_XCK_Reg~q ),
	.Clk(\cart_CLK~input_o_X44_Y1_SIG_VCC ),
	.AsyncReset(\sys_resetn~clkctrl_outclk__AsyncReset_X44_Y1_SIG ),
	.SyncReset(),
	.ShiftData(),
	.SyncLoad(),
	.LutOut(\macro_inst|gbdcam|Sens_XCK_Reg~0_combout ),
	.Cout(),
	.Q(\macro_inst|gbdcam|Sens_XCK_Reg~q ));
defparam \macro_inst|gbdcam|Sens_XCK_Reg .coord_x = 17;
defparam \macro_inst|gbdcam|Sens_XCK_Reg .coord_y = 2;
defparam \macro_inst|gbdcam|Sens_XCK_Reg .coord_z = 12;
defparam \macro_inst|gbdcam|Sens_XCK_Reg .mask = 16'h0F0F;
defparam \macro_inst|gbdcam|Sens_XCK_Reg .modeMux = 1'b0;
defparam \macro_inst|gbdcam|Sens_XCK_Reg .FeedbackMux = 1'b1;
defparam \macro_inst|gbdcam|Sens_XCK_Reg .ShiftMux = 1'b0;
defparam \macro_inst|gbdcam|Sens_XCK_Reg .BypassEn = 1'b0;
defparam \macro_inst|gbdcam|Sens_XCK_Reg .CarryEnb = 1'b1;

alta_slice \macro_inst|gbdcam|counter0[0] (
	.A(vcc),
	.B(\macro_inst|gbdcam|counter0 [0]),
	.C(vcc),
	.D(vcc),
	.Cin(),
	.Qin(\macro_inst|gbdcam|counter0 [0]),
	.Clk(\auto_generated_inst.hbo_22_f9ff3d300b43c0f2_bp__macro_inst|gbdcam|counter0[23]~32_combout_X60_Y3_SIG_SIG ),
	.AsyncReset(\sys_resetn~clkctrl_outclk__AsyncReset_X60_Y3_SIG ),
	.SyncReset(\macro_inst|gbdcam|main_state.S_WAIT0~q__SyncReset_X60_Y3_INV ),
	.ShiftData(),
	.SyncLoad(SyncLoad_X60_Y3_GND),
	.LutOut(\macro_inst|gbdcam|counter0[0]~30_combout ),
	.Cout(\macro_inst|gbdcam|counter0[0]~31 ),
	.Q(\macro_inst|gbdcam|counter0 [0]));
defparam \macro_inst|gbdcam|counter0[0] .coord_x = 16;
defparam \macro_inst|gbdcam|counter0[0] .coord_y = 2;
defparam \macro_inst|gbdcam|counter0[0] .coord_z = 4;
defparam \macro_inst|gbdcam|counter0[0] .mask = 16'h33CC;
defparam \macro_inst|gbdcam|counter0[0] .modeMux = 1'b0;
defparam \macro_inst|gbdcam|counter0[0] .FeedbackMux = 1'b0;
defparam \macro_inst|gbdcam|counter0[0] .ShiftMux = 1'b0;
defparam \macro_inst|gbdcam|counter0[0] .BypassEn = 1'b1;
defparam \macro_inst|gbdcam|counter0[0] .CarryEnb = 1'b0;

alta_slice \macro_inst|gbdcam|counter0[10] (
	.A(vcc),
	.B(\macro_inst|gbdcam|counter0 [10]),
	.C(vcc),
	.D(vcc),
	.Cin(\macro_inst|gbdcam|counter0[9]~50 ),
	.Qin(\macro_inst|gbdcam|counter0 [10]),
	.Clk(\auto_generated_inst.hbo_22_f9ff3d300b43c0f2_bp__macro_inst|gbdcam|counter0[23]~32_combout_X60_Y3_SIG_SIG ),
	.AsyncReset(\sys_resetn~clkctrl_outclk__AsyncReset_X60_Y3_SIG ),
	.SyncReset(\macro_inst|gbdcam|main_state.S_WAIT0~q__SyncReset_X60_Y3_INV ),
	.ShiftData(),
	.SyncLoad(SyncLoad_X60_Y3_GND),
	.LutOut(\macro_inst|gbdcam|counter0[10]~51_combout ),
	.Cout(\macro_inst|gbdcam|counter0[10]~52 ),
	.Q(\macro_inst|gbdcam|counter0 [10]));
defparam \macro_inst|gbdcam|counter0[10] .coord_x = 16;
defparam \macro_inst|gbdcam|counter0[10] .coord_y = 2;
defparam \macro_inst|gbdcam|counter0[10] .coord_z = 14;
defparam \macro_inst|gbdcam|counter0[10] .mask = 16'hC30C;
defparam \macro_inst|gbdcam|counter0[10] .modeMux = 1'b1;
defparam \macro_inst|gbdcam|counter0[10] .FeedbackMux = 1'b0;
defparam \macro_inst|gbdcam|counter0[10] .ShiftMux = 1'b0;
defparam \macro_inst|gbdcam|counter0[10] .BypassEn = 1'b1;
defparam \macro_inst|gbdcam|counter0[10] .CarryEnb = 1'b0;

alta_slice \macro_inst|gbdcam|counter0[11] (
	.A(vcc),
	.B(\macro_inst|gbdcam|counter0 [11]),
	.C(vcc),
	.D(vcc),
	.Cin(\macro_inst|gbdcam|counter0[10]~52 ),
	.Qin(\macro_inst|gbdcam|counter0 [11]),
	.Clk(\auto_generated_inst.hbo_22_f9ff3d300b43c0f2_bp__macro_inst|gbdcam|counter0[23]~32_combout_X60_Y3_SIG_SIG ),
	.AsyncReset(\sys_resetn~clkctrl_outclk__AsyncReset_X60_Y3_SIG ),
	.SyncReset(\macro_inst|gbdcam|main_state.S_WAIT0~q__SyncReset_X60_Y3_INV ),
	.ShiftData(),
	.SyncLoad(SyncLoad_X60_Y3_GND),
	.LutOut(\macro_inst|gbdcam|counter0[11]~53_combout ),
	.Cout(\macro_inst|gbdcam|counter0[11]~54 ),
	.Q(\macro_inst|gbdcam|counter0 [11]));
defparam \macro_inst|gbdcam|counter0[11] .coord_x = 16;
defparam \macro_inst|gbdcam|counter0[11] .coord_y = 2;
defparam \macro_inst|gbdcam|counter0[11] .coord_z = 15;
defparam \macro_inst|gbdcam|counter0[11] .mask = 16'h3C3F;
defparam \macro_inst|gbdcam|counter0[11] .modeMux = 1'b1;
defparam \macro_inst|gbdcam|counter0[11] .FeedbackMux = 1'b0;
defparam \macro_inst|gbdcam|counter0[11] .ShiftMux = 1'b0;
defparam \macro_inst|gbdcam|counter0[11] .BypassEn = 1'b1;
defparam \macro_inst|gbdcam|counter0[11] .CarryEnb = 1'b0;

alta_slice \macro_inst|gbdcam|counter0[12] (
	.A(vcc),
	.B(\macro_inst|gbdcam|counter0 [12]),
	.C(vcc),
	.D(vcc),
	.Cin(\macro_inst|gbdcam|counter0[11]~54 ),
	.Qin(\macro_inst|gbdcam|counter0 [12]),
	.Clk(\auto_generated_inst.hbo_22_f9ff3d300b43c0f2_bp__macro_inst|gbdcam|counter0[23]~32_combout_X60_Y2_SIG_SIG ),
	.AsyncReset(\sys_resetn~clkctrl_outclk__AsyncReset_X60_Y2_SIG ),
	.SyncReset(\macro_inst|gbdcam|main_state.S_WAIT0~q__SyncReset_X60_Y2_INV ),
	.ShiftData(),
	.SyncLoad(SyncLoad_X60_Y2_GND),
	.LutOut(\macro_inst|gbdcam|counter0[12]~55_combout ),
	.Cout(\macro_inst|gbdcam|counter0[12]~56 ),
	.Q(\macro_inst|gbdcam|counter0 [12]));
defparam \macro_inst|gbdcam|counter0[12] .coord_x = 16;
defparam \macro_inst|gbdcam|counter0[12] .coord_y = 1;
defparam \macro_inst|gbdcam|counter0[12] .coord_z = 0;
defparam \macro_inst|gbdcam|counter0[12] .mask = 16'hC30C;
defparam \macro_inst|gbdcam|counter0[12] .modeMux = 1'b1;
defparam \macro_inst|gbdcam|counter0[12] .FeedbackMux = 1'b0;
defparam \macro_inst|gbdcam|counter0[12] .ShiftMux = 1'b0;
defparam \macro_inst|gbdcam|counter0[12] .BypassEn = 1'b1;
defparam \macro_inst|gbdcam|counter0[12] .CarryEnb = 1'b0;

alta_slice \macro_inst|gbdcam|counter0[13] (
	.A(vcc),
	.B(\macro_inst|gbdcam|counter0 [13]),
	.C(vcc),
	.D(vcc),
	.Cin(\macro_inst|gbdcam|counter0[12]~56 ),
	.Qin(\macro_inst|gbdcam|counter0 [13]),
	.Clk(\auto_generated_inst.hbo_22_f9ff3d300b43c0f2_bp__macro_inst|gbdcam|counter0[23]~32_combout_X60_Y2_SIG_SIG ),
	.AsyncReset(\sys_resetn~clkctrl_outclk__AsyncReset_X60_Y2_SIG ),
	.SyncReset(\macro_inst|gbdcam|main_state.S_WAIT0~q__SyncReset_X60_Y2_INV ),
	.ShiftData(),
	.SyncLoad(SyncLoad_X60_Y2_GND),
	.LutOut(\macro_inst|gbdcam|counter0[13]~57_combout ),
	.Cout(\macro_inst|gbdcam|counter0[13]~58 ),
	.Q(\macro_inst|gbdcam|counter0 [13]));
defparam \macro_inst|gbdcam|counter0[13] .coord_x = 16;
defparam \macro_inst|gbdcam|counter0[13] .coord_y = 1;
defparam \macro_inst|gbdcam|counter0[13] .coord_z = 1;
defparam \macro_inst|gbdcam|counter0[13] .mask = 16'h3C3F;
defparam \macro_inst|gbdcam|counter0[13] .modeMux = 1'b1;
defparam \macro_inst|gbdcam|counter0[13] .FeedbackMux = 1'b0;
defparam \macro_inst|gbdcam|counter0[13] .ShiftMux = 1'b0;
defparam \macro_inst|gbdcam|counter0[13] .BypassEn = 1'b1;
defparam \macro_inst|gbdcam|counter0[13] .CarryEnb = 1'b0;

alta_slice \macro_inst|gbdcam|counter0[14] (
	.A(vcc),
	.B(\macro_inst|gbdcam|counter0 [14]),
	.C(vcc),
	.D(vcc),
	.Cin(\macro_inst|gbdcam|counter0[13]~58 ),
	.Qin(\macro_inst|gbdcam|counter0 [14]),
	.Clk(\auto_generated_inst.hbo_22_f9ff3d300b43c0f2_bp__macro_inst|gbdcam|counter0[23]~32_combout_X60_Y2_SIG_SIG ),
	.AsyncReset(\sys_resetn~clkctrl_outclk__AsyncReset_X60_Y2_SIG ),
	.SyncReset(\macro_inst|gbdcam|main_state.S_WAIT0~q__SyncReset_X60_Y2_INV ),
	.ShiftData(),
	.SyncLoad(SyncLoad_X60_Y2_GND),
	.LutOut(\macro_inst|gbdcam|counter0[14]~59_combout ),
	.Cout(\macro_inst|gbdcam|counter0[14]~60 ),
	.Q(\macro_inst|gbdcam|counter0 [14]));
defparam \macro_inst|gbdcam|counter0[14] .coord_x = 16;
defparam \macro_inst|gbdcam|counter0[14] .coord_y = 1;
defparam \macro_inst|gbdcam|counter0[14] .coord_z = 2;
defparam \macro_inst|gbdcam|counter0[14] .mask = 16'hC30C;
defparam \macro_inst|gbdcam|counter0[14] .modeMux = 1'b1;
defparam \macro_inst|gbdcam|counter0[14] .FeedbackMux = 1'b0;
defparam \macro_inst|gbdcam|counter0[14] .ShiftMux = 1'b0;
defparam \macro_inst|gbdcam|counter0[14] .BypassEn = 1'b1;
defparam \macro_inst|gbdcam|counter0[14] .CarryEnb = 1'b0;

alta_slice \macro_inst|gbdcam|counter0[15] (
	.A(vcc),
	.B(\macro_inst|gbdcam|counter0 [15]),
	.C(vcc),
	.D(vcc),
	.Cin(\macro_inst|gbdcam|counter0[14]~60 ),
	.Qin(\macro_inst|gbdcam|counter0 [15]),
	.Clk(\auto_generated_inst.hbo_22_f9ff3d300b43c0f2_bp__macro_inst|gbdcam|counter0[23]~32_combout_X60_Y2_SIG_SIG ),
	.AsyncReset(\sys_resetn~clkctrl_outclk__AsyncReset_X60_Y2_SIG ),
	.SyncReset(\macro_inst|gbdcam|main_state.S_WAIT0~q__SyncReset_X60_Y2_INV ),
	.ShiftData(),
	.SyncLoad(SyncLoad_X60_Y2_GND),
	.LutOut(\macro_inst|gbdcam|counter0[15]~61_combout ),
	.Cout(\macro_inst|gbdcam|counter0[15]~62 ),
	.Q(\macro_inst|gbdcam|counter0 [15]));
defparam \macro_inst|gbdcam|counter0[15] .coord_x = 16;
defparam \macro_inst|gbdcam|counter0[15] .coord_y = 1;
defparam \macro_inst|gbdcam|counter0[15] .coord_z = 3;
defparam \macro_inst|gbdcam|counter0[15] .mask = 16'h3C3F;
defparam \macro_inst|gbdcam|counter0[15] .modeMux = 1'b1;
defparam \macro_inst|gbdcam|counter0[15] .FeedbackMux = 1'b0;
defparam \macro_inst|gbdcam|counter0[15] .ShiftMux = 1'b0;
defparam \macro_inst|gbdcam|counter0[15] .BypassEn = 1'b1;
defparam \macro_inst|gbdcam|counter0[15] .CarryEnb = 1'b0;

alta_slice \macro_inst|gbdcam|counter0[16] (
	.A(vcc),
	.B(\macro_inst|gbdcam|counter0 [16]),
	.C(vcc),
	.D(vcc),
	.Cin(\macro_inst|gbdcam|counter0[15]~62 ),
	.Qin(\macro_inst|gbdcam|counter0 [16]),
	.Clk(\auto_generated_inst.hbo_22_f9ff3d300b43c0f2_bp__macro_inst|gbdcam|counter0[23]~32_combout_X60_Y2_SIG_SIG ),
	.AsyncReset(\sys_resetn~clkctrl_outclk__AsyncReset_X60_Y2_SIG ),
	.SyncReset(\macro_inst|gbdcam|main_state.S_WAIT0~q__SyncReset_X60_Y2_INV ),
	.ShiftData(),
	.SyncLoad(SyncLoad_X60_Y2_GND),
	.LutOut(\macro_inst|gbdcam|counter0[16]~63_combout ),
	.Cout(\macro_inst|gbdcam|counter0[16]~64 ),
	.Q(\macro_inst|gbdcam|counter0 [16]));
defparam \macro_inst|gbdcam|counter0[16] .coord_x = 16;
defparam \macro_inst|gbdcam|counter0[16] .coord_y = 1;
defparam \macro_inst|gbdcam|counter0[16] .coord_z = 4;
defparam \macro_inst|gbdcam|counter0[16] .mask = 16'hC30C;
defparam \macro_inst|gbdcam|counter0[16] .modeMux = 1'b1;
defparam \macro_inst|gbdcam|counter0[16] .FeedbackMux = 1'b0;
defparam \macro_inst|gbdcam|counter0[16] .ShiftMux = 1'b0;
defparam \macro_inst|gbdcam|counter0[16] .BypassEn = 1'b1;
defparam \macro_inst|gbdcam|counter0[16] .CarryEnb = 1'b0;

alta_slice \macro_inst|gbdcam|counter0[17] (
	.A(vcc),
	.B(\macro_inst|gbdcam|counter0 [17]),
	.C(vcc),
	.D(vcc),
	.Cin(\macro_inst|gbdcam|counter0[16]~64 ),
	.Qin(\macro_inst|gbdcam|counter0 [17]),
	.Clk(\auto_generated_inst.hbo_22_f9ff3d300b43c0f2_bp__macro_inst|gbdcam|counter0[23]~32_combout_X60_Y2_SIG_SIG ),
	.AsyncReset(\sys_resetn~clkctrl_outclk__AsyncReset_X60_Y2_SIG ),
	.SyncReset(\macro_inst|gbdcam|main_state.S_WAIT0~q__SyncReset_X60_Y2_INV ),
	.ShiftData(),
	.SyncLoad(SyncLoad_X60_Y2_GND),
	.LutOut(\macro_inst|gbdcam|counter0[17]~65_combout ),
	.Cout(\macro_inst|gbdcam|counter0[17]~66 ),
	.Q(\macro_inst|gbdcam|counter0 [17]));
defparam \macro_inst|gbdcam|counter0[17] .coord_x = 16;
defparam \macro_inst|gbdcam|counter0[17] .coord_y = 1;
defparam \macro_inst|gbdcam|counter0[17] .coord_z = 5;
defparam \macro_inst|gbdcam|counter0[17] .mask = 16'h3C3F;
defparam \macro_inst|gbdcam|counter0[17] .modeMux = 1'b1;
defparam \macro_inst|gbdcam|counter0[17] .FeedbackMux = 1'b0;
defparam \macro_inst|gbdcam|counter0[17] .ShiftMux = 1'b0;
defparam \macro_inst|gbdcam|counter0[17] .BypassEn = 1'b1;
defparam \macro_inst|gbdcam|counter0[17] .CarryEnb = 1'b0;

alta_slice \macro_inst|gbdcam|counter0[18] (
	.A(vcc),
	.B(\macro_inst|gbdcam|counter0 [18]),
	.C(vcc),
	.D(vcc),
	.Cin(\macro_inst|gbdcam|counter0[17]~66 ),
	.Qin(\macro_inst|gbdcam|counter0 [18]),
	.Clk(\auto_generated_inst.hbo_22_f9ff3d300b43c0f2_bp__macro_inst|gbdcam|counter0[23]~32_combout_X60_Y2_SIG_SIG ),
	.AsyncReset(\sys_resetn~clkctrl_outclk__AsyncReset_X60_Y2_SIG ),
	.SyncReset(\macro_inst|gbdcam|main_state.S_WAIT0~q__SyncReset_X60_Y2_INV ),
	.ShiftData(),
	.SyncLoad(SyncLoad_X60_Y2_GND),
	.LutOut(\macro_inst|gbdcam|counter0[18]~67_combout ),
	.Cout(\macro_inst|gbdcam|counter0[18]~68 ),
	.Q(\macro_inst|gbdcam|counter0 [18]));
defparam \macro_inst|gbdcam|counter0[18] .coord_x = 16;
defparam \macro_inst|gbdcam|counter0[18] .coord_y = 1;
defparam \macro_inst|gbdcam|counter0[18] .coord_z = 6;
defparam \macro_inst|gbdcam|counter0[18] .mask = 16'hC30C;
defparam \macro_inst|gbdcam|counter0[18] .modeMux = 1'b1;
defparam \macro_inst|gbdcam|counter0[18] .FeedbackMux = 1'b0;
defparam \macro_inst|gbdcam|counter0[18] .ShiftMux = 1'b0;
defparam \macro_inst|gbdcam|counter0[18] .BypassEn = 1'b1;
defparam \macro_inst|gbdcam|counter0[18] .CarryEnb = 1'b0;

alta_slice \macro_inst|gbdcam|counter0[19] (
	.A(vcc),
	.B(\macro_inst|gbdcam|counter0 [19]),
	.C(vcc),
	.D(vcc),
	.Cin(\macro_inst|gbdcam|counter0[18]~68 ),
	.Qin(\macro_inst|gbdcam|counter0 [19]),
	.Clk(\auto_generated_inst.hbo_22_f9ff3d300b43c0f2_bp__macro_inst|gbdcam|counter0[23]~32_combout_X60_Y2_SIG_SIG ),
	.AsyncReset(\sys_resetn~clkctrl_outclk__AsyncReset_X60_Y2_SIG ),
	.SyncReset(\macro_inst|gbdcam|main_state.S_WAIT0~q__SyncReset_X60_Y2_INV ),
	.ShiftData(),
	.SyncLoad(SyncLoad_X60_Y2_GND),
	.LutOut(\macro_inst|gbdcam|counter0[19]~69_combout ),
	.Cout(\macro_inst|gbdcam|counter0[19]~70 ),
	.Q(\macro_inst|gbdcam|counter0 [19]));
defparam \macro_inst|gbdcam|counter0[19] .coord_x = 16;
defparam \macro_inst|gbdcam|counter0[19] .coord_y = 1;
defparam \macro_inst|gbdcam|counter0[19] .coord_z = 7;
defparam \macro_inst|gbdcam|counter0[19] .mask = 16'h3C3F;
defparam \macro_inst|gbdcam|counter0[19] .modeMux = 1'b1;
defparam \macro_inst|gbdcam|counter0[19] .FeedbackMux = 1'b0;
defparam \macro_inst|gbdcam|counter0[19] .ShiftMux = 1'b0;
defparam \macro_inst|gbdcam|counter0[19] .BypassEn = 1'b1;
defparam \macro_inst|gbdcam|counter0[19] .CarryEnb = 1'b0;

alta_slice \macro_inst|gbdcam|counter0[1] (
	.A(vcc),
	.B(\macro_inst|gbdcam|counter0 [1]),
	.C(vcc),
	.D(vcc),
	.Cin(\macro_inst|gbdcam|counter0[0]~31 ),
	.Qin(\macro_inst|gbdcam|counter0 [1]),
	.Clk(\auto_generated_inst.hbo_22_f9ff3d300b43c0f2_bp__macro_inst|gbdcam|counter0[23]~32_combout_X60_Y3_SIG_SIG ),
	.AsyncReset(\sys_resetn~clkctrl_outclk__AsyncReset_X60_Y3_SIG ),
	.SyncReset(\macro_inst|gbdcam|main_state.S_WAIT0~q__SyncReset_X60_Y3_INV ),
	.ShiftData(),
	.SyncLoad(SyncLoad_X60_Y3_GND),
	.LutOut(\macro_inst|gbdcam|counter0[1]~33_combout ),
	.Cout(\macro_inst|gbdcam|counter0[1]~34 ),
	.Q(\macro_inst|gbdcam|counter0 [1]));
defparam \macro_inst|gbdcam|counter0[1] .coord_x = 16;
defparam \macro_inst|gbdcam|counter0[1] .coord_y = 2;
defparam \macro_inst|gbdcam|counter0[1] .coord_z = 5;
defparam \macro_inst|gbdcam|counter0[1] .mask = 16'h3C3F;
defparam \macro_inst|gbdcam|counter0[1] .modeMux = 1'b1;
defparam \macro_inst|gbdcam|counter0[1] .FeedbackMux = 1'b0;
defparam \macro_inst|gbdcam|counter0[1] .ShiftMux = 1'b0;
defparam \macro_inst|gbdcam|counter0[1] .BypassEn = 1'b1;
defparam \macro_inst|gbdcam|counter0[1] .CarryEnb = 1'b0;

alta_slice \macro_inst|gbdcam|counter0[20] (
	.A(vcc),
	.B(\macro_inst|gbdcam|counter0 [20]),
	.C(vcc),
	.D(vcc),
	.Cin(\macro_inst|gbdcam|counter0[19]~70 ),
	.Qin(\macro_inst|gbdcam|counter0 [20]),
	.Clk(\auto_generated_inst.hbo_22_f9ff3d300b43c0f2_bp__macro_inst|gbdcam|counter0[23]~32_combout_X60_Y2_SIG_SIG ),
	.AsyncReset(\sys_resetn~clkctrl_outclk__AsyncReset_X60_Y2_SIG ),
	.SyncReset(\macro_inst|gbdcam|main_state.S_WAIT0~q__SyncReset_X60_Y2_INV ),
	.ShiftData(),
	.SyncLoad(SyncLoad_X60_Y2_GND),
	.LutOut(\macro_inst|gbdcam|counter0[20]~71_combout ),
	.Cout(\macro_inst|gbdcam|counter0[20]~72 ),
	.Q(\macro_inst|gbdcam|counter0 [20]));
defparam \macro_inst|gbdcam|counter0[20] .coord_x = 16;
defparam \macro_inst|gbdcam|counter0[20] .coord_y = 1;
defparam \macro_inst|gbdcam|counter0[20] .coord_z = 8;
defparam \macro_inst|gbdcam|counter0[20] .mask = 16'hC30C;
defparam \macro_inst|gbdcam|counter0[20] .modeMux = 1'b1;
defparam \macro_inst|gbdcam|counter0[20] .FeedbackMux = 1'b0;
defparam \macro_inst|gbdcam|counter0[20] .ShiftMux = 1'b0;
defparam \macro_inst|gbdcam|counter0[20] .BypassEn = 1'b1;
defparam \macro_inst|gbdcam|counter0[20] .CarryEnb = 1'b0;

alta_slice \macro_inst|gbdcam|counter0[21] (
	.A(vcc),
	.B(\macro_inst|gbdcam|counter0 [21]),
	.C(vcc),
	.D(vcc),
	.Cin(\macro_inst|gbdcam|counter0[20]~72 ),
	.Qin(\macro_inst|gbdcam|counter0 [21]),
	.Clk(\auto_generated_inst.hbo_22_f9ff3d300b43c0f2_bp__macro_inst|gbdcam|counter0[23]~32_combout_X60_Y2_SIG_SIG ),
	.AsyncReset(\sys_resetn~clkctrl_outclk__AsyncReset_X60_Y2_SIG ),
	.SyncReset(\macro_inst|gbdcam|main_state.S_WAIT0~q__SyncReset_X60_Y2_INV ),
	.ShiftData(),
	.SyncLoad(SyncLoad_X60_Y2_GND),
	.LutOut(\macro_inst|gbdcam|counter0[21]~73_combout ),
	.Cout(\macro_inst|gbdcam|counter0[21]~74 ),
	.Q(\macro_inst|gbdcam|counter0 [21]));
defparam \macro_inst|gbdcam|counter0[21] .coord_x = 16;
defparam \macro_inst|gbdcam|counter0[21] .coord_y = 1;
defparam \macro_inst|gbdcam|counter0[21] .coord_z = 9;
defparam \macro_inst|gbdcam|counter0[21] .mask = 16'h3C3F;
defparam \macro_inst|gbdcam|counter0[21] .modeMux = 1'b1;
defparam \macro_inst|gbdcam|counter0[21] .FeedbackMux = 1'b0;
defparam \macro_inst|gbdcam|counter0[21] .ShiftMux = 1'b0;
defparam \macro_inst|gbdcam|counter0[21] .BypassEn = 1'b1;
defparam \macro_inst|gbdcam|counter0[21] .CarryEnb = 1'b0;

alta_slice \macro_inst|gbdcam|counter0[22] (
	.A(vcc),
	.B(\macro_inst|gbdcam|counter0 [22]),
	.C(vcc),
	.D(vcc),
	.Cin(\macro_inst|gbdcam|counter0[21]~74 ),
	.Qin(\macro_inst|gbdcam|counter0 [22]),
	.Clk(\auto_generated_inst.hbo_22_f9ff3d300b43c0f2_bp__macro_inst|gbdcam|counter0[23]~32_combout_X60_Y2_SIG_SIG ),
	.AsyncReset(\sys_resetn~clkctrl_outclk__AsyncReset_X60_Y2_SIG ),
	.SyncReset(\macro_inst|gbdcam|main_state.S_WAIT0~q__SyncReset_X60_Y2_INV ),
	.ShiftData(),
	.SyncLoad(SyncLoad_X60_Y2_GND),
	.LutOut(\macro_inst|gbdcam|counter0[22]~75_combout ),
	.Cout(\macro_inst|gbdcam|counter0[22]~76 ),
	.Q(\macro_inst|gbdcam|counter0 [22]));
defparam \macro_inst|gbdcam|counter0[22] .coord_x = 16;
defparam \macro_inst|gbdcam|counter0[22] .coord_y = 1;
defparam \macro_inst|gbdcam|counter0[22] .coord_z = 10;
defparam \macro_inst|gbdcam|counter0[22] .mask = 16'hC30C;
defparam \macro_inst|gbdcam|counter0[22] .modeMux = 1'b1;
defparam \macro_inst|gbdcam|counter0[22] .FeedbackMux = 1'b0;
defparam \macro_inst|gbdcam|counter0[22] .ShiftMux = 1'b0;
defparam \macro_inst|gbdcam|counter0[22] .BypassEn = 1'b1;
defparam \macro_inst|gbdcam|counter0[22] .CarryEnb = 1'b0;

alta_slice \macro_inst|gbdcam|counter0[23] (
	.A(vcc),
	.B(vcc),
	.C(vcc),
	.D(\macro_inst|gbdcam|counter0 [23]),
	.Cin(\macro_inst|gbdcam|counter0[22]~76 ),
	.Qin(\macro_inst|gbdcam|counter0 [23]),
	.Clk(\auto_generated_inst.hbo_22_f9ff3d300b43c0f2_bp__macro_inst|gbdcam|counter0[23]~32_combout_X60_Y2_SIG_SIG ),
	.AsyncReset(\sys_resetn~clkctrl_outclk__AsyncReset_X60_Y2_SIG ),
	.SyncReset(\macro_inst|gbdcam|main_state.S_WAIT0~q__SyncReset_X60_Y2_INV ),
	.ShiftData(),
	.SyncLoad(SyncLoad_X60_Y2_GND),
	.LutOut(\macro_inst|gbdcam|counter0[23]~77_combout ),
	.Cout(),
	.Q(\macro_inst|gbdcam|counter0 [23]));
defparam \macro_inst|gbdcam|counter0[23] .coord_x = 16;
defparam \macro_inst|gbdcam|counter0[23] .coord_y = 1;
defparam \macro_inst|gbdcam|counter0[23] .coord_z = 11;
defparam \macro_inst|gbdcam|counter0[23] .mask = 16'h0FF0;
defparam \macro_inst|gbdcam|counter0[23] .modeMux = 1'b1;
defparam \macro_inst|gbdcam|counter0[23] .FeedbackMux = 1'b0;
defparam \macro_inst|gbdcam|counter0[23] .ShiftMux = 1'b0;
defparam \macro_inst|gbdcam|counter0[23] .BypassEn = 1'b1;
defparam \macro_inst|gbdcam|counter0[23] .CarryEnb = 1'b1;

alta_slice \macro_inst|gbdcam|counter0[23]~28 (
	.A(\macro_inst|gbdcam|counter0 [18]),
	.B(\macro_inst|gbdcam|counter0[23]~28_RESYN0_BDD1 ),
	.C(\macro_inst|gbdcam|counter0[23]~28_RESYN2_BDD3 ),
	.D(\macro_inst|gbdcam|counter0 [15]),
	.Cin(),
	.Qin(),
	.Clk(),
	.AsyncReset(),
	.SyncReset(),
	.ShiftData(),
	.SyncLoad(),
	.LutOut(\macro_inst|gbdcam|counter0[23]~28_combout ),
	.Cout(),
	.Q());
defparam \macro_inst|gbdcam|counter0[23]~28 .coord_x = 16;
defparam \macro_inst|gbdcam|counter0[23]~28 .coord_y = 1;
defparam \macro_inst|gbdcam|counter0[23]~28 .coord_z = 12;
defparam \macro_inst|gbdcam|counter0[23]~28 .mask = 16'h0040;
defparam \macro_inst|gbdcam|counter0[23]~28 .modeMux = 1'b0;
defparam \macro_inst|gbdcam|counter0[23]~28 .FeedbackMux = 1'b0;
defparam \macro_inst|gbdcam|counter0[23]~28 .ShiftMux = 1'b0;
defparam \macro_inst|gbdcam|counter0[23]~28 .BypassEn = 1'b0;
defparam \macro_inst|gbdcam|counter0[23]~28 .CarryEnb = 1'b1;

alta_slice \macro_inst|gbdcam|counter0[23]~28_RESYN0 (
	.A(\macro_inst|gbdcam|counter0 [20]),
	.B(\macro_inst|gbdcam|counter0 [23]),
	.C(\macro_inst|gbdcam|counter0 [22]),
	.D(\macro_inst|gbdcam|counter0 [21]),
	.Cin(),
	.Qin(),
	.Clk(),
	.AsyncReset(),
	.SyncReset(),
	.ShiftData(),
	.SyncLoad(),
	.LutOut(\macro_inst|gbdcam|counter0[23]~28_RESYN0_BDD1 ),
	.Cout(),
	.Q());
defparam \macro_inst|gbdcam|counter0[23]~28_RESYN0 .coord_x = 16;
defparam \macro_inst|gbdcam|counter0[23]~28_RESYN0 .coord_y = 1;
defparam \macro_inst|gbdcam|counter0[23]~28_RESYN0 .coord_z = 13;
defparam \macro_inst|gbdcam|counter0[23]~28_RESYN0 .mask = 16'h0001;
defparam \macro_inst|gbdcam|counter0[23]~28_RESYN0 .modeMux = 1'b0;
defparam \macro_inst|gbdcam|counter0[23]~28_RESYN0 .FeedbackMux = 1'b0;
defparam \macro_inst|gbdcam|counter0[23]~28_RESYN0 .ShiftMux = 1'b0;
defparam \macro_inst|gbdcam|counter0[23]~28_RESYN0 .BypassEn = 1'b0;
defparam \macro_inst|gbdcam|counter0[23]~28_RESYN0 .CarryEnb = 1'b1;

alta_slice \macro_inst|gbdcam|counter0[23]~28_RESYN2 (
	.A(vcc),
	.B(\macro_inst|gbdcam|counter0 [19]),
	.C(\macro_inst|gbdcam|counter0 [16]),
	.D(\macro_inst|gbdcam|counter0 [17]),
	.Cin(),
	.Qin(),
	.Clk(),
	.AsyncReset(),
	.SyncReset(),
	.ShiftData(),
	.SyncLoad(),
	.LutOut(\macro_inst|gbdcam|counter0[23]~28_RESYN2_BDD3 ),
	.Cout(),
	.Q());
defparam \macro_inst|gbdcam|counter0[23]~28_RESYN2 .coord_x = 16;
defparam \macro_inst|gbdcam|counter0[23]~28_RESYN2 .coord_y = 1;
defparam \macro_inst|gbdcam|counter0[23]~28_RESYN2 .coord_z = 14;
defparam \macro_inst|gbdcam|counter0[23]~28_RESYN2 .mask = 16'h0003;
defparam \macro_inst|gbdcam|counter0[23]~28_RESYN2 .modeMux = 1'b0;
defparam \macro_inst|gbdcam|counter0[23]~28_RESYN2 .FeedbackMux = 1'b0;
defparam \macro_inst|gbdcam|counter0[23]~28_RESYN2 .ShiftMux = 1'b0;
defparam \macro_inst|gbdcam|counter0[23]~28_RESYN2 .BypassEn = 1'b0;
defparam \macro_inst|gbdcam|counter0[23]~28_RESYN2 .CarryEnb = 1'b1;

alta_slice \macro_inst|gbdcam|counter0[23]~32 (
	.A(\macro_inst|gbdcam|Equal0~4_combout ),
	.B(\macro_inst|gbdcam|main_state.S_WAIT0~q ),
	.C(\macro_inst|gbdcam|counter0[23]~29_combout ),
	.D(\macro_inst|gbdcam|counter0[23]~28_combout ),
	.Cin(),
	.Qin(),
	.Clk(),
	.AsyncReset(),
	.SyncReset(),
	.ShiftData(),
	.SyncLoad(),
	.LutOut(\macro_inst|gbdcam|counter0[23]~32_combout ),
	.Cout(),
	.Q());
defparam \macro_inst|gbdcam|counter0[23]~32 .coord_x = 15;
defparam \macro_inst|gbdcam|counter0[23]~32 .coord_y = 2;
defparam \macro_inst|gbdcam|counter0[23]~32 .coord_z = 14;
defparam \macro_inst|gbdcam|counter0[23]~32 .mask = 16'h7030;
defparam \macro_inst|gbdcam|counter0[23]~32 .modeMux = 1'b0;
defparam \macro_inst|gbdcam|counter0[23]~32 .FeedbackMux = 1'b0;
defparam \macro_inst|gbdcam|counter0[23]~32 .ShiftMux = 1'b0;
defparam \macro_inst|gbdcam|counter0[23]~32 .BypassEn = 1'b0;
defparam \macro_inst|gbdcam|counter0[23]~32 .CarryEnb = 1'b1;

alta_slice \macro_inst|gbdcam|counter0[2] (
	.A(vcc),
	.B(\macro_inst|gbdcam|counter0 [2]),
	.C(vcc),
	.D(vcc),
	.Cin(\macro_inst|gbdcam|counter0[1]~34 ),
	.Qin(\macro_inst|gbdcam|counter0 [2]),
	.Clk(\auto_generated_inst.hbo_22_f9ff3d300b43c0f2_bp__macro_inst|gbdcam|counter0[23]~32_combout_X60_Y3_SIG_SIG ),
	.AsyncReset(\sys_resetn~clkctrl_outclk__AsyncReset_X60_Y3_SIG ),
	.SyncReset(\macro_inst|gbdcam|main_state.S_WAIT0~q__SyncReset_X60_Y3_INV ),
	.ShiftData(),
	.SyncLoad(SyncLoad_X60_Y3_GND),
	.LutOut(\macro_inst|gbdcam|counter0[2]~35_combout ),
	.Cout(\macro_inst|gbdcam|counter0[2]~36 ),
	.Q(\macro_inst|gbdcam|counter0 [2]));
defparam \macro_inst|gbdcam|counter0[2] .coord_x = 16;
defparam \macro_inst|gbdcam|counter0[2] .coord_y = 2;
defparam \macro_inst|gbdcam|counter0[2] .coord_z = 6;
defparam \macro_inst|gbdcam|counter0[2] .mask = 16'hC30C;
defparam \macro_inst|gbdcam|counter0[2] .modeMux = 1'b1;
defparam \macro_inst|gbdcam|counter0[2] .FeedbackMux = 1'b0;
defparam \macro_inst|gbdcam|counter0[2] .ShiftMux = 1'b0;
defparam \macro_inst|gbdcam|counter0[2] .BypassEn = 1'b1;
defparam \macro_inst|gbdcam|counter0[2] .CarryEnb = 1'b0;

alta_slice \macro_inst|gbdcam|counter0[3] (
	.A(vcc),
	.B(\macro_inst|gbdcam|counter0 [3]),
	.C(vcc),
	.D(vcc),
	.Cin(\macro_inst|gbdcam|counter0[2]~36 ),
	.Qin(\macro_inst|gbdcam|counter0 [3]),
	.Clk(\auto_generated_inst.hbo_22_f9ff3d300b43c0f2_bp__macro_inst|gbdcam|counter0[23]~32_combout_X60_Y3_SIG_SIG ),
	.AsyncReset(\sys_resetn~clkctrl_outclk__AsyncReset_X60_Y3_SIG ),
	.SyncReset(\macro_inst|gbdcam|main_state.S_WAIT0~q__SyncReset_X60_Y3_INV ),
	.ShiftData(),
	.SyncLoad(SyncLoad_X60_Y3_GND),
	.LutOut(\macro_inst|gbdcam|counter0[3]~37_combout ),
	.Cout(\macro_inst|gbdcam|counter0[3]~38 ),
	.Q(\macro_inst|gbdcam|counter0 [3]));
defparam \macro_inst|gbdcam|counter0[3] .coord_x = 16;
defparam \macro_inst|gbdcam|counter0[3] .coord_y = 2;
defparam \macro_inst|gbdcam|counter0[3] .coord_z = 7;
defparam \macro_inst|gbdcam|counter0[3] .mask = 16'h3C3F;
defparam \macro_inst|gbdcam|counter0[3] .modeMux = 1'b1;
defparam \macro_inst|gbdcam|counter0[3] .FeedbackMux = 1'b0;
defparam \macro_inst|gbdcam|counter0[3] .ShiftMux = 1'b0;
defparam \macro_inst|gbdcam|counter0[3] .BypassEn = 1'b1;
defparam \macro_inst|gbdcam|counter0[3] .CarryEnb = 1'b0;

alta_slice \macro_inst|gbdcam|counter0[4] (
	.A(vcc),
	.B(\macro_inst|gbdcam|counter0 [4]),
	.C(vcc),
	.D(vcc),
	.Cin(\macro_inst|gbdcam|counter0[3]~38 ),
	.Qin(\macro_inst|gbdcam|counter0 [4]),
	.Clk(\auto_generated_inst.hbo_22_f9ff3d300b43c0f2_bp__macro_inst|gbdcam|counter0[23]~32_combout_X60_Y3_SIG_SIG ),
	.AsyncReset(\sys_resetn~clkctrl_outclk__AsyncReset_X60_Y3_SIG ),
	.SyncReset(\macro_inst|gbdcam|main_state.S_WAIT0~q__SyncReset_X60_Y3_INV ),
	.ShiftData(),
	.SyncLoad(SyncLoad_X60_Y3_GND),
	.LutOut(\macro_inst|gbdcam|counter0[4]~39_combout ),
	.Cout(\macro_inst|gbdcam|counter0[4]~40 ),
	.Q(\macro_inst|gbdcam|counter0 [4]));
defparam \macro_inst|gbdcam|counter0[4] .coord_x = 16;
defparam \macro_inst|gbdcam|counter0[4] .coord_y = 2;
defparam \macro_inst|gbdcam|counter0[4] .coord_z = 8;
defparam \macro_inst|gbdcam|counter0[4] .mask = 16'hC30C;
defparam \macro_inst|gbdcam|counter0[4] .modeMux = 1'b1;
defparam \macro_inst|gbdcam|counter0[4] .FeedbackMux = 1'b0;
defparam \macro_inst|gbdcam|counter0[4] .ShiftMux = 1'b0;
defparam \macro_inst|gbdcam|counter0[4] .BypassEn = 1'b1;
defparam \macro_inst|gbdcam|counter0[4] .CarryEnb = 1'b0;

alta_slice \macro_inst|gbdcam|counter0[5] (
	.A(vcc),
	.B(\macro_inst|gbdcam|counter0 [5]),
	.C(vcc),
	.D(vcc),
	.Cin(\macro_inst|gbdcam|counter0[4]~40 ),
	.Qin(\macro_inst|gbdcam|counter0 [5]),
	.Clk(\auto_generated_inst.hbo_22_f9ff3d300b43c0f2_bp__macro_inst|gbdcam|counter0[23]~32_combout_X60_Y3_SIG_SIG ),
	.AsyncReset(\sys_resetn~clkctrl_outclk__AsyncReset_X60_Y3_SIG ),
	.SyncReset(\macro_inst|gbdcam|main_state.S_WAIT0~q__SyncReset_X60_Y3_INV ),
	.ShiftData(),
	.SyncLoad(SyncLoad_X60_Y3_GND),
	.LutOut(\macro_inst|gbdcam|counter0[5]~41_combout ),
	.Cout(\macro_inst|gbdcam|counter0[5]~42 ),
	.Q(\macro_inst|gbdcam|counter0 [5]));
defparam \macro_inst|gbdcam|counter0[5] .coord_x = 16;
defparam \macro_inst|gbdcam|counter0[5] .coord_y = 2;
defparam \macro_inst|gbdcam|counter0[5] .coord_z = 9;
defparam \macro_inst|gbdcam|counter0[5] .mask = 16'h3C3F;
defparam \macro_inst|gbdcam|counter0[5] .modeMux = 1'b1;
defparam \macro_inst|gbdcam|counter0[5] .FeedbackMux = 1'b0;
defparam \macro_inst|gbdcam|counter0[5] .ShiftMux = 1'b0;
defparam \macro_inst|gbdcam|counter0[5] .BypassEn = 1'b1;
defparam \macro_inst|gbdcam|counter0[5] .CarryEnb = 1'b0;

alta_slice \macro_inst|gbdcam|counter0[6] (
	.A(vcc),
	.B(\macro_inst|gbdcam|counter0 [6]),
	.C(vcc),
	.D(vcc),
	.Cin(\macro_inst|gbdcam|counter0[5]~42 ),
	.Qin(\macro_inst|gbdcam|counter0 [6]),
	.Clk(\auto_generated_inst.hbo_22_f9ff3d300b43c0f2_bp__macro_inst|gbdcam|counter0[23]~32_combout_X60_Y3_SIG_SIG ),
	.AsyncReset(\sys_resetn~clkctrl_outclk__AsyncReset_X60_Y3_SIG ),
	.SyncReset(\macro_inst|gbdcam|main_state.S_WAIT0~q__SyncReset_X60_Y3_INV ),
	.ShiftData(),
	.SyncLoad(SyncLoad_X60_Y3_GND),
	.LutOut(\macro_inst|gbdcam|counter0[6]~43_combout ),
	.Cout(\macro_inst|gbdcam|counter0[6]~44 ),
	.Q(\macro_inst|gbdcam|counter0 [6]));
defparam \macro_inst|gbdcam|counter0[6] .coord_x = 16;
defparam \macro_inst|gbdcam|counter0[6] .coord_y = 2;
defparam \macro_inst|gbdcam|counter0[6] .coord_z = 10;
defparam \macro_inst|gbdcam|counter0[6] .mask = 16'hC30C;
defparam \macro_inst|gbdcam|counter0[6] .modeMux = 1'b1;
defparam \macro_inst|gbdcam|counter0[6] .FeedbackMux = 1'b0;
defparam \macro_inst|gbdcam|counter0[6] .ShiftMux = 1'b0;
defparam \macro_inst|gbdcam|counter0[6] .BypassEn = 1'b1;
defparam \macro_inst|gbdcam|counter0[6] .CarryEnb = 1'b0;

alta_slice \macro_inst|gbdcam|counter0[7] (
	.A(vcc),
	.B(\macro_inst|gbdcam|counter0 [7]),
	.C(vcc),
	.D(vcc),
	.Cin(\macro_inst|gbdcam|counter0[6]~44 ),
	.Qin(\macro_inst|gbdcam|counter0 [7]),
	.Clk(\auto_generated_inst.hbo_22_f9ff3d300b43c0f2_bp__macro_inst|gbdcam|counter0[23]~32_combout_X60_Y3_SIG_SIG ),
	.AsyncReset(\sys_resetn~clkctrl_outclk__AsyncReset_X60_Y3_SIG ),
	.SyncReset(\macro_inst|gbdcam|main_state.S_WAIT0~q__SyncReset_X60_Y3_INV ),
	.ShiftData(),
	.SyncLoad(SyncLoad_X60_Y3_GND),
	.LutOut(\macro_inst|gbdcam|counter0[7]~45_combout ),
	.Cout(\macro_inst|gbdcam|counter0[7]~46 ),
	.Q(\macro_inst|gbdcam|counter0 [7]));
defparam \macro_inst|gbdcam|counter0[7] .coord_x = 16;
defparam \macro_inst|gbdcam|counter0[7] .coord_y = 2;
defparam \macro_inst|gbdcam|counter0[7] .coord_z = 11;
defparam \macro_inst|gbdcam|counter0[7] .mask = 16'h3C3F;
defparam \macro_inst|gbdcam|counter0[7] .modeMux = 1'b1;
defparam \macro_inst|gbdcam|counter0[7] .FeedbackMux = 1'b0;
defparam \macro_inst|gbdcam|counter0[7] .ShiftMux = 1'b0;
defparam \macro_inst|gbdcam|counter0[7] .BypassEn = 1'b1;
defparam \macro_inst|gbdcam|counter0[7] .CarryEnb = 1'b0;

alta_slice \macro_inst|gbdcam|counter0[8] (
	.A(vcc),
	.B(\macro_inst|gbdcam|counter0 [8]),
	.C(vcc),
	.D(vcc),
	.Cin(\macro_inst|gbdcam|counter0[7]~46 ),
	.Qin(\macro_inst|gbdcam|counter0 [8]),
	.Clk(\auto_generated_inst.hbo_22_f9ff3d300b43c0f2_bp__macro_inst|gbdcam|counter0[23]~32_combout_X60_Y3_SIG_SIG ),
	.AsyncReset(\sys_resetn~clkctrl_outclk__AsyncReset_X60_Y3_SIG ),
	.SyncReset(\macro_inst|gbdcam|main_state.S_WAIT0~q__SyncReset_X60_Y3_INV ),
	.ShiftData(),
	.SyncLoad(SyncLoad_X60_Y3_GND),
	.LutOut(\macro_inst|gbdcam|counter0[8]~47_combout ),
	.Cout(\macro_inst|gbdcam|counter0[8]~48 ),
	.Q(\macro_inst|gbdcam|counter0 [8]));
defparam \macro_inst|gbdcam|counter0[8] .coord_x = 16;
defparam \macro_inst|gbdcam|counter0[8] .coord_y = 2;
defparam \macro_inst|gbdcam|counter0[8] .coord_z = 12;
defparam \macro_inst|gbdcam|counter0[8] .mask = 16'hC30C;
defparam \macro_inst|gbdcam|counter0[8] .modeMux = 1'b1;
defparam \macro_inst|gbdcam|counter0[8] .FeedbackMux = 1'b0;
defparam \macro_inst|gbdcam|counter0[8] .ShiftMux = 1'b0;
defparam \macro_inst|gbdcam|counter0[8] .BypassEn = 1'b1;
defparam \macro_inst|gbdcam|counter0[8] .CarryEnb = 1'b0;

alta_slice \macro_inst|gbdcam|counter0[9] (
	.A(vcc),
	.B(\macro_inst|gbdcam|counter0 [9]),
	.C(vcc),
	.D(vcc),
	.Cin(\macro_inst|gbdcam|counter0[8]~48 ),
	.Qin(\macro_inst|gbdcam|counter0 [9]),
	.Clk(\auto_generated_inst.hbo_22_f9ff3d300b43c0f2_bp__macro_inst|gbdcam|counter0[23]~32_combout_X60_Y3_SIG_SIG ),
	.AsyncReset(\sys_resetn~clkctrl_outclk__AsyncReset_X60_Y3_SIG ),
	.SyncReset(\macro_inst|gbdcam|main_state.S_WAIT0~q__SyncReset_X60_Y3_INV ),
	.ShiftData(),
	.SyncLoad(SyncLoad_X60_Y3_GND),
	.LutOut(\macro_inst|gbdcam|counter0[9]~49_combout ),
	.Cout(\macro_inst|gbdcam|counter0[9]~50 ),
	.Q(\macro_inst|gbdcam|counter0 [9]));
defparam \macro_inst|gbdcam|counter0[9] .coord_x = 16;
defparam \macro_inst|gbdcam|counter0[9] .coord_y = 2;
defparam \macro_inst|gbdcam|counter0[9] .coord_z = 13;
defparam \macro_inst|gbdcam|counter0[9] .mask = 16'h3C3F;
defparam \macro_inst|gbdcam|counter0[9] .modeMux = 1'b1;
defparam \macro_inst|gbdcam|counter0[9] .FeedbackMux = 1'b0;
defparam \macro_inst|gbdcam|counter0[9] .ShiftMux = 1'b0;
defparam \macro_inst|gbdcam|counter0[9] .BypassEn = 1'b1;
defparam \macro_inst|gbdcam|counter0[9] .CarryEnb = 1'b0;

alta_slice \macro_inst|gbdcam|main_state.S_WAIT0 (
	.A(\macro_inst|gbdcam|counter0[23]~28_combout ),
	.B(\macro_inst|gbdcam|counter0[23]~29_combout ),
	.C(vcc),
	.D(\macro_inst|gbdcam|Equal0~4_combout ),
	.Cin(),
	.Qin(\macro_inst|gbdcam|main_state.S_WAIT0~q ),
	.Clk(\auto_generated_inst.hbo_22_f9ff3d300b43c0f2_bp_X59_Y3_SIG_VCC ),
	.AsyncReset(\sys_resetn~clkctrl_outclk__AsyncReset_X59_Y3_SIG ),
	.SyncReset(),
	.ShiftData(),
	.SyncLoad(),
	.LutOut(\macro_inst|gbdcam|main_state.S_WAIT0~0_combout ),
	.Cout(),
	.Q(\macro_inst|gbdcam|main_state.S_WAIT0~q ));
defparam \macro_inst|gbdcam|main_state.S_WAIT0 .coord_x = 15;
defparam \macro_inst|gbdcam|main_state.S_WAIT0 .coord_y = 2;
defparam \macro_inst|gbdcam|main_state.S_WAIT0 .coord_z = 13;
defparam \macro_inst|gbdcam|main_state.S_WAIT0 .mask = 16'h7CFC;
defparam \macro_inst|gbdcam|main_state.S_WAIT0 .modeMux = 1'b0;
defparam \macro_inst|gbdcam|main_state.S_WAIT0 .FeedbackMux = 1'b1;
defparam \macro_inst|gbdcam|main_state.S_WAIT0 .ShiftMux = 1'b0;
defparam \macro_inst|gbdcam|main_state.S_WAIT0 .BypassEn = 1'b0;
defparam \macro_inst|gbdcam|main_state.S_WAIT0 .CarryEnb = 1'b1;

alta_slice \macro_inst|gbdram|Ram_nCS~0 (
	.A(vcc),
	.B(vcc),
	.C(\macro_inst|gbdram|ram_bank_id [4]),
	.D(\macro_inst|gbdreg|is_accessing_reg~0_combout ),
	.Cin(),
	.Qin(),
	.Clk(),
	.AsyncReset(),
	.SyncReset(),
	.ShiftData(),
	.SyncLoad(),
	.LutOut(\macro_inst|gbdram|Ram_nCS~0_combout ),
	.Cout(),
	.Q());
defparam \macro_inst|gbdram|Ram_nCS~0 .coord_x = 8;
defparam \macro_inst|gbdram|Ram_nCS~0 .coord_y = 3;
defparam \macro_inst|gbdram|Ram_nCS~0 .coord_z = 6;
defparam \macro_inst|gbdram|Ram_nCS~0 .mask = 16'hF0FF;
defparam \macro_inst|gbdram|Ram_nCS~0 .modeMux = 1'b0;
defparam \macro_inst|gbdram|Ram_nCS~0 .FeedbackMux = 1'b0;
defparam \macro_inst|gbdram|Ram_nCS~0 .ShiftMux = 1'b0;
defparam \macro_inst|gbdram|Ram_nCS~0 .BypassEn = 1'b0;
defparam \macro_inst|gbdram|Ram_nCS~0 .CarryEnb = 1'b1;

alta_slice \macro_inst|gbdram|Ram_nWE~0 (
	.A(vcc),
	.B(\macro_inst|gbdram|ram_wren~q ),
	.C(vcc),
	.D(\cart_nWR~input_o ),
	.Cin(),
	.Qin(),
	.Clk(),
	.AsyncReset(),
	.SyncReset(),
	.ShiftData(),
	.SyncLoad(),
	.LutOut(\macro_inst|gbdram|Ram_nWE~0_combout ),
	.Cout(),
	.Q());
defparam \macro_inst|gbdram|Ram_nWE~0 .coord_x = 8;
defparam \macro_inst|gbdram|Ram_nWE~0 .coord_y = 3;
defparam \macro_inst|gbdram|Ram_nWE~0 .coord_z = 12;
defparam \macro_inst|gbdram|Ram_nWE~0 .mask = 16'hFF33;
defparam \macro_inst|gbdram|Ram_nWE~0 .modeMux = 1'b0;
defparam \macro_inst|gbdram|Ram_nWE~0 .FeedbackMux = 1'b0;
defparam \macro_inst|gbdram|Ram_nWE~0 .ShiftMux = 1'b0;
defparam \macro_inst|gbdram|Ram_nWE~0 .BypassEn = 1'b0;
defparam \macro_inst|gbdram|Ram_nWE~0 .CarryEnb = 1'b1;

alta_slice \macro_inst|gbdram|last_nWR[0] (
	.A(\macro_inst|gbdram|ram_bank_id [1]),
	.B(\macro_inst|gbdreg|is_accessing_reg~1_combout ),
	.C(\macro_inst|gbdram|last_nWR[0]~0_combout ),
	.D(\macro_inst|gbdreg|is_accessing_reg~0_combout ),
	.Cin(),
	.Qin(\macro_inst|gbdram|last_nWR [0]),
	.Clk(\auto_generated_inst.hbo_22_f9ff3d300b43c0f2_bp_X58_Y1_SIG_VCC ),
	.AsyncReset(\sys_resetn~clkctrl_outclk__AsyncReset_X58_Y1_SIG ),
	.SyncReset(SyncReset_X58_Y1_GND),
	.ShiftData(),
	.SyncLoad(SyncLoad_X58_Y1_VCC),
	.LutOut(\macro_inst|gbdreg|Reg_OutputValid~0_combout ),
	.Cout(),
	.Q(\macro_inst|gbdram|last_nWR [0]));
defparam \macro_inst|gbdram|last_nWR[0] .coord_x = 7;
defparam \macro_inst|gbdram|last_nWR[0] .coord_y = 3;
defparam \macro_inst|gbdram|last_nWR[0] .coord_z = 7;
defparam \macro_inst|gbdram|last_nWR[0] .mask = 16'h1100;
defparam \macro_inst|gbdram|last_nWR[0] .modeMux = 1'b0;
defparam \macro_inst|gbdram|last_nWR[0] .FeedbackMux = 1'b0;
defparam \macro_inst|gbdram|last_nWR[0] .ShiftMux = 1'b0;
defparam \macro_inst|gbdram|last_nWR[0] .BypassEn = 1'b1;
defparam \macro_inst|gbdram|last_nWR[0] .CarryEnb = 1'b1;

alta_slice \macro_inst|gbdram|last_nWR[0]~0 (
	.A(vcc),
	.B(vcc),
	.C(vcc),
	.D(\cart_nWR~input_o ),
	.Cin(),
	.Qin(),
	.Clk(),
	.AsyncReset(),
	.SyncReset(),
	.ShiftData(),
	.SyncLoad(),
	.LutOut(\macro_inst|gbdram|last_nWR[0]~0_combout ),
	.Cout(),
	.Q());
defparam \macro_inst|gbdram|last_nWR[0]~0 .coord_x = 8;
defparam \macro_inst|gbdram|last_nWR[0]~0 .coord_y = 3;
defparam \macro_inst|gbdram|last_nWR[0]~0 .coord_z = 8;
defparam \macro_inst|gbdram|last_nWR[0]~0 .mask = 16'h00FF;
defparam \macro_inst|gbdram|last_nWR[0]~0 .modeMux = 1'b0;
defparam \macro_inst|gbdram|last_nWR[0]~0 .FeedbackMux = 1'b0;
defparam \macro_inst|gbdram|last_nWR[0]~0 .ShiftMux = 1'b0;
defparam \macro_inst|gbdram|last_nWR[0]~0 .BypassEn = 1'b0;
defparam \macro_inst|gbdram|last_nWR[0]~0 .CarryEnb = 1'b1;

alta_slice \macro_inst|gbdram|last_nWR[1] (
	.A(\cart_a[15]~input_o ),
	.B(\cart_a[14]~input_o ),
	.C(\macro_inst|gbdram|last_nWR [0]),
	.D(\macro_inst|gbdram|last_nWR [0]),
	.Cin(),
	.Qin(\macro_inst|gbdram|last_nWR [1]),
	.Clk(\auto_generated_inst.hbo_22_f9ff3d300b43c0f2_bp_X58_Y1_SIG_VCC ),
	.AsyncReset(\sys_resetn~clkctrl_outclk__AsyncReset_X58_Y1_SIG ),
	.SyncReset(SyncReset_X58_Y1_GND),
	.ShiftData(),
	.SyncLoad(SyncLoad_X58_Y1_VCC),
	.LutOut(\macro_inst|gbdram|ram_bank_id[0]~0_combout ),
	.Cout(),
	.Q(\macro_inst|gbdram|last_nWR [1]));
defparam \macro_inst|gbdram|last_nWR[1] .coord_x = 7;
defparam \macro_inst|gbdram|last_nWR[1] .coord_y = 3;
defparam \macro_inst|gbdram|last_nWR[1] .coord_z = 15;
defparam \macro_inst|gbdram|last_nWR[1] .mask = 16'h0400;
defparam \macro_inst|gbdram|last_nWR[1] .modeMux = 1'b0;
defparam \macro_inst|gbdram|last_nWR[1] .FeedbackMux = 1'b1;
defparam \macro_inst|gbdram|last_nWR[1] .ShiftMux = 1'b0;
defparam \macro_inst|gbdram|last_nWR[1] .BypassEn = 1'b1;
defparam \macro_inst|gbdram|last_nWR[1] .CarryEnb = 1'b1;

alta_slice \macro_inst|gbdram|ram_bank_id[0] (
	.A(\macro_inst|gbdram|ram_bank_id [3]),
	.B(\macro_inst|gbdram|ram_bank_id [2]),
	.C(\cart_d[0]~input_o ),
	.D(\macro_inst|gbdram|ram_bank_id [4]),
	.Cin(),
	.Qin(\macro_inst|gbdram|ram_bank_id [0]),
	.Clk(\auto_generated_inst.hbo_22_f9ff3d300b43c0f2_bp__macro_inst|gbdram|ram_bank_id[0]~1_combout_X58_Y1_SIG_SIG ),
	.AsyncReset(\sys_resetn~clkctrl_outclk__AsyncReset_X58_Y1_SIG ),
	.SyncReset(SyncReset_X58_Y1_GND),
	.ShiftData(),
	.SyncLoad(SyncLoad_X58_Y1_VCC),
	.LutOut(\macro_inst|gbdreg|is_accessing_reg~1_combout ),
	.Cout(),
	.Q(\macro_inst|gbdram|ram_bank_id [0]));
defparam \macro_inst|gbdram|ram_bank_id[0] .coord_x = 7;
defparam \macro_inst|gbdram|ram_bank_id[0] .coord_y = 3;
defparam \macro_inst|gbdram|ram_bank_id[0] .coord_z = 6;
defparam \macro_inst|gbdram|ram_bank_id[0] .mask = 16'hFEFF;
defparam \macro_inst|gbdram|ram_bank_id[0] .modeMux = 1'b0;
defparam \macro_inst|gbdram|ram_bank_id[0] .FeedbackMux = 1'b1;
defparam \macro_inst|gbdram|ram_bank_id[0] .ShiftMux = 1'b0;
defparam \macro_inst|gbdram|ram_bank_id[0] .BypassEn = 1'b1;
defparam \macro_inst|gbdram|ram_bank_id[0] .CarryEnb = 1'b1;

alta_slice \macro_inst|gbdram|ram_bank_id[1] (
	.A(\cart_a[13]~input_o ),
	.B(vcc),
	.C(\cart_d[1]~input_o ),
	.D(\macro_inst|gbdram|ram_wren~1_combout ),
	.Cin(),
	.Qin(\macro_inst|gbdram|ram_bank_id [1]),
	.Clk(\auto_generated_inst.hbo_22_f9ff3d300b43c0f2_bp__macro_inst|gbdram|ram_bank_id[0]~1_combout_X58_Y1_SIG_SIG ),
	.AsyncReset(\sys_resetn~clkctrl_outclk__AsyncReset_X58_Y1_SIG ),
	.SyncReset(SyncReset_X58_Y1_GND),
	.ShiftData(),
	.SyncLoad(SyncLoad_X58_Y1_VCC),
	.LutOut(\macro_inst|gbdrom|bank_id[0]~0_combout ),
	.Cout(),
	.Q(\macro_inst|gbdram|ram_bank_id [1]));
defparam \macro_inst|gbdram|ram_bank_id[1] .coord_x = 7;
defparam \macro_inst|gbdram|ram_bank_id[1] .coord_y = 3;
defparam \macro_inst|gbdram|ram_bank_id[1] .coord_z = 8;
defparam \macro_inst|gbdram|ram_bank_id[1] .mask = 16'hAA00;
defparam \macro_inst|gbdram|ram_bank_id[1] .modeMux = 1'b0;
defparam \macro_inst|gbdram|ram_bank_id[1] .FeedbackMux = 1'b0;
defparam \macro_inst|gbdram|ram_bank_id[1] .ShiftMux = 1'b0;
defparam \macro_inst|gbdram|ram_bank_id[1] .BypassEn = 1'b1;
defparam \macro_inst|gbdram|ram_bank_id[1] .CarryEnb = 1'b1;

alta_slice \macro_inst|gbdram|ram_bank_id[2] (
	.A(\macro_inst|gbdreg|Reg_OutputValid~q ),
	.B(\macro_inst|gbdreg|last_nCS [1]),
	.C(\cart_d[2]~input_o ),
	.D(\macro_inst|gbdram|ram_bank_id [1]),
	.Cin(),
	.Qin(\macro_inst|gbdram|ram_bank_id [2]),
	.Clk(\auto_generated_inst.hbo_22_f9ff3d300b43c0f2_bp__macro_inst|gbdram|ram_bank_id[0]~1_combout_X58_Y1_SIG_SIG ),
	.AsyncReset(\sys_resetn~clkctrl_outclk__AsyncReset_X58_Y1_SIG ),
	.SyncReset(SyncReset_X58_Y1_GND),
	.ShiftData(),
	.SyncLoad(SyncLoad_X58_Y1_VCC),
	.LutOut(\macro_inst|gbdreg|Reg_OutputData[0]~2_combout ),
	.Cout(),
	.Q(\macro_inst|gbdram|ram_bank_id [2]));
defparam \macro_inst|gbdram|ram_bank_id[2] .coord_x = 7;
defparam \macro_inst|gbdram|ram_bank_id[2] .coord_y = 3;
defparam \macro_inst|gbdram|ram_bank_id[2] .coord_z = 9;
defparam \macro_inst|gbdram|ram_bank_id[2] .mask = 16'h7744;
defparam \macro_inst|gbdram|ram_bank_id[2] .modeMux = 1'b0;
defparam \macro_inst|gbdram|ram_bank_id[2] .FeedbackMux = 1'b0;
defparam \macro_inst|gbdram|ram_bank_id[2] .ShiftMux = 1'b0;
defparam \macro_inst|gbdram|ram_bank_id[2] .BypassEn = 1'b1;
defparam \macro_inst|gbdram|ram_bank_id[2] .CarryEnb = 1'b1;

alta_slice \macro_inst|gbdram|ram_bank_id[3] (
	.A(\macro_inst|gbdreg|Reg_OutputValid~q ),
	.B(\macro_inst|gbdreg|last_nCS [0]),
	.C(\cart_d[3]~input_o ),
	.D(\macro_inst|gbdreg|last_nCS [1]),
	.Cin(),
	.Qin(\macro_inst|gbdram|ram_bank_id [3]),
	.Clk(\auto_generated_inst.hbo_22_f9ff3d300b43c0f2_bp__macro_inst|gbdram|ram_bank_id[0]~1_combout_X58_Y1_SIG_SIG ),
	.AsyncReset(\sys_resetn~clkctrl_outclk__AsyncReset_X58_Y1_SIG ),
	.SyncReset(SyncReset_X58_Y1_GND),
	.ShiftData(),
	.SyncLoad(SyncLoad_X58_Y1_VCC),
	.LutOut(\macro_inst|gbdreg|Reg_OutputValid~1_combout ),
	.Cout(),
	.Q(\macro_inst|gbdram|ram_bank_id [3]));
defparam \macro_inst|gbdram|ram_bank_id[3] .coord_x = 7;
defparam \macro_inst|gbdram|ram_bank_id[3] .coord_y = 3;
defparam \macro_inst|gbdram|ram_bank_id[3] .coord_z = 12;
defparam \macro_inst|gbdram|ram_bank_id[3] .mask = 16'h2244;
defparam \macro_inst|gbdram|ram_bank_id[3] .modeMux = 1'b0;
defparam \macro_inst|gbdram|ram_bank_id[3] .FeedbackMux = 1'b0;
defparam \macro_inst|gbdram|ram_bank_id[3] .ShiftMux = 1'b0;
defparam \macro_inst|gbdram|ram_bank_id[3] .BypassEn = 1'b1;
defparam \macro_inst|gbdram|ram_bank_id[3] .CarryEnb = 1'b1;

alta_slice \macro_inst|gbdram|ram_bank_id[4] (
	.A(\cart_a[13]~input_o ),
	.B(\macro_inst|gbdram|ram_bank_id[0]~0_combout ),
	.C(\cart_d[4]~input_o ),
	.D(vcc),
	.Cin(),
	.Qin(\macro_inst|gbdram|ram_bank_id [4]),
	.Clk(\auto_generated_inst.hbo_22_f9ff3d300b43c0f2_bp__macro_inst|gbdram|ram_bank_id[0]~1_combout_X58_Y1_SIG_SIG ),
	.AsyncReset(\sys_resetn~clkctrl_outclk__AsyncReset_X58_Y1_SIG ),
	.SyncReset(SyncReset_X58_Y1_GND),
	.ShiftData(),
	.SyncLoad(SyncLoad_X58_Y1_VCC),
	.LutOut(\macro_inst|gbdram|ram_bank_id[0]~1_combout ),
	.Cout(),
	.Q(\macro_inst|gbdram|ram_bank_id [4]));
defparam \macro_inst|gbdram|ram_bank_id[4] .coord_x = 7;
defparam \macro_inst|gbdram|ram_bank_id[4] .coord_y = 3;
defparam \macro_inst|gbdram|ram_bank_id[4] .coord_z = 13;
defparam \macro_inst|gbdram|ram_bank_id[4] .mask = 16'h4444;
defparam \macro_inst|gbdram|ram_bank_id[4] .modeMux = 1'b0;
defparam \macro_inst|gbdram|ram_bank_id[4] .FeedbackMux = 1'b0;
defparam \macro_inst|gbdram|ram_bank_id[4] .ShiftMux = 1'b0;
defparam \macro_inst|gbdram|ram_bank_id[4] .BypassEn = 1'b1;
defparam \macro_inst|gbdram|ram_bank_id[4] .CarryEnb = 1'b1;

alta_slice \macro_inst|gbdram|ram_wren (
	.A(\cart_a[13]~input_o ),
	.B(\macro_inst|gbdram|ram_wren~1_combout ),
	.C(vcc),
	.D(\macro_inst|gbdram|ram_wren~0_combout ),
	.Cin(),
	.Qin(\macro_inst|gbdram|ram_wren~q ),
	.Clk(\auto_generated_inst.hbo_22_f9ff3d300b43c0f2_bp_X58_Y1_SIG_VCC ),
	.AsyncReset(\sys_resetn~clkctrl_outclk__AsyncReset_X58_Y1_SIG ),
	.SyncReset(),
	.ShiftData(),
	.SyncLoad(),
	.LutOut(\macro_inst|gbdram|ram_wren~2_combout ),
	.Cout(),
	.Q(\macro_inst|gbdram|ram_wren~q ));
defparam \macro_inst|gbdram|ram_wren .coord_x = 7;
defparam \macro_inst|gbdram|ram_wren .coord_y = 3;
defparam \macro_inst|gbdram|ram_wren .coord_z = 0;
defparam \macro_inst|gbdram|ram_wren .mask = 16'hF4B0;
defparam \macro_inst|gbdram|ram_wren .modeMux = 1'b0;
defparam \macro_inst|gbdram|ram_wren .FeedbackMux = 1'b1;
defparam \macro_inst|gbdram|ram_wren .ShiftMux = 1'b0;
defparam \macro_inst|gbdram|ram_wren .BypassEn = 1'b0;
defparam \macro_inst|gbdram|ram_wren .CarryEnb = 1'b1;

alta_slice \macro_inst|gbdram|ram_wren~0 (
	.A(\cart_d[3]~input_o ),
	.B(\cart_d[1]~input_o ),
	.C(\cart_d[2]~input_o ),
	.D(\cart_d[0]~input_o ),
	.Cin(),
	.Qin(),
	.Clk(),
	.AsyncReset(),
	.SyncReset(),
	.ShiftData(),
	.SyncLoad(),
	.LutOut(\macro_inst|gbdram|ram_wren~0_combout ),
	.Cout(),
	.Q());
defparam \macro_inst|gbdram|ram_wren~0 .coord_x = 6;
defparam \macro_inst|gbdram|ram_wren~0 .coord_y = 2;
defparam \macro_inst|gbdram|ram_wren~0 .coord_z = 13;
defparam \macro_inst|gbdram|ram_wren~0 .mask = 16'h0008;
defparam \macro_inst|gbdram|ram_wren~0 .modeMux = 1'b0;
defparam \macro_inst|gbdram|ram_wren~0 .FeedbackMux = 1'b0;
defparam \macro_inst|gbdram|ram_wren~0 .ShiftMux = 1'b0;
defparam \macro_inst|gbdram|ram_wren~0 .BypassEn = 1'b0;
defparam \macro_inst|gbdram|ram_wren~0 .CarryEnb = 1'b1;

alta_slice \macro_inst|gbdram|ram_wren~1 (
	.A(\macro_inst|gbdram|last_nWR [0]),
	.B(\cart_a[14]~input_o ),
	.C(\macro_inst|gbdram|last_nWR [1]),
	.D(\cart_a[15]~input_o ),
	.Cin(),
	.Qin(),
	.Clk(),
	.AsyncReset(),
	.SyncReset(),
	.ShiftData(),
	.SyncLoad(),
	.LutOut(\macro_inst|gbdram|ram_wren~1_combout ),
	.Cout(),
	.Q());
defparam \macro_inst|gbdram|ram_wren~1 .coord_x = 7;
defparam \macro_inst|gbdram|ram_wren~1 .coord_y = 3;
defparam \macro_inst|gbdram|ram_wren~1 .coord_z = 11;
defparam \macro_inst|gbdram|ram_wren~1 .mask = 16'h0002;
defparam \macro_inst|gbdram|ram_wren~1 .modeMux = 1'b0;
defparam \macro_inst|gbdram|ram_wren~1 .FeedbackMux = 1'b0;
defparam \macro_inst|gbdram|ram_wren~1 .ShiftMux = 1'b0;
defparam \macro_inst|gbdram|ram_wren~1 .BypassEn = 1'b0;
defparam \macro_inst|gbdram|ram_wren~1 .CarryEnb = 1'b1;

alta_slice \macro_inst|gbdreg|Bram_Req_Write (
	.A(\macro_inst|gbdreg|Decoder0~2_combout ),
	.B(\macro_inst|gbdreg|WideOr0~0_combout ),
	.C(\macro_inst|gbdreg|Bram_Req_Write~1_combout ),
	.D(\macro_inst|gbdreg|Bram_Req_Write~2_combout ),
	.Cin(),
	.Qin(\macro_inst|gbdreg|Bram_Req_Write~q ),
	.Clk(\auto_generated_inst.hbo_22_f9ff3d300b43c0f2_bp_X58_Y1_SIG_VCC ),
	.AsyncReset(\sys_resetn~clkctrl_outclk__AsyncReset_X58_Y1_SIG ),
	.SyncReset(),
	.ShiftData(),
	.SyncLoad(),
	.LutOut(\macro_inst|gbdreg|Bram_Req_Write~3_combout ),
	.Cout(),
	.Q(\macro_inst|gbdreg|Bram_Req_Write~q ));
defparam \macro_inst|gbdreg|Bram_Req_Write .coord_x = 7;
defparam \macro_inst|gbdreg|Bram_Req_Write .coord_y = 3;
defparam \macro_inst|gbdreg|Bram_Req_Write .coord_z = 14;
defparam \macro_inst|gbdreg|Bram_Req_Write .mask = 16'hFFD0;
defparam \macro_inst|gbdreg|Bram_Req_Write .modeMux = 1'b0;
defparam \macro_inst|gbdreg|Bram_Req_Write .FeedbackMux = 1'b0;
defparam \macro_inst|gbdreg|Bram_Req_Write .ShiftMux = 1'b0;
defparam \macro_inst|gbdreg|Bram_Req_Write .BypassEn = 1'b0;
defparam \macro_inst|gbdreg|Bram_Req_Write .CarryEnb = 1'b1;

alta_slice \macro_inst|gbdreg|Bram_Req_Write~1 (
	.A(\macro_inst|gbdram|ram_bank_id [1]),
	.B(\macro_inst|gbdreg|is_accessing_reg~0_combout ),
	.C(\macro_inst|gbdreg|is_accessing_reg~1_combout ),
	.D(\macro_inst|gbdreg|Bram_Req_Write~0_combout ),
	.Cin(),
	.Qin(),
	.Clk(),
	.AsyncReset(),
	.SyncReset(),
	.ShiftData(),
	.SyncLoad(),
	.LutOut(\macro_inst|gbdreg|Bram_Req_Write~1_combout ),
	.Cout(),
	.Q());
defparam \macro_inst|gbdreg|Bram_Req_Write~1 .coord_x = 7;
defparam \macro_inst|gbdreg|Bram_Req_Write~1 .coord_y = 3;
defparam \macro_inst|gbdreg|Bram_Req_Write~1 .coord_z = 10;
defparam \macro_inst|gbdreg|Bram_Req_Write~1 .mask = 16'h0400;
defparam \macro_inst|gbdreg|Bram_Req_Write~1 .modeMux = 1'b0;
defparam \macro_inst|gbdreg|Bram_Req_Write~1 .FeedbackMux = 1'b0;
defparam \macro_inst|gbdreg|Bram_Req_Write~1 .ShiftMux = 1'b0;
defparam \macro_inst|gbdreg|Bram_Req_Write~1 .BypassEn = 1'b0;
defparam \macro_inst|gbdreg|Bram_Req_Write~1 .CarryEnb = 1'b1;

alta_slice \macro_inst|gbdreg|Bram_Req_Write~2 (
	.A(\macro_inst|gbdreg|bram_signal_reset_cnt [0]),
	.B(\macro_inst|gbdreg|bram_signal_reset_cnt [2]),
	.C(\macro_inst|gbdreg|Bram_Req_Write~q ),
	.D(\macro_inst|gbdreg|bram_signal_reset_cnt [1]),
	.Cin(),
	.Qin(),
	.Clk(),
	.AsyncReset(),
	.SyncReset(),
	.ShiftData(),
	.SyncLoad(),
	.LutOut(\macro_inst|gbdreg|Bram_Req_Write~2_combout ),
	.Cout(),
	.Q());
defparam \macro_inst|gbdreg|Bram_Req_Write~2 .coord_x = 6;
defparam \macro_inst|gbdreg|Bram_Req_Write~2 .coord_y = 3;
defparam \macro_inst|gbdreg|Bram_Req_Write~2 .coord_z = 3;
defparam \macro_inst|gbdreg|Bram_Req_Write~2 .mask = 16'h70F0;
defparam \macro_inst|gbdreg|Bram_Req_Write~2 .modeMux = 1'b0;
defparam \macro_inst|gbdreg|Bram_Req_Write~2 .FeedbackMux = 1'b0;
defparam \macro_inst|gbdreg|Bram_Req_Write~2 .ShiftMux = 1'b0;
defparam \macro_inst|gbdreg|Bram_Req_Write~2 .BypassEn = 1'b0;
defparam \macro_inst|gbdreg|Bram_Req_Write~2 .CarryEnb = 1'b1;

alta_slice \macro_inst|gbdreg|Cam_Capture (
	.A(vcc),
	.B(\cart_d[0]~input_o ),
	.C(\macro_inst|gbdreg|last_CamCaptureFinish [1]),
	.D(\macro_inst|gbdreg|last_CamCaptureFinish [0]),
	.Cin(),
	.Qin(\macro_inst|gbdreg|Cam_Capture~q ),
	.Clk(\auto_generated_inst.hbo_22_f9ff3d300b43c0f2_bp__macro_inst|gbdreg|Cam_Capture~0_combout_X60_Y1_SIG_SIG ),
	.AsyncReset(\sys_resetn~clkctrl_outclk__AsyncReset_X60_Y1_SIG ),
	.SyncReset(),
	.ShiftData(),
	.SyncLoad(),
	.LutOut(\macro_inst|gbdreg|Reg_A000~0_combout ),
	.Cout(),
	.Q(\macro_inst|gbdreg|Cam_Capture~q ));
defparam \macro_inst|gbdreg|Cam_Capture .coord_x = 7;
defparam \macro_inst|gbdreg|Cam_Capture .coord_y = 2;
defparam \macro_inst|gbdreg|Cam_Capture .coord_z = 3;
defparam \macro_inst|gbdreg|Cam_Capture .mask = 16'hC0CC;
defparam \macro_inst|gbdreg|Cam_Capture .modeMux = 1'b0;
defparam \macro_inst|gbdreg|Cam_Capture .FeedbackMux = 1'b0;
defparam \macro_inst|gbdreg|Cam_Capture .ShiftMux = 1'b0;
defparam \macro_inst|gbdreg|Cam_Capture .BypassEn = 1'b0;
defparam \macro_inst|gbdreg|Cam_Capture .CarryEnb = 1'b1;

alta_slice \macro_inst|gbdreg|Cam_Capture~0 (
	.A(\macro_inst|gbdreg|last_CamCaptureFinish [0]),
	.B(\macro_inst|gbdreg|Decoder0~1_combout ),
	.C(\macro_inst|gbdreg|last_CamCaptureFinish [1]),
	.D(\macro_inst|gbdreg|Bram_Req_Write~1_combout ),
	.Cin(),
	.Qin(),
	.Clk(),
	.AsyncReset(),
	.SyncReset(),
	.ShiftData(),
	.SyncLoad(),
	.LutOut(\macro_inst|gbdreg|Cam_Capture~0_combout ),
	.Cout(),
	.Q());
defparam \macro_inst|gbdreg|Cam_Capture~0 .coord_x = 7;
defparam \macro_inst|gbdreg|Cam_Capture~0 .coord_y = 2;
defparam \macro_inst|gbdreg|Cam_Capture~0 .coord_z = 6;
defparam \macro_inst|gbdreg|Cam_Capture~0 .mask = 16'hCE0A;
defparam \macro_inst|gbdreg|Cam_Capture~0 .modeMux = 1'b0;
defparam \macro_inst|gbdreg|Cam_Capture~0 .FeedbackMux = 1'b0;
defparam \macro_inst|gbdreg|Cam_Capture~0 .ShiftMux = 1'b0;
defparam \macro_inst|gbdreg|Cam_Capture~0 .BypassEn = 1'b0;
defparam \macro_inst|gbdreg|Cam_Capture~0 .CarryEnb = 1'b1;

alta_slice \macro_inst|gbdreg|Decoder0~0 (
	.A(\cart_a[3]~input_o ),
	.B(\cart_a[6]~input_o ),
	.C(\cart_a[4]~input_o ),
	.D(\cart_a[5]~input_o ),
	.Cin(),
	.Qin(),
	.Clk(),
	.AsyncReset(),
	.SyncReset(),
	.ShiftData(),
	.SyncLoad(),
	.LutOut(\macro_inst|gbdreg|Decoder0~0_combout ),
	.Cout(),
	.Q());
defparam \macro_inst|gbdreg|Decoder0~0 .coord_x = 7;
defparam \macro_inst|gbdreg|Decoder0~0 .coord_y = 2;
defparam \macro_inst|gbdreg|Decoder0~0 .coord_z = 12;
defparam \macro_inst|gbdreg|Decoder0~0 .mask = 16'h0001;
defparam \macro_inst|gbdreg|Decoder0~0 .modeMux = 1'b0;
defparam \macro_inst|gbdreg|Decoder0~0 .FeedbackMux = 1'b0;
defparam \macro_inst|gbdreg|Decoder0~0 .ShiftMux = 1'b0;
defparam \macro_inst|gbdreg|Decoder0~0 .BypassEn = 1'b0;
defparam \macro_inst|gbdreg|Decoder0~0 .CarryEnb = 1'b1;

alta_slice \macro_inst|gbdreg|Decoder0~1 (
	.A(\cart_a[0]~input_o ),
	.B(\macro_inst|gbdreg|Decoder0~0_combout ),
	.C(\cart_a[1]~input_o ),
	.D(\cart_a[2]~input_o ),
	.Cin(),
	.Qin(),
	.Clk(),
	.AsyncReset(),
	.SyncReset(),
	.ShiftData(),
	.SyncLoad(),
	.LutOut(\macro_inst|gbdreg|Decoder0~1_combout ),
	.Cout(),
	.Q());
defparam \macro_inst|gbdreg|Decoder0~1 .coord_x = 7;
defparam \macro_inst|gbdreg|Decoder0~1 .coord_y = 2;
defparam \macro_inst|gbdreg|Decoder0~1 .coord_z = 13;
defparam \macro_inst|gbdreg|Decoder0~1 .mask = 16'h0004;
defparam \macro_inst|gbdreg|Decoder0~1 .modeMux = 1'b0;
defparam \macro_inst|gbdreg|Decoder0~1 .FeedbackMux = 1'b0;
defparam \macro_inst|gbdreg|Decoder0~1 .ShiftMux = 1'b0;
defparam \macro_inst|gbdreg|Decoder0~1 .BypassEn = 1'b0;
defparam \macro_inst|gbdreg|Decoder0~1 .CarryEnb = 1'b1;

alta_slice \macro_inst|gbdreg|Decoder0~2 (
	.A(vcc),
	.B(vcc),
	.C(\cart_a[6]~input_o ),
	.D(\cart_a[5]~input_o ),
	.Cin(),
	.Qin(),
	.Clk(),
	.AsyncReset(),
	.SyncReset(),
	.ShiftData(),
	.SyncLoad(),
	.LutOut(\macro_inst|gbdreg|Decoder0~2_combout ),
	.Cout(),
	.Q());
defparam \macro_inst|gbdreg|Decoder0~2 .coord_x = 7;
defparam \macro_inst|gbdreg|Decoder0~2 .coord_y = 2;
defparam \macro_inst|gbdreg|Decoder0~2 .coord_z = 5;
defparam \macro_inst|gbdreg|Decoder0~2 .mask = 16'h000F;
defparam \macro_inst|gbdreg|Decoder0~2 .modeMux = 1'b0;
defparam \macro_inst|gbdreg|Decoder0~2 .FeedbackMux = 1'b0;
defparam \macro_inst|gbdreg|Decoder0~2 .ShiftMux = 1'b0;
defparam \macro_inst|gbdreg|Decoder0~2 .BypassEn = 1'b0;
defparam \macro_inst|gbdreg|Decoder0~2 .CarryEnb = 1'b1;

alta_slice \macro_inst|gbdreg|Reg_A000[1] (
	.A(vcc),
	.B(\cart_d[1]~input_o ),
	.C(\macro_inst|gbdreg|last_CamCaptureFinish [1]),
	.D(\macro_inst|gbdreg|last_CamCaptureFinish [0]),
	.Cin(),
	.Qin(\macro_inst|gbdreg|Reg_A000 [1]),
	.Clk(\auto_generated_inst.hbo_22_f9ff3d300b43c0f2_bp__macro_inst|gbdreg|Cam_Capture~0_combout_X60_Y1_SIG_SIG ),
	.AsyncReset(\sys_resetn~clkctrl_outclk__AsyncReset_X60_Y1_SIG ),
	.SyncReset(),
	.ShiftData(),
	.SyncLoad(),
	.LutOut(\macro_inst|gbdreg|Reg_A000~1_combout ),
	.Cout(),
	.Q(\macro_inst|gbdreg|Reg_A000 [1]));
defparam \macro_inst|gbdreg|Reg_A000[1] .coord_x = 7;
defparam \macro_inst|gbdreg|Reg_A000[1] .coord_y = 2;
defparam \macro_inst|gbdreg|Reg_A000[1] .coord_z = 8;
defparam \macro_inst|gbdreg|Reg_A000[1] .mask = 16'hC0CC;
defparam \macro_inst|gbdreg|Reg_A000[1] .modeMux = 1'b0;
defparam \macro_inst|gbdreg|Reg_A000[1] .FeedbackMux = 1'b0;
defparam \macro_inst|gbdreg|Reg_A000[1] .ShiftMux = 1'b0;
defparam \macro_inst|gbdreg|Reg_A000[1] .BypassEn = 1'b0;
defparam \macro_inst|gbdreg|Reg_A000[1] .CarryEnb = 1'b1;

alta_slice \macro_inst|gbdreg|Reg_A000[2] (
	.A(vcc),
	.B(\cart_d[2]~input_o ),
	.C(\macro_inst|gbdreg|last_CamCaptureFinish [1]),
	.D(\macro_inst|gbdreg|last_CamCaptureFinish [0]),
	.Cin(),
	.Qin(\macro_inst|gbdreg|Reg_A000 [2]),
	.Clk(\auto_generated_inst.hbo_22_f9ff3d300b43c0f2_bp__macro_inst|gbdreg|Cam_Capture~0_combout_X60_Y1_SIG_SIG ),
	.AsyncReset(\sys_resetn~clkctrl_outclk__AsyncReset_X60_Y1_SIG ),
	.SyncReset(),
	.ShiftData(),
	.SyncLoad(),
	.LutOut(\macro_inst|gbdreg|Reg_A000~2_combout ),
	.Cout(),
	.Q(\macro_inst|gbdreg|Reg_A000 [2]));
defparam \macro_inst|gbdreg|Reg_A000[2] .coord_x = 7;
defparam \macro_inst|gbdreg|Reg_A000[2] .coord_y = 2;
defparam \macro_inst|gbdreg|Reg_A000[2] .coord_z = 11;
defparam \macro_inst|gbdreg|Reg_A000[2] .mask = 16'hC0CC;
defparam \macro_inst|gbdreg|Reg_A000[2] .modeMux = 1'b0;
defparam \macro_inst|gbdreg|Reg_A000[2] .FeedbackMux = 1'b0;
defparam \macro_inst|gbdreg|Reg_A000[2] .ShiftMux = 1'b0;
defparam \macro_inst|gbdreg|Reg_A000[2] .BypassEn = 1'b0;
defparam \macro_inst|gbdreg|Reg_A000[2] .CarryEnb = 1'b1;

alta_slice \macro_inst|gbdreg|Reg_A000[3] (
	.A(vcc),
	.B(\cart_d[3]~input_o ),
	.C(\macro_inst|gbdreg|last_CamCaptureFinish [1]),
	.D(\macro_inst|gbdreg|last_CamCaptureFinish [0]),
	.Cin(),
	.Qin(\macro_inst|gbdreg|Reg_A000 [3]),
	.Clk(\auto_generated_inst.hbo_22_f9ff3d300b43c0f2_bp__macro_inst|gbdreg|Cam_Capture~0_combout_X60_Y1_SIG_SIG ),
	.AsyncReset(\sys_resetn~clkctrl_outclk__AsyncReset_X60_Y1_SIG ),
	.SyncReset(),
	.ShiftData(),
	.SyncLoad(),
	.LutOut(\macro_inst|gbdreg|Reg_A000~3_combout ),
	.Cout(),
	.Q(\macro_inst|gbdreg|Reg_A000 [3]));
defparam \macro_inst|gbdreg|Reg_A000[3] .coord_x = 7;
defparam \macro_inst|gbdreg|Reg_A000[3] .coord_y = 2;
defparam \macro_inst|gbdreg|Reg_A000[3] .coord_z = 9;
defparam \macro_inst|gbdreg|Reg_A000[3] .mask = 16'hC0CC;
defparam \macro_inst|gbdreg|Reg_A000[3] .modeMux = 1'b0;
defparam \macro_inst|gbdreg|Reg_A000[3] .FeedbackMux = 1'b0;
defparam \macro_inst|gbdreg|Reg_A000[3] .ShiftMux = 1'b0;
defparam \macro_inst|gbdreg|Reg_A000[3] .BypassEn = 1'b0;
defparam \macro_inst|gbdreg|Reg_A000[3] .CarryEnb = 1'b1;

alta_slice \macro_inst|gbdreg|Reg_A000[4] (
	.A(vcc),
	.B(\cart_d[4]~input_o ),
	.C(\macro_inst|gbdreg|last_CamCaptureFinish [1]),
	.D(\macro_inst|gbdreg|last_CamCaptureFinish [0]),
	.Cin(),
	.Qin(\macro_inst|gbdreg|Reg_A000 [4]),
	.Clk(\auto_generated_inst.hbo_22_f9ff3d300b43c0f2_bp__macro_inst|gbdreg|Cam_Capture~0_combout_X60_Y1_SIG_SIG ),
	.AsyncReset(\sys_resetn~clkctrl_outclk__AsyncReset_X60_Y1_SIG ),
	.SyncReset(),
	.ShiftData(),
	.SyncLoad(),
	.LutOut(\macro_inst|gbdreg|Reg_A000~4_combout ),
	.Cout(),
	.Q(\macro_inst|gbdreg|Reg_A000 [4]));
defparam \macro_inst|gbdreg|Reg_A000[4] .coord_x = 7;
defparam \macro_inst|gbdreg|Reg_A000[4] .coord_y = 2;
defparam \macro_inst|gbdreg|Reg_A000[4] .coord_z = 2;
defparam \macro_inst|gbdreg|Reg_A000[4] .mask = 16'hC0CC;
defparam \macro_inst|gbdreg|Reg_A000[4] .modeMux = 1'b0;
defparam \macro_inst|gbdreg|Reg_A000[4] .FeedbackMux = 1'b0;
defparam \macro_inst|gbdreg|Reg_A000[4] .ShiftMux = 1'b0;
defparam \macro_inst|gbdreg|Reg_A000[4] .BypassEn = 1'b0;
defparam \macro_inst|gbdreg|Reg_A000[4] .CarryEnb = 1'b1;

alta_slice \macro_inst|gbdreg|Reg_A000[5] (
	.A(vcc),
	.B(\cart_d[5]~input_o ),
	.C(\macro_inst|gbdreg|last_CamCaptureFinish [1]),
	.D(\macro_inst|gbdreg|last_CamCaptureFinish [0]),
	.Cin(),
	.Qin(\macro_inst|gbdreg|Reg_A000 [5]),
	.Clk(\auto_generated_inst.hbo_22_f9ff3d300b43c0f2_bp__macro_inst|gbdreg|Cam_Capture~0_combout_X60_Y1_SIG_SIG ),
	.AsyncReset(\sys_resetn~clkctrl_outclk__AsyncReset_X60_Y1_SIG ),
	.SyncReset(),
	.ShiftData(),
	.SyncLoad(),
	.LutOut(\macro_inst|gbdreg|Reg_A000~5_combout ),
	.Cout(),
	.Q(\macro_inst|gbdreg|Reg_A000 [5]));
defparam \macro_inst|gbdreg|Reg_A000[5] .coord_x = 7;
defparam \macro_inst|gbdreg|Reg_A000[5] .coord_y = 2;
defparam \macro_inst|gbdreg|Reg_A000[5] .coord_z = 4;
defparam \macro_inst|gbdreg|Reg_A000[5] .mask = 16'hC0CC;
defparam \macro_inst|gbdreg|Reg_A000[5] .modeMux = 1'b0;
defparam \macro_inst|gbdreg|Reg_A000[5] .FeedbackMux = 1'b0;
defparam \macro_inst|gbdreg|Reg_A000[5] .ShiftMux = 1'b0;
defparam \macro_inst|gbdreg|Reg_A000[5] .BypassEn = 1'b0;
defparam \macro_inst|gbdreg|Reg_A000[5] .CarryEnb = 1'b1;

alta_slice \macro_inst|gbdreg|Reg_A000[6] (
	.A(vcc),
	.B(\cart_d[6]~input_o ),
	.C(\macro_inst|gbdreg|last_CamCaptureFinish [1]),
	.D(\macro_inst|gbdreg|last_CamCaptureFinish [0]),
	.Cin(),
	.Qin(\macro_inst|gbdreg|Reg_A000 [6]),
	.Clk(\auto_generated_inst.hbo_22_f9ff3d300b43c0f2_bp__macro_inst|gbdreg|Cam_Capture~0_combout_X60_Y1_SIG_SIG ),
	.AsyncReset(\sys_resetn~clkctrl_outclk__AsyncReset_X60_Y1_SIG ),
	.SyncReset(),
	.ShiftData(),
	.SyncLoad(),
	.LutOut(\macro_inst|gbdreg|Reg_A000~6_combout ),
	.Cout(),
	.Q(\macro_inst|gbdreg|Reg_A000 [6]));
defparam \macro_inst|gbdreg|Reg_A000[6] .coord_x = 7;
defparam \macro_inst|gbdreg|Reg_A000[6] .coord_y = 2;
defparam \macro_inst|gbdreg|Reg_A000[6] .coord_z = 14;
defparam \macro_inst|gbdreg|Reg_A000[6] .mask = 16'hC0CC;
defparam \macro_inst|gbdreg|Reg_A000[6] .modeMux = 1'b0;
defparam \macro_inst|gbdreg|Reg_A000[6] .FeedbackMux = 1'b0;
defparam \macro_inst|gbdreg|Reg_A000[6] .ShiftMux = 1'b0;
defparam \macro_inst|gbdreg|Reg_A000[6] .BypassEn = 1'b0;
defparam \macro_inst|gbdreg|Reg_A000[6] .CarryEnb = 1'b1;

alta_slice \macro_inst|gbdreg|Reg_A000[7] (
	.A(vcc),
	.B(\cart_d[7]~input_o ),
	.C(\macro_inst|gbdreg|last_CamCaptureFinish [1]),
	.D(\macro_inst|gbdreg|last_CamCaptureFinish [0]),
	.Cin(),
	.Qin(\macro_inst|gbdreg|Reg_A000 [7]),
	.Clk(\auto_generated_inst.hbo_22_f9ff3d300b43c0f2_bp__macro_inst|gbdreg|Cam_Capture~0_combout_X60_Y1_SIG_SIG ),
	.AsyncReset(\sys_resetn~clkctrl_outclk__AsyncReset_X60_Y1_SIG ),
	.SyncReset(),
	.ShiftData(),
	.SyncLoad(),
	.LutOut(\macro_inst|gbdreg|Reg_A000~7_combout ),
	.Cout(),
	.Q(\macro_inst|gbdreg|Reg_A000 [7]));
defparam \macro_inst|gbdreg|Reg_A000[7] .coord_x = 7;
defparam \macro_inst|gbdreg|Reg_A000[7] .coord_y = 2;
defparam \macro_inst|gbdreg|Reg_A000[7] .coord_z = 10;
defparam \macro_inst|gbdreg|Reg_A000[7] .mask = 16'hC0CC;
defparam \macro_inst|gbdreg|Reg_A000[7] .modeMux = 1'b0;
defparam \macro_inst|gbdreg|Reg_A000[7] .FeedbackMux = 1'b0;
defparam \macro_inst|gbdreg|Reg_A000[7] .ShiftMux = 1'b0;
defparam \macro_inst|gbdreg|Reg_A000[7] .BypassEn = 1'b0;
defparam \macro_inst|gbdreg|Reg_A000[7] .CarryEnb = 1'b1;

alta_slice \macro_inst|gbdreg|Reg_OutputData[0] (
	.A(\macro_inst|gbdreg|last_nCS [0]),
	.B(\macro_inst|gbdreg|Decoder0~1_combout ),
	.C(\macro_inst|gbdreg|last_nCS [1]),
	.D(\macro_inst|gbdreg|Cam_Capture~q ),
	.Cin(),
	.Qin(\macro_inst|gbdreg|Reg_OutputData [0]),
	.Clk(\auto_generated_inst.hbo_22_f9ff3d300b43c0f2_bp__macro_inst|gbdreg|Reg_OutputData[0]~3_combout_X59_Y1_SIG_SIG ),
	.AsyncReset(\sys_resetn~clkctrl_outclk__AsyncReset_X59_Y1_SIG ),
	.SyncReset(),
	.ShiftData(),
	.SyncLoad(),
	.LutOut(\macro_inst|gbdreg|Reg_OutputData~0_combout ),
	.Cout(),
	.Q(\macro_inst|gbdreg|Reg_OutputData [0]));
defparam \macro_inst|gbdreg|Reg_OutputData[0] .coord_x = 6;
defparam \macro_inst|gbdreg|Reg_OutputData[0] .coord_y = 2;
defparam \macro_inst|gbdreg|Reg_OutputData[0] .coord_z = 15;
defparam \macro_inst|gbdreg|Reg_OutputData[0] .mask = 16'h0800;
defparam \macro_inst|gbdreg|Reg_OutputData[0] .modeMux = 1'b0;
defparam \macro_inst|gbdreg|Reg_OutputData[0] .FeedbackMux = 1'b0;
defparam \macro_inst|gbdreg|Reg_OutputData[0] .ShiftMux = 1'b0;
defparam \macro_inst|gbdreg|Reg_OutputData[0] .BypassEn = 1'b0;
defparam \macro_inst|gbdreg|Reg_OutputData[0] .CarryEnb = 1'b1;

alta_slice \macro_inst|gbdreg|Reg_OutputData[0]~1 (
	.A(\macro_inst|gbdreg|last_nCS [1]),
	.B(\macro_inst|gbdreg|is_accessing_reg~0_combout ),
	.C(\cart_nRD~input_o ),
	.D(\macro_inst|gbdreg|last_nCS [0]),
	.Cin(),
	.Qin(),
	.Clk(),
	.AsyncReset(),
	.SyncReset(),
	.ShiftData(),
	.SyncLoad(),
	.LutOut(\macro_inst|gbdreg|Reg_OutputData[0]~1_combout ),
	.Cout(),
	.Q());
defparam \macro_inst|gbdreg|Reg_OutputData[0]~1 .coord_x = 7;
defparam \macro_inst|gbdreg|Reg_OutputData[0]~1 .coord_y = 3;
defparam \macro_inst|gbdreg|Reg_OutputData[0]~1 .coord_z = 4;
defparam \macro_inst|gbdreg|Reg_OutputData[0]~1 .mask = 16'hFBF5;
defparam \macro_inst|gbdreg|Reg_OutputData[0]~1 .modeMux = 1'b0;
defparam \macro_inst|gbdreg|Reg_OutputData[0]~1 .FeedbackMux = 1'b0;
defparam \macro_inst|gbdreg|Reg_OutputData[0]~1 .ShiftMux = 1'b0;
defparam \macro_inst|gbdreg|Reg_OutputData[0]~1 .BypassEn = 1'b0;
defparam \macro_inst|gbdreg|Reg_OutputData[0]~1 .CarryEnb = 1'b1;

alta_slice \macro_inst|gbdreg|Reg_OutputData[0]~3 (
	.A(\macro_inst|gbdreg|is_accessing_reg~1_combout ),
	.B(\macro_inst|gbdreg|last_nCS [1]),
	.C(\macro_inst|gbdreg|Reg_OutputData[0]~2_combout ),
	.D(\macro_inst|gbdreg|Reg_OutputData[0]~1_combout ),
	.Cin(),
	.Qin(),
	.Clk(),
	.AsyncReset(),
	.SyncReset(),
	.ShiftData(),
	.SyncLoad(),
	.LutOut(\macro_inst|gbdreg|Reg_OutputData[0]~3_combout ),
	.Cout(),
	.Q());
defparam \macro_inst|gbdreg|Reg_OutputData[0]~3 .coord_x = 6;
defparam \macro_inst|gbdreg|Reg_OutputData[0]~3 .coord_y = 2;
defparam \macro_inst|gbdreg|Reg_OutputData[0]~3 .coord_z = 0;
defparam \macro_inst|gbdreg|Reg_OutputData[0]~3 .mask = 16'h000D;
defparam \macro_inst|gbdreg|Reg_OutputData[0]~3 .modeMux = 1'b0;
defparam \macro_inst|gbdreg|Reg_OutputData[0]~3 .FeedbackMux = 1'b0;
defparam \macro_inst|gbdreg|Reg_OutputData[0]~3 .ShiftMux = 1'b0;
defparam \macro_inst|gbdreg|Reg_OutputData[0]~3 .BypassEn = 1'b0;
defparam \macro_inst|gbdreg|Reg_OutputData[0]~3 .CarryEnb = 1'b1;

alta_slice \macro_inst|gbdreg|Reg_OutputData[1] (
	.A(\macro_inst|gbdreg|Decoder0~1_combout ),
	.B(\macro_inst|gbdreg|Reg_A000 [1]),
	.C(\macro_inst|gbdreg|last_nCS [0]),
	.D(\macro_inst|gbdreg|last_nCS [1]),
	.Cin(),
	.Qin(\macro_inst|gbdreg|Reg_OutputData [1]),
	.Clk(\auto_generated_inst.hbo_22_f9ff3d300b43c0f2_bp__macro_inst|gbdreg|Reg_OutputData[0]~3_combout_X59_Y1_SIG_SIG ),
	.AsyncReset(\sys_resetn~clkctrl_outclk__AsyncReset_X59_Y1_SIG ),
	.SyncReset(),
	.ShiftData(),
	.SyncLoad(),
	.LutOut(\macro_inst|gbdreg|Reg_OutputData~4_combout ),
	.Cout(),
	.Q(\macro_inst|gbdreg|Reg_OutputData [1]));
defparam \macro_inst|gbdreg|Reg_OutputData[1] .coord_x = 6;
defparam \macro_inst|gbdreg|Reg_OutputData[1] .coord_y = 2;
defparam \macro_inst|gbdreg|Reg_OutputData[1] .coord_z = 12;
defparam \macro_inst|gbdreg|Reg_OutputData[1] .mask = 16'h0080;
defparam \macro_inst|gbdreg|Reg_OutputData[1] .modeMux = 1'b0;
defparam \macro_inst|gbdreg|Reg_OutputData[1] .FeedbackMux = 1'b0;
defparam \macro_inst|gbdreg|Reg_OutputData[1] .ShiftMux = 1'b0;
defparam \macro_inst|gbdreg|Reg_OutputData[1] .BypassEn = 1'b0;
defparam \macro_inst|gbdreg|Reg_OutputData[1] .CarryEnb = 1'b1;

alta_slice \macro_inst|gbdreg|Reg_OutputData[2] (
	.A(\macro_inst|gbdreg|Reg_A000 [2]),
	.B(\macro_inst|gbdreg|Decoder0~1_combout ),
	.C(\macro_inst|gbdreg|last_nCS [0]),
	.D(\macro_inst|gbdreg|last_nCS [1]),
	.Cin(),
	.Qin(\macro_inst|gbdreg|Reg_OutputData [2]),
	.Clk(\auto_generated_inst.hbo_22_f9ff3d300b43c0f2_bp__macro_inst|gbdreg|Reg_OutputData[0]~3_combout_X59_Y1_SIG_SIG ),
	.AsyncReset(\sys_resetn~clkctrl_outclk__AsyncReset_X59_Y1_SIG ),
	.SyncReset(),
	.ShiftData(),
	.SyncLoad(),
	.LutOut(\macro_inst|gbdreg|Reg_OutputData~5_combout ),
	.Cout(),
	.Q(\macro_inst|gbdreg|Reg_OutputData [2]));
defparam \macro_inst|gbdreg|Reg_OutputData[2] .coord_x = 6;
defparam \macro_inst|gbdreg|Reg_OutputData[2] .coord_y = 2;
defparam \macro_inst|gbdreg|Reg_OutputData[2] .coord_z = 11;
defparam \macro_inst|gbdreg|Reg_OutputData[2] .mask = 16'h0080;
defparam \macro_inst|gbdreg|Reg_OutputData[2] .modeMux = 1'b0;
defparam \macro_inst|gbdreg|Reg_OutputData[2] .FeedbackMux = 1'b0;
defparam \macro_inst|gbdreg|Reg_OutputData[2] .ShiftMux = 1'b0;
defparam \macro_inst|gbdreg|Reg_OutputData[2] .BypassEn = 1'b0;
defparam \macro_inst|gbdreg|Reg_OutputData[2] .CarryEnb = 1'b1;

alta_slice \macro_inst|gbdreg|Reg_OutputData[3] (
	.A(\macro_inst|gbdreg|Reg_A000 [3]),
	.B(\macro_inst|gbdreg|Decoder0~1_combout ),
	.C(\macro_inst|gbdreg|last_nCS [0]),
	.D(\macro_inst|gbdreg|last_nCS [1]),
	.Cin(),
	.Qin(\macro_inst|gbdreg|Reg_OutputData [3]),
	.Clk(\auto_generated_inst.hbo_22_f9ff3d300b43c0f2_bp__macro_inst|gbdreg|Reg_OutputData[0]~3_combout_X59_Y1_SIG_SIG ),
	.AsyncReset(\sys_resetn~clkctrl_outclk__AsyncReset_X59_Y1_SIG ),
	.SyncReset(),
	.ShiftData(),
	.SyncLoad(),
	.LutOut(\macro_inst|gbdreg|Reg_OutputData~6_combout ),
	.Cout(),
	.Q(\macro_inst|gbdreg|Reg_OutputData [3]));
defparam \macro_inst|gbdreg|Reg_OutputData[3] .coord_x = 6;
defparam \macro_inst|gbdreg|Reg_OutputData[3] .coord_y = 2;
defparam \macro_inst|gbdreg|Reg_OutputData[3] .coord_z = 2;
defparam \macro_inst|gbdreg|Reg_OutputData[3] .mask = 16'h0080;
defparam \macro_inst|gbdreg|Reg_OutputData[3] .modeMux = 1'b0;
defparam \macro_inst|gbdreg|Reg_OutputData[3] .FeedbackMux = 1'b0;
defparam \macro_inst|gbdreg|Reg_OutputData[3] .ShiftMux = 1'b0;
defparam \macro_inst|gbdreg|Reg_OutputData[3] .BypassEn = 1'b0;
defparam \macro_inst|gbdreg|Reg_OutputData[3] .CarryEnb = 1'b1;

alta_slice \macro_inst|gbdreg|Reg_OutputData[4] (
	.A(\macro_inst|gbdreg|Reg_A000 [4]),
	.B(\macro_inst|gbdreg|Decoder0~1_combout ),
	.C(\macro_inst|gbdreg|last_nCS [0]),
	.D(\macro_inst|gbdreg|last_nCS [1]),
	.Cin(),
	.Qin(\macro_inst|gbdreg|Reg_OutputData [4]),
	.Clk(\auto_generated_inst.hbo_22_f9ff3d300b43c0f2_bp__macro_inst|gbdreg|Reg_OutputData[0]~3_combout_X59_Y1_SIG_SIG ),
	.AsyncReset(\sys_resetn~clkctrl_outclk__AsyncReset_X59_Y1_SIG ),
	.SyncReset(),
	.ShiftData(),
	.SyncLoad(),
	.LutOut(\macro_inst|gbdreg|Reg_OutputData~7_combout ),
	.Cout(),
	.Q(\macro_inst|gbdreg|Reg_OutputData [4]));
defparam \macro_inst|gbdreg|Reg_OutputData[4] .coord_x = 6;
defparam \macro_inst|gbdreg|Reg_OutputData[4] .coord_y = 2;
defparam \macro_inst|gbdreg|Reg_OutputData[4] .coord_z = 3;
defparam \macro_inst|gbdreg|Reg_OutputData[4] .mask = 16'h0080;
defparam \macro_inst|gbdreg|Reg_OutputData[4] .modeMux = 1'b0;
defparam \macro_inst|gbdreg|Reg_OutputData[4] .FeedbackMux = 1'b0;
defparam \macro_inst|gbdreg|Reg_OutputData[4] .ShiftMux = 1'b0;
defparam \macro_inst|gbdreg|Reg_OutputData[4] .BypassEn = 1'b0;
defparam \macro_inst|gbdreg|Reg_OutputData[4] .CarryEnb = 1'b1;

alta_slice \macro_inst|gbdreg|Reg_OutputData[5] (
	.A(\macro_inst|gbdreg|Decoder0~1_combout ),
	.B(\macro_inst|gbdreg|Reg_A000 [5]),
	.C(\macro_inst|gbdreg|last_nCS [0]),
	.D(\macro_inst|gbdreg|last_nCS [1]),
	.Cin(),
	.Qin(\macro_inst|gbdreg|Reg_OutputData [5]),
	.Clk(\auto_generated_inst.hbo_22_f9ff3d300b43c0f2_bp__macro_inst|gbdreg|Reg_OutputData[0]~3_combout_X59_Y1_SIG_SIG ),
	.AsyncReset(\sys_resetn~clkctrl_outclk__AsyncReset_X59_Y1_SIG ),
	.SyncReset(),
	.ShiftData(),
	.SyncLoad(),
	.LutOut(\macro_inst|gbdreg|Reg_OutputData~8_combout ),
	.Cout(),
	.Q(\macro_inst|gbdreg|Reg_OutputData [5]));
defparam \macro_inst|gbdreg|Reg_OutputData[5] .coord_x = 6;
defparam \macro_inst|gbdreg|Reg_OutputData[5] .coord_y = 2;
defparam \macro_inst|gbdreg|Reg_OutputData[5] .coord_z = 14;
defparam \macro_inst|gbdreg|Reg_OutputData[5] .mask = 16'h0080;
defparam \macro_inst|gbdreg|Reg_OutputData[5] .modeMux = 1'b0;
defparam \macro_inst|gbdreg|Reg_OutputData[5] .FeedbackMux = 1'b0;
defparam \macro_inst|gbdreg|Reg_OutputData[5] .ShiftMux = 1'b0;
defparam \macro_inst|gbdreg|Reg_OutputData[5] .BypassEn = 1'b0;
defparam \macro_inst|gbdreg|Reg_OutputData[5] .CarryEnb = 1'b1;

alta_slice \macro_inst|gbdreg|Reg_OutputData[6] (
	.A(\macro_inst|gbdreg|last_nCS [0]),
	.B(\macro_inst|gbdreg|Decoder0~1_combout ),
	.C(\macro_inst|gbdreg|last_nCS [1]),
	.D(\macro_inst|gbdreg|Reg_A000 [6]),
	.Cin(),
	.Qin(\macro_inst|gbdreg|Reg_OutputData [6]),
	.Clk(\auto_generated_inst.hbo_22_f9ff3d300b43c0f2_bp__macro_inst|gbdreg|Reg_OutputData[0]~3_combout_X59_Y1_SIG_SIG ),
	.AsyncReset(\sys_resetn~clkctrl_outclk__AsyncReset_X59_Y1_SIG ),
	.SyncReset(),
	.ShiftData(),
	.SyncLoad(),
	.LutOut(\macro_inst|gbdreg|Reg_OutputData~9_combout ),
	.Cout(),
	.Q(\macro_inst|gbdreg|Reg_OutputData [6]));
defparam \macro_inst|gbdreg|Reg_OutputData[6] .coord_x = 6;
defparam \macro_inst|gbdreg|Reg_OutputData[6] .coord_y = 2;
defparam \macro_inst|gbdreg|Reg_OutputData[6] .coord_z = 5;
defparam \macro_inst|gbdreg|Reg_OutputData[6] .mask = 16'h0800;
defparam \macro_inst|gbdreg|Reg_OutputData[6] .modeMux = 1'b0;
defparam \macro_inst|gbdreg|Reg_OutputData[6] .FeedbackMux = 1'b0;
defparam \macro_inst|gbdreg|Reg_OutputData[6] .ShiftMux = 1'b0;
defparam \macro_inst|gbdreg|Reg_OutputData[6] .BypassEn = 1'b0;
defparam \macro_inst|gbdreg|Reg_OutputData[6] .CarryEnb = 1'b1;

alta_slice \macro_inst|gbdreg|Reg_OutputData[7] (
	.A(\macro_inst|gbdreg|Decoder0~1_combout ),
	.B(\macro_inst|gbdreg|last_nCS [0]),
	.C(\macro_inst|gbdreg|Reg_A000 [7]),
	.D(\macro_inst|gbdreg|last_nCS [1]),
	.Cin(),
	.Qin(\macro_inst|gbdreg|Reg_OutputData [7]),
	.Clk(\auto_generated_inst.hbo_22_f9ff3d300b43c0f2_bp__macro_inst|gbdreg|Reg_OutputData[0]~3_combout_X59_Y1_SIG_SIG ),
	.AsyncReset(\sys_resetn~clkctrl_outclk__AsyncReset_X59_Y1_SIG ),
	.SyncReset(),
	.ShiftData(),
	.SyncLoad(),
	.LutOut(\macro_inst|gbdreg|Reg_OutputData~10_combout ),
	.Cout(),
	.Q(\macro_inst|gbdreg|Reg_OutputData [7]));
defparam \macro_inst|gbdreg|Reg_OutputData[7] .coord_x = 6;
defparam \macro_inst|gbdreg|Reg_OutputData[7] .coord_y = 2;
defparam \macro_inst|gbdreg|Reg_OutputData[7] .coord_z = 8;
defparam \macro_inst|gbdreg|Reg_OutputData[7] .mask = 16'h0080;
defparam \macro_inst|gbdreg|Reg_OutputData[7] .modeMux = 1'b0;
defparam \macro_inst|gbdreg|Reg_OutputData[7] .FeedbackMux = 1'b0;
defparam \macro_inst|gbdreg|Reg_OutputData[7] .ShiftMux = 1'b0;
defparam \macro_inst|gbdreg|Reg_OutputData[7] .BypassEn = 1'b0;
defparam \macro_inst|gbdreg|Reg_OutputData[7] .CarryEnb = 1'b1;

alta_slice \macro_inst|gbdreg|Reg_OutputValid (
	.A(\cart_nRD~input_o ),
	.B(\macro_inst|gbdreg|Reg_OutputValid~1_combout ),
	.C(vcc),
	.D(\macro_inst|gbdreg|Reg_OutputValid~0_combout ),
	.Cin(),
	.Qin(\macro_inst|gbdreg|Reg_OutputValid~q ),
	.Clk(\auto_generated_inst.hbo_22_f9ff3d300b43c0f2_bp_X58_Y1_SIG_VCC ),
	.AsyncReset(\sys_resetn~clkctrl_outclk__AsyncReset_X58_Y1_SIG ),
	.SyncReset(),
	.ShiftData(),
	.SyncLoad(),
	.LutOut(\macro_inst|gbdreg|Reg_OutputValid~2_combout ),
	.Cout(),
	.Q(\macro_inst|gbdreg|Reg_OutputValid~q ));
defparam \macro_inst|gbdreg|Reg_OutputValid .coord_x = 7;
defparam \macro_inst|gbdreg|Reg_OutputValid .coord_y = 3;
defparam \macro_inst|gbdreg|Reg_OutputValid .coord_z = 2;
defparam \macro_inst|gbdreg|Reg_OutputValid .mask = 16'hB4B0;
defparam \macro_inst|gbdreg|Reg_OutputValid .modeMux = 1'b0;
defparam \macro_inst|gbdreg|Reg_OutputValid .FeedbackMux = 1'b1;
defparam \macro_inst|gbdreg|Reg_OutputValid .ShiftMux = 1'b0;
defparam \macro_inst|gbdreg|Reg_OutputValid .BypassEn = 1'b0;
defparam \macro_inst|gbdreg|Reg_OutputValid .CarryEnb = 1'b1;

alta_slice \macro_inst|gbdreg|WideOr0~0 (
	.A(\cart_a[3]~input_o ),
	.B(\cart_a[4]~input_o ),
	.C(\cart_a[1]~input_o ),
	.D(\cart_a[2]~input_o ),
	.Cin(),
	.Qin(),
	.Clk(),
	.AsyncReset(),
	.SyncReset(),
	.ShiftData(),
	.SyncLoad(),
	.LutOut(\macro_inst|gbdreg|WideOr0~0_combout ),
	.Cout(),
	.Q());
defparam \macro_inst|gbdreg|WideOr0~0 .coord_x = 7;
defparam \macro_inst|gbdreg|WideOr0~0 .coord_y = 2;
defparam \macro_inst|gbdreg|WideOr0~0 .coord_z = 15;
defparam \macro_inst|gbdreg|WideOr0~0 .mask = 16'hFEEE;
defparam \macro_inst|gbdreg|WideOr0~0 .modeMux = 1'b0;
defparam \macro_inst|gbdreg|WideOr0~0 .FeedbackMux = 1'b0;
defparam \macro_inst|gbdreg|WideOr0~0 .ShiftMux = 1'b0;
defparam \macro_inst|gbdreg|WideOr0~0 .BypassEn = 1'b0;
defparam \macro_inst|gbdreg|WideOr0~0 .CarryEnb = 1'b1;

alta_slice \macro_inst|gbdreg|bram_signal_reset_cnt[0] (
	.A(vcc),
	.B(vcc),
	.C(vcc),
	.D(\macro_inst|gbdreg|Bram_Req_Write~q ),
	.Cin(),
	.Qin(\macro_inst|gbdreg|bram_signal_reset_cnt [0]),
	.Clk(\auto_generated_inst.hbo_22_f9ff3d300b43c0f2_bp_X61_Y1_SIG_VCC ),
	.AsyncReset(\sys_resetn~clkctrl_outclk__AsyncReset_X61_Y1_SIG ),
	.SyncReset(),
	.ShiftData(),
	.SyncLoad(),
	.LutOut(\macro_inst|gbdreg|bram_signal_reset_cnt[0]~2_combout ),
	.Cout(),
	.Q(\macro_inst|gbdreg|bram_signal_reset_cnt [0]));
defparam \macro_inst|gbdreg|bram_signal_reset_cnt[0] .coord_x = 6;
defparam \macro_inst|gbdreg|bram_signal_reset_cnt[0] .coord_y = 3;
defparam \macro_inst|gbdreg|bram_signal_reset_cnt[0] .coord_z = 4;
defparam \macro_inst|gbdreg|bram_signal_reset_cnt[0] .mask = 16'h0FF0;
defparam \macro_inst|gbdreg|bram_signal_reset_cnt[0] .modeMux = 1'b0;
defparam \macro_inst|gbdreg|bram_signal_reset_cnt[0] .FeedbackMux = 1'b1;
defparam \macro_inst|gbdreg|bram_signal_reset_cnt[0] .ShiftMux = 1'b0;
defparam \macro_inst|gbdreg|bram_signal_reset_cnt[0] .BypassEn = 1'b0;
defparam \macro_inst|gbdreg|bram_signal_reset_cnt[0] .CarryEnb = 1'b1;

alta_slice \macro_inst|gbdreg|bram_signal_reset_cnt[1] (
	.A(vcc),
	.B(\macro_inst|gbdreg|bram_signal_reset_cnt [0]),
	.C(vcc),
	.D(\macro_inst|gbdreg|Bram_Req_Write~q ),
	.Cin(),
	.Qin(\macro_inst|gbdreg|bram_signal_reset_cnt [1]),
	.Clk(\auto_generated_inst.hbo_22_f9ff3d300b43c0f2_bp_X61_Y1_SIG_VCC ),
	.AsyncReset(\sys_resetn~clkctrl_outclk__AsyncReset_X61_Y1_SIG ),
	.SyncReset(),
	.ShiftData(),
	.SyncLoad(),
	.LutOut(\macro_inst|gbdreg|bram_signal_reset_cnt[1]~1_combout ),
	.Cout(),
	.Q(\macro_inst|gbdreg|bram_signal_reset_cnt [1]));
defparam \macro_inst|gbdreg|bram_signal_reset_cnt[1] .coord_x = 6;
defparam \macro_inst|gbdreg|bram_signal_reset_cnt[1] .coord_y = 3;
defparam \macro_inst|gbdreg|bram_signal_reset_cnt[1] .coord_z = 5;
defparam \macro_inst|gbdreg|bram_signal_reset_cnt[1] .mask = 16'h3CF0;
defparam \macro_inst|gbdreg|bram_signal_reset_cnt[1] .modeMux = 1'b0;
defparam \macro_inst|gbdreg|bram_signal_reset_cnt[1] .FeedbackMux = 1'b1;
defparam \macro_inst|gbdreg|bram_signal_reset_cnt[1] .ShiftMux = 1'b0;
defparam \macro_inst|gbdreg|bram_signal_reset_cnt[1] .BypassEn = 1'b0;
defparam \macro_inst|gbdreg|bram_signal_reset_cnt[1] .CarryEnb = 1'b1;

alta_slice \macro_inst|gbdreg|bram_signal_reset_cnt[2] (
	.A(\macro_inst|gbdreg|bram_signal_reset_cnt [0]),
	.B(\macro_inst|gbdreg|bram_signal_reset_cnt [1]),
	.C(vcc),
	.D(\macro_inst|gbdreg|Bram_Req_Write~q ),
	.Cin(),
	.Qin(\macro_inst|gbdreg|bram_signal_reset_cnt [2]),
	.Clk(\auto_generated_inst.hbo_22_f9ff3d300b43c0f2_bp_X61_Y1_SIG_VCC ),
	.AsyncReset(\sys_resetn~clkctrl_outclk__AsyncReset_X61_Y1_SIG ),
	.SyncReset(),
	.ShiftData(),
	.SyncLoad(),
	.LutOut(\macro_inst|gbdreg|bram_signal_reset_cnt[2]~0_combout ),
	.Cout(),
	.Q(\macro_inst|gbdreg|bram_signal_reset_cnt [2]));
defparam \macro_inst|gbdreg|bram_signal_reset_cnt[2] .coord_x = 6;
defparam \macro_inst|gbdreg|bram_signal_reset_cnt[2] .coord_y = 3;
defparam \macro_inst|gbdreg|bram_signal_reset_cnt[2] .coord_z = 2;
defparam \macro_inst|gbdreg|bram_signal_reset_cnt[2] .mask = 16'h78F0;
defparam \macro_inst|gbdreg|bram_signal_reset_cnt[2] .modeMux = 1'b0;
defparam \macro_inst|gbdreg|bram_signal_reset_cnt[2] .FeedbackMux = 1'b1;
defparam \macro_inst|gbdreg|bram_signal_reset_cnt[2] .ShiftMux = 1'b0;
defparam \macro_inst|gbdreg|bram_signal_reset_cnt[2] .BypassEn = 1'b0;
defparam \macro_inst|gbdreg|bram_signal_reset_cnt[2] .CarryEnb = 1'b1;

alta_slice \macro_inst|gbdreg|is_accessing_reg~0 (
	.A(\cart_a[13]~input_o ),
	.B(\cart_a[14]~input_o ),
	.C(\cart_a[15]~input_o ),
	.D(\cart_nCS~input_o ),
	.Cin(),
	.Qin(),
	.Clk(),
	.AsyncReset(),
	.SyncReset(),
	.ShiftData(),
	.SyncLoad(),
	.LutOut(\macro_inst|gbdreg|is_accessing_reg~0_combout ),
	.Cout(),
	.Q());
defparam \macro_inst|gbdreg|is_accessing_reg~0 .coord_x = 7;
defparam \macro_inst|gbdreg|is_accessing_reg~0 .coord_y = 3;
defparam \macro_inst|gbdreg|is_accessing_reg~0 .coord_z = 3;
defparam \macro_inst|gbdreg|is_accessing_reg~0 .mask = 16'h0020;
defparam \macro_inst|gbdreg|is_accessing_reg~0 .modeMux = 1'b0;
defparam \macro_inst|gbdreg|is_accessing_reg~0 .FeedbackMux = 1'b0;
defparam \macro_inst|gbdreg|is_accessing_reg~0 .ShiftMux = 1'b0;
defparam \macro_inst|gbdreg|is_accessing_reg~0 .BypassEn = 1'b0;
defparam \macro_inst|gbdreg|is_accessing_reg~0 .CarryEnb = 1'b1;

alta_slice \macro_inst|gbdreg|last_CamCaptureFinish[0] (
	.A(vcc),
	.B(vcc),
	.C(\macro_inst|gbdcam|Cam_Capture_Finish~q ),
	.D(vcc),
	.Cin(),
	.Qin(\macro_inst|gbdreg|last_CamCaptureFinish [0]),
	.Clk(\auto_generated_inst.hbo_22_f9ff3d300b43c0f2_bp_X60_Y1_SIG_VCC ),
	.AsyncReset(\sys_resetn~clkctrl_outclk__AsyncReset_X60_Y1_SIG ),
	.SyncReset(),
	.ShiftData(),
	.SyncLoad(),
	.LutOut(\macro_inst|gbdreg|last_CamCaptureFinish[0]~feeder_combout ),
	.Cout(),
	.Q(\macro_inst|gbdreg|last_CamCaptureFinish [0]));
defparam \macro_inst|gbdreg|last_CamCaptureFinish[0] .coord_x = 7;
defparam \macro_inst|gbdreg|last_CamCaptureFinish[0] .coord_y = 2;
defparam \macro_inst|gbdreg|last_CamCaptureFinish[0] .coord_z = 7;
defparam \macro_inst|gbdreg|last_CamCaptureFinish[0] .mask = 16'hF0F0;
defparam \macro_inst|gbdreg|last_CamCaptureFinish[0] .modeMux = 1'b0;
defparam \macro_inst|gbdreg|last_CamCaptureFinish[0] .FeedbackMux = 1'b0;
defparam \macro_inst|gbdreg|last_CamCaptureFinish[0] .ShiftMux = 1'b0;
defparam \macro_inst|gbdreg|last_CamCaptureFinish[0] .BypassEn = 1'b0;
defparam \macro_inst|gbdreg|last_CamCaptureFinish[0] .CarryEnb = 1'b1;

alta_slice \macro_inst|gbdreg|last_CamCaptureFinish[1] (
	.A(vcc),
	.B(vcc),
	.C(vcc),
	.D(\macro_inst|gbdreg|last_CamCaptureFinish [0]),
	.Cin(),
	.Qin(\macro_inst|gbdreg|last_CamCaptureFinish [1]),
	.Clk(\auto_generated_inst.hbo_22_f9ff3d300b43c0f2_bp_X60_Y1_SIG_VCC ),
	.AsyncReset(\sys_resetn~clkctrl_outclk__AsyncReset_X60_Y1_SIG ),
	.SyncReset(),
	.ShiftData(),
	.SyncLoad(),
	.LutOut(\macro_inst|gbdreg|last_CamCaptureFinish[1]~feeder_combout ),
	.Cout(),
	.Q(\macro_inst|gbdreg|last_CamCaptureFinish [1]));
defparam \macro_inst|gbdreg|last_CamCaptureFinish[1] .coord_x = 7;
defparam \macro_inst|gbdreg|last_CamCaptureFinish[1] .coord_y = 2;
defparam \macro_inst|gbdreg|last_CamCaptureFinish[1] .coord_z = 0;
defparam \macro_inst|gbdreg|last_CamCaptureFinish[1] .mask = 16'hFF00;
defparam \macro_inst|gbdreg|last_CamCaptureFinish[1] .modeMux = 1'b0;
defparam \macro_inst|gbdreg|last_CamCaptureFinish[1] .FeedbackMux = 1'b0;
defparam \macro_inst|gbdreg|last_CamCaptureFinish[1] .ShiftMux = 1'b0;
defparam \macro_inst|gbdreg|last_CamCaptureFinish[1] .BypassEn = 1'b0;
defparam \macro_inst|gbdreg|last_CamCaptureFinish[1] .CarryEnb = 1'b1;

alta_slice \macro_inst|gbdreg|last_nCS[0] (
	.A(vcc),
	.B(vcc),
	.C(vcc),
	.D(\cart_nCS~input_o ),
	.Cin(),
	.Qin(\macro_inst|gbdreg|last_nCS [0]),
	.Clk(\auto_generated_inst.hbo_22_f9ff3d300b43c0f2_bp_X58_Y1_SIG_VCC ),
	.AsyncReset(\sys_resetn~clkctrl_outclk__AsyncReset_X58_Y1_SIG ),
	.SyncReset(),
	.ShiftData(),
	.SyncLoad(),
	.LutOut(\macro_inst|gbdreg|last_nCS[0]~0_combout ),
	.Cout(),
	.Q(\macro_inst|gbdreg|last_nCS [0]));
defparam \macro_inst|gbdreg|last_nCS[0] .coord_x = 7;
defparam \macro_inst|gbdreg|last_nCS[0] .coord_y = 3;
defparam \macro_inst|gbdreg|last_nCS[0] .coord_z = 1;
defparam \macro_inst|gbdreg|last_nCS[0] .mask = 16'h00FF;
defparam \macro_inst|gbdreg|last_nCS[0] .modeMux = 1'b0;
defparam \macro_inst|gbdreg|last_nCS[0] .FeedbackMux = 1'b0;
defparam \macro_inst|gbdreg|last_nCS[0] .ShiftMux = 1'b0;
defparam \macro_inst|gbdreg|last_nCS[0] .BypassEn = 1'b0;
defparam \macro_inst|gbdreg|last_nCS[0] .CarryEnb = 1'b1;

alta_slice \macro_inst|gbdreg|last_nCS[1] (
	.A(\macro_inst|gbdram|last_nWR [1]),
	.B(\macro_inst|gbdram|last_nWR [0]),
	.C(\macro_inst|gbdreg|last_nCS [0]),
	.D(\macro_inst|gbdreg|Bram_Req_Write~q ),
	.Cin(),
	.Qin(\macro_inst|gbdreg|last_nCS [1]),
	.Clk(\auto_generated_inst.hbo_22_f9ff3d300b43c0f2_bp_X58_Y1_SIG_VCC ),
	.AsyncReset(\sys_resetn~clkctrl_outclk__AsyncReset_X58_Y1_SIG ),
	.SyncReset(SyncReset_X58_Y1_GND),
	.ShiftData(),
	.SyncLoad(SyncLoad_X58_Y1_VCC),
	.LutOut(\macro_inst|gbdreg|Bram_Req_Write~0_combout ),
	.Cout(),
	.Q(\macro_inst|gbdreg|last_nCS [1]));
defparam \macro_inst|gbdreg|last_nCS[1] .coord_x = 7;
defparam \macro_inst|gbdreg|last_nCS[1] .coord_y = 3;
defparam \macro_inst|gbdreg|last_nCS[1] .coord_z = 5;
defparam \macro_inst|gbdreg|last_nCS[1] .mask = 16'h0044;
defparam \macro_inst|gbdreg|last_nCS[1] .modeMux = 1'b0;
defparam \macro_inst|gbdreg|last_nCS[1] .FeedbackMux = 1'b0;
defparam \macro_inst|gbdreg|last_nCS[1] .ShiftMux = 1'b0;
defparam \macro_inst|gbdreg|last_nCS[1] .BypassEn = 1'b1;
defparam \macro_inst|gbdreg|last_nCS[1] .CarryEnb = 1'b1;

alta_slice \macro_inst|gbdrom|Rom_a[14]~0 (
	.A(\macro_inst|gbdrom|bank_id [0]),
	.B(vcc),
	.C(\cart_a[14]~input_o ),
	.D(\cart_a[15]~input_o ),
	.Cin(),
	.Qin(),
	.Clk(),
	.AsyncReset(),
	.SyncReset(),
	.ShiftData(),
	.SyncLoad(),
	.LutOut(\macro_inst|gbdrom|Rom_a[14]~0_combout ),
	.Cout(),
	.Q());
defparam \macro_inst|gbdrom|Rom_a[14]~0 .coord_x = 8;
defparam \macro_inst|gbdrom|Rom_a[14]~0 .coord_y = 3;
defparam \macro_inst|gbdrom|Rom_a[14]~0 .coord_z = 11;
defparam \macro_inst|gbdrom|Rom_a[14]~0 .mask = 16'h5550;
defparam \macro_inst|gbdrom|Rom_a[14]~0 .modeMux = 1'b0;
defparam \macro_inst|gbdrom|Rom_a[14]~0 .FeedbackMux = 1'b0;
defparam \macro_inst|gbdrom|Rom_a[14]~0 .ShiftMux = 1'b0;
defparam \macro_inst|gbdrom|Rom_a[14]~0 .BypassEn = 1'b0;
defparam \macro_inst|gbdrom|Rom_a[14]~0 .CarryEnb = 1'b1;

alta_slice \macro_inst|gbdrom|bank_id[0] (
	.A(vcc),
	.B(vcc),
	.C(vcc),
	.D(\cart_d[0]~input_o ),
	.Cin(),
	.Qin(\macro_inst|gbdrom|bank_id [0]),
	.Clk(\auto_generated_inst.hbo_22_f9ff3d300b43c0f2_bp__macro_inst|gbdrom|bank_id[0]~0_combout_X57_Y1_SIG_SIG ),
	.AsyncReset(\sys_resetn~clkctrl_outclk__AsyncReset_X57_Y1_SIG ),
	.SyncReset(),
	.ShiftData(),
	.SyncLoad(),
	.LutOut(\macro_inst|gbdrom|bank_id[0]~1_combout ),
	.Cout(),
	.Q(\macro_inst|gbdrom|bank_id [0]));
defparam \macro_inst|gbdrom|bank_id[0] .coord_x = 8;
defparam \macro_inst|gbdrom|bank_id[0] .coord_y = 3;
defparam \macro_inst|gbdrom|bank_id[0] .coord_z = 2;
defparam \macro_inst|gbdrom|bank_id[0] .mask = 16'h00FF;
defparam \macro_inst|gbdrom|bank_id[0] .modeMux = 1'b0;
defparam \macro_inst|gbdrom|bank_id[0] .FeedbackMux = 1'b0;
defparam \macro_inst|gbdrom|bank_id[0] .ShiftMux = 1'b0;
defparam \macro_inst|gbdrom|bank_id[0] .BypassEn = 1'b0;
defparam \macro_inst|gbdrom|bank_id[0] .CarryEnb = 1'b1;

alta_slice \macro_inst|gbdrom|bank_id[1] (
	.A(\cart_a[14]~input_o ),
	.B(vcc),
	.C(\cart_d[1]~input_o ),
	.D(\cart_a[15]~input_o ),
	.Cin(),
	.Qin(\macro_inst|gbdrom|bank_id [1]),
	.Clk(\auto_generated_inst.hbo_22_f9ff3d300b43c0f2_bp__macro_inst|gbdrom|bank_id[0]~0_combout_X57_Y1_SIG_SIG ),
	.AsyncReset(\sys_resetn~clkctrl_outclk__AsyncReset_X57_Y1_SIG ),
	.SyncReset(SyncReset_X57_Y1_GND),
	.ShiftData(),
	.SyncLoad(SyncLoad_X57_Y1_VCC),
	.LutOut(\macro_inst|gbdrom|Rom_a[15]~1_combout ),
	.Cout(),
	.Q(\macro_inst|gbdrom|bank_id [1]));
defparam \macro_inst|gbdrom|bank_id[1] .coord_x = 8;
defparam \macro_inst|gbdrom|bank_id[1] .coord_y = 3;
defparam \macro_inst|gbdrom|bank_id[1] .coord_z = 5;
defparam \macro_inst|gbdrom|bank_id[1] .mask = 16'hF0A0;
defparam \macro_inst|gbdrom|bank_id[1] .modeMux = 1'b0;
defparam \macro_inst|gbdrom|bank_id[1] .FeedbackMux = 1'b1;
defparam \macro_inst|gbdrom|bank_id[1] .ShiftMux = 1'b0;
defparam \macro_inst|gbdrom|bank_id[1] .BypassEn = 1'b1;
defparam \macro_inst|gbdrom|bank_id[1] .CarryEnb = 1'b1;

alta_slice \macro_inst|gbdrom|bank_id[2] (
	.A(\cart_a[14]~input_o ),
	.B(vcc),
	.C(\cart_d[2]~input_o ),
	.D(\cart_a[15]~input_o ),
	.Cin(),
	.Qin(\macro_inst|gbdrom|bank_id [2]),
	.Clk(\auto_generated_inst.hbo_22_f9ff3d300b43c0f2_bp__macro_inst|gbdrom|bank_id[0]~0_combout_X57_Y1_SIG_SIG ),
	.AsyncReset(\sys_resetn~clkctrl_outclk__AsyncReset_X57_Y1_SIG ),
	.SyncReset(SyncReset_X57_Y1_GND),
	.ShiftData(),
	.SyncLoad(SyncLoad_X57_Y1_VCC),
	.LutOut(\macro_inst|gbdrom|Rom_a[16]~2_combout ),
	.Cout(),
	.Q(\macro_inst|gbdrom|bank_id [2]));
defparam \macro_inst|gbdrom|bank_id[2] .coord_x = 8;
defparam \macro_inst|gbdrom|bank_id[2] .coord_y = 3;
defparam \macro_inst|gbdrom|bank_id[2] .coord_z = 10;
defparam \macro_inst|gbdrom|bank_id[2] .mask = 16'hF0A0;
defparam \macro_inst|gbdrom|bank_id[2] .modeMux = 1'b0;
defparam \macro_inst|gbdrom|bank_id[2] .FeedbackMux = 1'b1;
defparam \macro_inst|gbdrom|bank_id[2] .ShiftMux = 1'b0;
defparam \macro_inst|gbdrom|bank_id[2] .BypassEn = 1'b1;
defparam \macro_inst|gbdrom|bank_id[2] .CarryEnb = 1'b1;

alta_slice \macro_inst|gbdrom|bank_id[3] (
	.A(\cart_a[14]~input_o ),
	.B(vcc),
	.C(\cart_d[3]~input_o ),
	.D(\cart_a[15]~input_o ),
	.Cin(),
	.Qin(\macro_inst|gbdrom|bank_id [3]),
	.Clk(\auto_generated_inst.hbo_22_f9ff3d300b43c0f2_bp__macro_inst|gbdrom|bank_id[0]~0_combout_X57_Y1_SIG_SIG ),
	.AsyncReset(\sys_resetn~clkctrl_outclk__AsyncReset_X57_Y1_SIG ),
	.SyncReset(SyncReset_X57_Y1_GND),
	.ShiftData(),
	.SyncLoad(SyncLoad_X57_Y1_VCC),
	.LutOut(\macro_inst|gbdrom|Rom_a[17]~3_combout ),
	.Cout(),
	.Q(\macro_inst|gbdrom|bank_id [3]));
defparam \macro_inst|gbdrom|bank_id[3] .coord_x = 8;
defparam \macro_inst|gbdrom|bank_id[3] .coord_y = 3;
defparam \macro_inst|gbdrom|bank_id[3] .coord_z = 4;
defparam \macro_inst|gbdrom|bank_id[3] .mask = 16'hF0A0;
defparam \macro_inst|gbdrom|bank_id[3] .modeMux = 1'b0;
defparam \macro_inst|gbdrom|bank_id[3] .FeedbackMux = 1'b1;
defparam \macro_inst|gbdrom|bank_id[3] .ShiftMux = 1'b0;
defparam \macro_inst|gbdrom|bank_id[3] .BypassEn = 1'b1;
defparam \macro_inst|gbdrom|bank_id[3] .CarryEnb = 1'b1;

alta_slice \macro_inst|gbdrom|bank_id[4] (
	.A(\cart_a[14]~input_o ),
	.B(vcc),
	.C(\cart_d[4]~input_o ),
	.D(\cart_a[15]~input_o ),
	.Cin(),
	.Qin(\macro_inst|gbdrom|bank_id [4]),
	.Clk(\auto_generated_inst.hbo_22_f9ff3d300b43c0f2_bp__macro_inst|gbdrom|bank_id[0]~0_combout_X57_Y1_SIG_SIG ),
	.AsyncReset(\sys_resetn~clkctrl_outclk__AsyncReset_X57_Y1_SIG ),
	.SyncReset(SyncReset_X57_Y1_GND),
	.ShiftData(),
	.SyncLoad(SyncLoad_X57_Y1_VCC),
	.LutOut(\macro_inst|gbdrom|Rom_a[18]~4_combout ),
	.Cout(),
	.Q(\macro_inst|gbdrom|bank_id [4]));
defparam \macro_inst|gbdrom|bank_id[4] .coord_x = 8;
defparam \macro_inst|gbdrom|bank_id[4] .coord_y = 3;
defparam \macro_inst|gbdrom|bank_id[4] .coord_z = 9;
defparam \macro_inst|gbdrom|bank_id[4] .mask = 16'hF0A0;
defparam \macro_inst|gbdrom|bank_id[4] .modeMux = 1'b0;
defparam \macro_inst|gbdrom|bank_id[4] .FeedbackMux = 1'b1;
defparam \macro_inst|gbdrom|bank_id[4] .ShiftMux = 1'b0;
defparam \macro_inst|gbdrom|bank_id[4] .BypassEn = 1'b1;
defparam \macro_inst|gbdrom|bank_id[4] .CarryEnb = 1'b1;

alta_slice \macro_inst|gbdrom|bank_id[5] (
	.A(\cart_a[14]~input_o ),
	.B(vcc),
	.C(\cart_d[5]~input_o ),
	.D(\cart_a[15]~input_o ),
	.Cin(),
	.Qin(\macro_inst|gbdrom|bank_id [5]),
	.Clk(\auto_generated_inst.hbo_22_f9ff3d300b43c0f2_bp__macro_inst|gbdrom|bank_id[0]~0_combout_X57_Y1_SIG_SIG ),
	.AsyncReset(\sys_resetn~clkctrl_outclk__AsyncReset_X57_Y1_SIG ),
	.SyncReset(SyncReset_X57_Y1_GND),
	.ShiftData(),
	.SyncLoad(SyncLoad_X57_Y1_VCC),
	.LutOut(\macro_inst|gbdrom|Rom_a[19]~5_combout ),
	.Cout(),
	.Q(\macro_inst|gbdrom|bank_id [5]));
defparam \macro_inst|gbdrom|bank_id[5] .coord_x = 8;
defparam \macro_inst|gbdrom|bank_id[5] .coord_y = 3;
defparam \macro_inst|gbdrom|bank_id[5] .coord_z = 0;
defparam \macro_inst|gbdrom|bank_id[5] .mask = 16'hF0A0;
defparam \macro_inst|gbdrom|bank_id[5] .modeMux = 1'b0;
defparam \macro_inst|gbdrom|bank_id[5] .FeedbackMux = 1'b1;
defparam \macro_inst|gbdrom|bank_id[5] .ShiftMux = 1'b0;
defparam \macro_inst|gbdrom|bank_id[5] .BypassEn = 1'b1;
defparam \macro_inst|gbdrom|bank_id[5] .CarryEnb = 1'b1;

alta_pllve \pll_inst|auto_generated|pll1 (
	.clkin(\PLL_CLKIN~input_o ),
	.clkfb(\pll_inst|auto_generated|pll1~FBOUT ),
	.pfden(vcc),
	.resetn(!\PLL_ENABLE~combout ),
	.phasecounterselect({gnd, gnd, gnd}),
	.phaseupdown(gnd),
	.phasestep(gnd),
	.scanclk(gnd),
	.scanclkena(vcc),
	.scandata(gnd),
	.configupdate(gnd),
	.scandataout(),
	.scandone(),
	.phasedone(),
	.clkout0(\pll_inst|auto_generated|pll1_CLK_bus [0]),
	.clkout1(\pll_inst|auto_generated|pll1_CLK_bus [1]),
	.clkout2(\pll_inst|auto_generated|pll1_CLK_bus [2]),
	.clkout3(\pll_inst|auto_generated|pll1_CLK_bus [3]),
	.clkout4(\pll_inst|auto_generated|pll1_CLK_bus [4]),
	.clkfbout(\pll_inst|auto_generated|pll1~FBOUT ),
	.lock(\auto_generated_inst.hbo_13_83378d4b1997463f_bp ));
defparam \pll_inst|auto_generated|pll1 .coord_x = 22;
defparam \pll_inst|auto_generated|pll1 .coord_y = 5;
defparam \pll_inst|auto_generated|pll1 .coord_z = 0;
defparam \pll_inst|auto_generated|pll1 .CLKIN_HIGH = 8'b00000000;
defparam \pll_inst|auto_generated|pll1 .CLKIN_LOW = 8'b00000000;
defparam \pll_inst|auto_generated|pll1 .CLKIN_TRIM = 1'b0;
defparam \pll_inst|auto_generated|pll1 .CLKIN_BYPASS = 1'b0;
defparam \pll_inst|auto_generated|pll1 .CLKFB_HIGH = 8'b00100100;
defparam \pll_inst|auto_generated|pll1 .CLKFB_LOW = 8'b00100101;
defparam \pll_inst|auto_generated|pll1 .CLKFB_TRIM = 1'b0;
defparam \pll_inst|auto_generated|pll1 .CLKFB_BYPASS = 1'b0;
defparam \pll_inst|auto_generated|pll1 .CLKDIV0_EN = 1'b1;
defparam \pll_inst|auto_generated|pll1 .CLKDIV1_EN = 1'b0;
defparam \pll_inst|auto_generated|pll1 .CLKDIV2_EN = 1'b0;
defparam \pll_inst|auto_generated|pll1 .CLKDIV3_EN = 1'b0;
defparam \pll_inst|auto_generated|pll1 .CLKDIV4_EN = 1'b0;
defparam \pll_inst|auto_generated|pll1 .CLKOUT0_HIGH = 8'b00000000;
defparam \pll_inst|auto_generated|pll1 .CLKOUT0_LOW = 8'b00000000;
defparam \pll_inst|auto_generated|pll1 .CLKOUT0_TRIM = 1'b0;
defparam \pll_inst|auto_generated|pll1 .CLKOUT0_BYPASS = 1'b0;
defparam \pll_inst|auto_generated|pll1 .CLKOUT1_HIGH = 8'b11111111;
defparam \pll_inst|auto_generated|pll1 .CLKOUT1_LOW = 8'b11111111;
defparam \pll_inst|auto_generated|pll1 .CLKOUT1_TRIM = 1'b0;
defparam \pll_inst|auto_generated|pll1 .CLKOUT1_BYPASS = 1'b0;
defparam \pll_inst|auto_generated|pll1 .CLKOUT2_HIGH = 8'b11111111;
defparam \pll_inst|auto_generated|pll1 .CLKOUT2_LOW = 8'b11111111;
defparam \pll_inst|auto_generated|pll1 .CLKOUT2_TRIM = 1'b0;
defparam \pll_inst|auto_generated|pll1 .CLKOUT2_BYPASS = 1'b0;
defparam \pll_inst|auto_generated|pll1 .CLKOUT3_HIGH = 8'b11111111;
defparam \pll_inst|auto_generated|pll1 .CLKOUT3_LOW = 8'b11111111;
defparam \pll_inst|auto_generated|pll1 .CLKOUT3_TRIM = 1'b0;
defparam \pll_inst|auto_generated|pll1 .CLKOUT3_BYPASS = 1'b0;
defparam \pll_inst|auto_generated|pll1 .CLKOUT4_HIGH = 8'b11111111;
defparam \pll_inst|auto_generated|pll1 .CLKOUT4_LOW = 8'b11111111;
defparam \pll_inst|auto_generated|pll1 .CLKOUT4_TRIM = 1'b0;
defparam \pll_inst|auto_generated|pll1 .CLKOUT4_BYPASS = 1'b0;
defparam \pll_inst|auto_generated|pll1 .CLKOUT0_DEL = 8'b00000000;
defparam \pll_inst|auto_generated|pll1 .CLKOUT1_DEL = 8'b00000000;
defparam \pll_inst|auto_generated|pll1 .CLKOUT2_DEL = 8'b00000000;
defparam \pll_inst|auto_generated|pll1 .CLKOUT3_DEL = 8'b00000000;
defparam \pll_inst|auto_generated|pll1 .CLKOUT4_DEL = 8'b00000000;
defparam \pll_inst|auto_generated|pll1 .CLKOUT0_PHASE = 3'b000;
defparam \pll_inst|auto_generated|pll1 .CLKOUT1_PHASE = 3'b000;
defparam \pll_inst|auto_generated|pll1 .CLKOUT2_PHASE = 3'b000;
defparam \pll_inst|auto_generated|pll1 .CLKOUT3_PHASE = 3'b000;
defparam \pll_inst|auto_generated|pll1 .CLKOUT4_PHASE = 3'b000;
defparam \pll_inst|auto_generated|pll1 .CLKFB_DEL = 8'b00000000;
defparam \pll_inst|auto_generated|pll1 .CLKFB_PHASE = 3'b000;
defparam \pll_inst|auto_generated|pll1 .FEEDBACK_MODE = 3'b100;
defparam \pll_inst|auto_generated|pll1 .FBDELAY_VAL = 3'b100;
defparam \pll_inst|auto_generated|pll1 .PLLOUTP_EN = 1'b0;
defparam \pll_inst|auto_generated|pll1 .PLLOUTN_EN = 1'b0;
defparam \pll_inst|auto_generated|pll1 .CLKOUT1_CASCADE = 1'b0;
defparam \pll_inst|auto_generated|pll1 .CLKOUT2_CASCADE = 1'b0;
defparam \pll_inst|auto_generated|pll1 .CLKOUT3_CASCADE = 1'b0;
defparam \pll_inst|auto_generated|pll1 .CLKOUT4_CASCADE = 1'b0;
defparam \pll_inst|auto_generated|pll1 .VCO_POST_DIV = 1'b1;
defparam \pll_inst|auto_generated|pll1 .REG_CTRL = 2'b00;
defparam \pll_inst|auto_generated|pll1 .CP = 3'b100;
defparam \pll_inst|auto_generated|pll1 .RREF = 2'b01;
defparam \pll_inst|auto_generated|pll1 .RVI = 2'b01;
defparam \pll_inst|auto_generated|pll1 .IVCO = 3'b010;
defparam \pll_inst|auto_generated|pll1 .PLL_EN_FLAG = 1'b1;

alta_slice \pll_inst|auto_generated|pll_lock_sync (
	.A(vcc),
	.B(vcc),
	.C(vcc),
	.D(vcc),
	.Cin(),
	.Qin(\pll_inst|auto_generated|pll_lock_sync~q ),
	.Clk(\auto_generated_inst.hbo_13_83378d4b1997463f_bp_X49_Y1_SIG_VCC ),
	.AsyncReset(\PLL_ENABLE~clkctrl_outclk__AsyncReset_X49_Y1_SIG ),
	.SyncReset(),
	.ShiftData(),
	.SyncLoad(),
	.LutOut(\pll_inst|auto_generated|pll_lock_sync~feeder_combout ),
	.Cout(),
	.Q(\pll_inst|auto_generated|pll_lock_sync~q ));
defparam \pll_inst|auto_generated|pll_lock_sync .coord_x = 20;
defparam \pll_inst|auto_generated|pll_lock_sync .coord_y = 5;
defparam \pll_inst|auto_generated|pll_lock_sync .coord_z = 0;
defparam \pll_inst|auto_generated|pll_lock_sync .mask = 16'hFFFF;
defparam \pll_inst|auto_generated|pll_lock_sync .modeMux = 1'b0;
defparam \pll_inst|auto_generated|pll_lock_sync .FeedbackMux = 1'b0;
defparam \pll_inst|auto_generated|pll_lock_sync .ShiftMux = 1'b0;
defparam \pll_inst|auto_generated|pll_lock_sync .BypassEn = 1'b0;
defparam \pll_inst|auto_generated|pll_lock_sync .CarryEnb = 1'b1;

alta_rio \ram_a[13]~output (
	.padio(ram_a[13]),
	.datain(\macro_inst|gbdram|ram_bank_id [0]),
	.oe(vcc),
	.outclk(gnd),
	.outclkena(vcc),
	.inclk(gnd),
	.inclkena(vcc),
	.areset(gnd),
	.sreset(gnd),
	.combout(),
	.regout());
defparam \ram_a[13]~output .coord_x = 0;
defparam \ram_a[13]~output .coord_y = 2;
defparam \ram_a[13]~output .coord_z = 1;
defparam \ram_a[13]~output .IN_ASYNC_MODE = 1'b0;
defparam \ram_a[13]~output .IN_SYNC_MODE = 1'b0;
defparam \ram_a[13]~output .IN_POWERUP = 1'b0;
defparam \ram_a[13]~output .OUT_REG_MODE = 1'b0;
defparam \ram_a[13]~output .OUT_ASYNC_MODE = 1'b0;
defparam \ram_a[13]~output .OUT_SYNC_MODE = 1'b0;
defparam \ram_a[13]~output .OUT_POWERUP = 1'b0;
defparam \ram_a[13]~output .OE_REG_MODE = 1'b0;
defparam \ram_a[13]~output .OE_ASYNC_MODE = 1'b0;
defparam \ram_a[13]~output .OE_SYNC_MODE = 1'b0;
defparam \ram_a[13]~output .OE_POWERUP = 1'b0;
defparam \ram_a[13]~output .CFG_TRI_INPUT = 1'b0;
defparam \ram_a[13]~output .CFG_INPUT_EN = 1'b0;
defparam \ram_a[13]~output .CFG_PULL_UP = 1'b0;
defparam \ram_a[13]~output .CFG_SLR = 1'b0;
defparam \ram_a[13]~output .CFG_OPEN_DRAIN = 1'b0;
defparam \ram_a[13]~output .CFG_PDRCTRL = 4'b0100;
defparam \ram_a[13]~output .CFG_KEEP = 2'b00;
defparam \ram_a[13]~output .CFG_LVDS_OUT_EN = 1'b0;
defparam \ram_a[13]~output .CFG_LVDS_SEL_CUA = 2'b00;
defparam \ram_a[13]~output .CFG_LVDS_IREF = 10'b0110000000;
defparam \ram_a[13]~output .CFG_LVDS_IN_EN = 1'b0;
defparam \ram_a[13]~output .DPCLK_DELAY = 4'b0000;
defparam \ram_a[13]~output .OUT_DELAY = 1'b0;
defparam \ram_a[13]~output .IN_DATA_DELAY = 3'b000;
defparam \ram_a[13]~output .IN_REG_DELAY = 3'b000;

alta_rio \ram_a[14]~output (
	.padio(ram_a[14]),
	.datain(\macro_inst|gbdram|ram_bank_id [1]),
	.oe(vcc),
	.outclk(gnd),
	.outclkena(vcc),
	.inclk(gnd),
	.inclkena(vcc),
	.areset(gnd),
	.sreset(gnd),
	.combout(),
	.regout());
defparam \ram_a[14]~output .coord_x = 0;
defparam \ram_a[14]~output .coord_y = 3;
defparam \ram_a[14]~output .coord_z = 2;
defparam \ram_a[14]~output .IN_ASYNC_MODE = 1'b0;
defparam \ram_a[14]~output .IN_SYNC_MODE = 1'b0;
defparam \ram_a[14]~output .IN_POWERUP = 1'b0;
defparam \ram_a[14]~output .OUT_REG_MODE = 1'b0;
defparam \ram_a[14]~output .OUT_ASYNC_MODE = 1'b0;
defparam \ram_a[14]~output .OUT_SYNC_MODE = 1'b0;
defparam \ram_a[14]~output .OUT_POWERUP = 1'b0;
defparam \ram_a[14]~output .OE_REG_MODE = 1'b0;
defparam \ram_a[14]~output .OE_ASYNC_MODE = 1'b0;
defparam \ram_a[14]~output .OE_SYNC_MODE = 1'b0;
defparam \ram_a[14]~output .OE_POWERUP = 1'b0;
defparam \ram_a[14]~output .CFG_TRI_INPUT = 1'b0;
defparam \ram_a[14]~output .CFG_INPUT_EN = 1'b0;
defparam \ram_a[14]~output .CFG_PULL_UP = 1'b0;
defparam \ram_a[14]~output .CFG_SLR = 1'b0;
defparam \ram_a[14]~output .CFG_OPEN_DRAIN = 1'b0;
defparam \ram_a[14]~output .CFG_PDRCTRL = 4'b0100;
defparam \ram_a[14]~output .CFG_KEEP = 2'b00;
defparam \ram_a[14]~output .CFG_LVDS_OUT_EN = 1'b0;
defparam \ram_a[14]~output .CFG_LVDS_SEL_CUA = 2'b00;
defparam \ram_a[14]~output .CFG_LVDS_IREF = 10'b0110000000;
defparam \ram_a[14]~output .CFG_LVDS_IN_EN = 1'b0;
defparam \ram_a[14]~output .DPCLK_DELAY = 4'b0000;
defparam \ram_a[14]~output .OUT_DELAY = 1'b0;
defparam \ram_a[14]~output .IN_DATA_DELAY = 3'b000;
defparam \ram_a[14]~output .IN_REG_DELAY = 3'b000;

alta_rio \ram_a[15]~output (
	.padio(ram_a[15]),
	.datain(\macro_inst|gbdram|ram_bank_id [2]),
	.oe(vcc),
	.outclk(gnd),
	.outclkena(vcc),
	.inclk(gnd),
	.inclkena(vcc),
	.areset(gnd),
	.sreset(gnd),
	.combout(),
	.regout());
defparam \ram_a[15]~output .coord_x = 0;
defparam \ram_a[15]~output .coord_y = 3;
defparam \ram_a[15]~output .coord_z = 4;
defparam \ram_a[15]~output .IN_ASYNC_MODE = 1'b0;
defparam \ram_a[15]~output .IN_SYNC_MODE = 1'b0;
defparam \ram_a[15]~output .IN_POWERUP = 1'b0;
defparam \ram_a[15]~output .OUT_REG_MODE = 1'b0;
defparam \ram_a[15]~output .OUT_ASYNC_MODE = 1'b0;
defparam \ram_a[15]~output .OUT_SYNC_MODE = 1'b0;
defparam \ram_a[15]~output .OUT_POWERUP = 1'b0;
defparam \ram_a[15]~output .OE_REG_MODE = 1'b0;
defparam \ram_a[15]~output .OE_ASYNC_MODE = 1'b0;
defparam \ram_a[15]~output .OE_SYNC_MODE = 1'b0;
defparam \ram_a[15]~output .OE_POWERUP = 1'b0;
defparam \ram_a[15]~output .CFG_TRI_INPUT = 1'b0;
defparam \ram_a[15]~output .CFG_INPUT_EN = 1'b0;
defparam \ram_a[15]~output .CFG_PULL_UP = 1'b0;
defparam \ram_a[15]~output .CFG_SLR = 1'b0;
defparam \ram_a[15]~output .CFG_OPEN_DRAIN = 1'b0;
defparam \ram_a[15]~output .CFG_PDRCTRL = 4'b0100;
defparam \ram_a[15]~output .CFG_KEEP = 2'b00;
defparam \ram_a[15]~output .CFG_LVDS_OUT_EN = 1'b0;
defparam \ram_a[15]~output .CFG_LVDS_SEL_CUA = 2'b00;
defparam \ram_a[15]~output .CFG_LVDS_IREF = 10'b0110000000;
defparam \ram_a[15]~output .CFG_LVDS_IN_EN = 1'b0;
defparam \ram_a[15]~output .DPCLK_DELAY = 4'b0000;
defparam \ram_a[15]~output .OUT_DELAY = 1'b0;
defparam \ram_a[15]~output .IN_DATA_DELAY = 3'b000;
defparam \ram_a[15]~output .IN_REG_DELAY = 3'b000;

alta_rio \ram_a[16]~output (
	.padio(ram_a[16]),
	.datain(\macro_inst|gbdram|ram_bank_id [3]),
	.oe(vcc),
	.outclk(gnd),
	.outclkena(vcc),
	.inclk(gnd),
	.inclkena(vcc),
	.areset(gnd),
	.sreset(gnd),
	.combout(),
	.regout());
defparam \ram_a[16]~output .coord_x = 0;
defparam \ram_a[16]~output .coord_y = 3;
defparam \ram_a[16]~output .coord_z = 3;
defparam \ram_a[16]~output .IN_ASYNC_MODE = 1'b0;
defparam \ram_a[16]~output .IN_SYNC_MODE = 1'b0;
defparam \ram_a[16]~output .IN_POWERUP = 1'b0;
defparam \ram_a[16]~output .OUT_REG_MODE = 1'b0;
defparam \ram_a[16]~output .OUT_ASYNC_MODE = 1'b0;
defparam \ram_a[16]~output .OUT_SYNC_MODE = 1'b0;
defparam \ram_a[16]~output .OUT_POWERUP = 1'b0;
defparam \ram_a[16]~output .OE_REG_MODE = 1'b0;
defparam \ram_a[16]~output .OE_ASYNC_MODE = 1'b0;
defparam \ram_a[16]~output .OE_SYNC_MODE = 1'b0;
defparam \ram_a[16]~output .OE_POWERUP = 1'b0;
defparam \ram_a[16]~output .CFG_TRI_INPUT = 1'b0;
defparam \ram_a[16]~output .CFG_INPUT_EN = 1'b0;
defparam \ram_a[16]~output .CFG_PULL_UP = 1'b0;
defparam \ram_a[16]~output .CFG_SLR = 1'b0;
defparam \ram_a[16]~output .CFG_OPEN_DRAIN = 1'b0;
defparam \ram_a[16]~output .CFG_PDRCTRL = 4'b0100;
defparam \ram_a[16]~output .CFG_KEEP = 2'b00;
defparam \ram_a[16]~output .CFG_LVDS_OUT_EN = 1'b0;
defparam \ram_a[16]~output .CFG_LVDS_SEL_CUA = 2'b00;
defparam \ram_a[16]~output .CFG_LVDS_IREF = 10'b0110000000;
defparam \ram_a[16]~output .CFG_LVDS_IN_EN = 1'b0;
defparam \ram_a[16]~output .DPCLK_DELAY = 4'b0000;
defparam \ram_a[16]~output .OUT_DELAY = 1'b0;
defparam \ram_a[16]~output .IN_DATA_DELAY = 3'b000;
defparam \ram_a[16]~output .IN_REG_DELAY = 3'b000;

alta_rio \ram_ce2~output (
	.padio(ram_ce2),
	.datain(vcc),
	.oe(vcc),
	.outclk(gnd),
	.outclkena(vcc),
	.inclk(gnd),
	.inclkena(vcc),
	.areset(gnd),
	.sreset(gnd),
	.combout(),
	.regout());
defparam \ram_ce2~output .coord_x = 0;
defparam \ram_ce2~output .coord_y = 2;
defparam \ram_ce2~output .coord_z = 0;
defparam \ram_ce2~output .IN_ASYNC_MODE = 1'b0;
defparam \ram_ce2~output .IN_SYNC_MODE = 1'b0;
defparam \ram_ce2~output .IN_POWERUP = 1'b0;
defparam \ram_ce2~output .OUT_REG_MODE = 1'b0;
defparam \ram_ce2~output .OUT_ASYNC_MODE = 1'b0;
defparam \ram_ce2~output .OUT_SYNC_MODE = 1'b0;
defparam \ram_ce2~output .OUT_POWERUP = 1'b0;
defparam \ram_ce2~output .OE_REG_MODE = 1'b0;
defparam \ram_ce2~output .OE_ASYNC_MODE = 1'b0;
defparam \ram_ce2~output .OE_SYNC_MODE = 1'b0;
defparam \ram_ce2~output .OE_POWERUP = 1'b0;
defparam \ram_ce2~output .CFG_TRI_INPUT = 1'b0;
defparam \ram_ce2~output .CFG_INPUT_EN = 1'b0;
defparam \ram_ce2~output .CFG_PULL_UP = 1'b0;
defparam \ram_ce2~output .CFG_SLR = 1'b0;
defparam \ram_ce2~output .CFG_OPEN_DRAIN = 1'b0;
defparam \ram_ce2~output .CFG_PDRCTRL = 4'b0100;
defparam \ram_ce2~output .CFG_KEEP = 2'b00;
defparam \ram_ce2~output .CFG_LVDS_OUT_EN = 1'b0;
defparam \ram_ce2~output .CFG_LVDS_SEL_CUA = 2'b00;
defparam \ram_ce2~output .CFG_LVDS_IREF = 10'b0110000000;
defparam \ram_ce2~output .CFG_LVDS_IN_EN = 1'b0;
defparam \ram_ce2~output .DPCLK_DELAY = 4'b0000;
defparam \ram_ce2~output .OUT_DELAY = 1'b0;
defparam \ram_ce2~output .IN_DATA_DELAY = 3'b000;
defparam \ram_ce2~output .IN_REG_DELAY = 3'b000;

alta_rio \ram_nCS~output (
	.padio(ram_nCS),
	.datain(\macro_inst|gbdram|Ram_nCS~0_combout ),
	.oe(vcc),
	.outclk(gnd),
	.outclkena(vcc),
	.inclk(gnd),
	.inclkena(vcc),
	.areset(gnd),
	.sreset(gnd),
	.combout(),
	.regout());
defparam \ram_nCS~output .coord_x = 16;
defparam \ram_nCS~output .coord_y = 13;
defparam \ram_nCS~output .coord_z = 3;
defparam \ram_nCS~output .IN_ASYNC_MODE = 1'b0;
defparam \ram_nCS~output .IN_SYNC_MODE = 1'b0;
defparam \ram_nCS~output .IN_POWERUP = 1'b0;
defparam \ram_nCS~output .OUT_REG_MODE = 1'b0;
defparam \ram_nCS~output .OUT_ASYNC_MODE = 1'b0;
defparam \ram_nCS~output .OUT_SYNC_MODE = 1'b0;
defparam \ram_nCS~output .OUT_POWERUP = 1'b0;
defparam \ram_nCS~output .OE_REG_MODE = 1'b0;
defparam \ram_nCS~output .OE_ASYNC_MODE = 1'b0;
defparam \ram_nCS~output .OE_SYNC_MODE = 1'b0;
defparam \ram_nCS~output .OE_POWERUP = 1'b0;
defparam \ram_nCS~output .CFG_TRI_INPUT = 1'b0;
defparam \ram_nCS~output .CFG_INPUT_EN = 1'b0;
defparam \ram_nCS~output .CFG_PULL_UP = 1'b0;
defparam \ram_nCS~output .CFG_SLR = 1'b0;
defparam \ram_nCS~output .CFG_OPEN_DRAIN = 1'b0;
defparam \ram_nCS~output .CFG_PDRCTRL = 4'b0100;
defparam \ram_nCS~output .CFG_KEEP = 2'b00;
defparam \ram_nCS~output .CFG_LVDS_OUT_EN = 1'b0;
defparam \ram_nCS~output .CFG_LVDS_SEL_CUA = 2'b00;
defparam \ram_nCS~output .CFG_LVDS_IREF = 10'b0110000000;
defparam \ram_nCS~output .CFG_LVDS_IN_EN = 1'b0;
defparam \ram_nCS~output .DPCLK_DELAY = 4'b0000;
defparam \ram_nCS~output .OUT_DELAY = 1'b0;
defparam \ram_nCS~output .IN_DATA_DELAY = 3'b000;
defparam \ram_nCS~output .IN_REG_DELAY = 3'b000;

alta_rio \ram_nWE~output (
	.padio(ram_nWE),
	.datain(\macro_inst|gbdram|Ram_nWE~0_combout ),
	.oe(vcc),
	.outclk(gnd),
	.outclkena(vcc),
	.inclk(gnd),
	.inclkena(vcc),
	.areset(gnd),
	.sreset(gnd),
	.combout(),
	.regout());
defparam \ram_nWE~output .coord_x = 0;
defparam \ram_nWE~output .coord_y = 4;
defparam \ram_nWE~output .coord_z = 3;
defparam \ram_nWE~output .IN_ASYNC_MODE = 1'b0;
defparam \ram_nWE~output .IN_SYNC_MODE = 1'b0;
defparam \ram_nWE~output .IN_POWERUP = 1'b0;
defparam \ram_nWE~output .OUT_REG_MODE = 1'b0;
defparam \ram_nWE~output .OUT_ASYNC_MODE = 1'b0;
defparam \ram_nWE~output .OUT_SYNC_MODE = 1'b0;
defparam \ram_nWE~output .OUT_POWERUP = 1'b0;
defparam \ram_nWE~output .OE_REG_MODE = 1'b0;
defparam \ram_nWE~output .OE_ASYNC_MODE = 1'b0;
defparam \ram_nWE~output .OE_SYNC_MODE = 1'b0;
defparam \ram_nWE~output .OE_POWERUP = 1'b0;
defparam \ram_nWE~output .CFG_TRI_INPUT = 1'b0;
defparam \ram_nWE~output .CFG_INPUT_EN = 1'b0;
defparam \ram_nWE~output .CFG_PULL_UP = 1'b0;
defparam \ram_nWE~output .CFG_SLR = 1'b0;
defparam \ram_nWE~output .CFG_OPEN_DRAIN = 1'b0;
defparam \ram_nWE~output .CFG_PDRCTRL = 4'b0100;
defparam \ram_nWE~output .CFG_KEEP = 2'b00;
defparam \ram_nWE~output .CFG_LVDS_OUT_EN = 1'b0;
defparam \ram_nWE~output .CFG_LVDS_SEL_CUA = 2'b00;
defparam \ram_nWE~output .CFG_LVDS_IREF = 10'b0110000000;
defparam \ram_nWE~output .CFG_LVDS_IN_EN = 1'b0;
defparam \ram_nWE~output .DPCLK_DELAY = 4'b0000;
defparam \ram_nWE~output .OUT_DELAY = 1'b0;
defparam \ram_nWE~output .IN_DATA_DELAY = 3'b000;
defparam \ram_nWE~output .IN_REG_DELAY = 3'b000;

alta_rio \rom_a[14]~output (
	.padio(rom_a[14]),
	.datain(\macro_inst|gbdrom|Rom_a[14]~0_combout ),
	.oe(vcc),
	.outclk(gnd),
	.outclkena(vcc),
	.inclk(gnd),
	.inclkena(vcc),
	.areset(gnd),
	.sreset(gnd),
	.combout(),
	.regout());
defparam \rom_a[14]~output .coord_x = 22;
defparam \rom_a[14]~output .coord_y = 3;
defparam \rom_a[14]~output .coord_z = 2;
defparam \rom_a[14]~output .IN_ASYNC_MODE = 1'b0;
defparam \rom_a[14]~output .IN_SYNC_MODE = 1'b0;
defparam \rom_a[14]~output .IN_POWERUP = 1'b0;
defparam \rom_a[14]~output .OUT_REG_MODE = 1'b0;
defparam \rom_a[14]~output .OUT_ASYNC_MODE = 1'b0;
defparam \rom_a[14]~output .OUT_SYNC_MODE = 1'b0;
defparam \rom_a[14]~output .OUT_POWERUP = 1'b0;
defparam \rom_a[14]~output .OE_REG_MODE = 1'b0;
defparam \rom_a[14]~output .OE_ASYNC_MODE = 1'b0;
defparam \rom_a[14]~output .OE_SYNC_MODE = 1'b0;
defparam \rom_a[14]~output .OE_POWERUP = 1'b0;
defparam \rom_a[14]~output .CFG_TRI_INPUT = 1'b0;
defparam \rom_a[14]~output .CFG_INPUT_EN = 1'b0;
defparam \rom_a[14]~output .CFG_PULL_UP = 1'b0;
defparam \rom_a[14]~output .CFG_SLR = 1'b0;
defparam \rom_a[14]~output .CFG_OPEN_DRAIN = 1'b0;
defparam \rom_a[14]~output .CFG_PDRCTRL = 4'b0100;
defparam \rom_a[14]~output .CFG_KEEP = 2'b00;
defparam \rom_a[14]~output .CFG_LVDS_OUT_EN = 1'b0;
defparam \rom_a[14]~output .CFG_LVDS_SEL_CUA = 2'b00;
defparam \rom_a[14]~output .CFG_LVDS_IREF = 10'b0110000000;
defparam \rom_a[14]~output .CFG_LVDS_IN_EN = 1'b0;
defparam \rom_a[14]~output .DPCLK_DELAY = 4'b0000;
defparam \rom_a[14]~output .OUT_DELAY = 1'b0;
defparam \rom_a[14]~output .IN_DATA_DELAY = 3'b000;
defparam \rom_a[14]~output .IN_REG_DELAY = 3'b000;

alta_rio \rom_a[15]~output (
	.padio(rom_a[15]),
	.datain(\macro_inst|gbdrom|Rom_a[15]~1_combout ),
	.oe(vcc),
	.outclk(gnd),
	.outclkena(vcc),
	.inclk(gnd),
	.inclkena(vcc),
	.areset(gnd),
	.sreset(gnd),
	.combout(),
	.regout());
defparam \rom_a[15]~output .coord_x = 22;
defparam \rom_a[15]~output .coord_y = 3;
defparam \rom_a[15]~output .coord_z = 1;
defparam \rom_a[15]~output .IN_ASYNC_MODE = 1'b0;
defparam \rom_a[15]~output .IN_SYNC_MODE = 1'b0;
defparam \rom_a[15]~output .IN_POWERUP = 1'b0;
defparam \rom_a[15]~output .OUT_REG_MODE = 1'b0;
defparam \rom_a[15]~output .OUT_ASYNC_MODE = 1'b0;
defparam \rom_a[15]~output .OUT_SYNC_MODE = 1'b0;
defparam \rom_a[15]~output .OUT_POWERUP = 1'b0;
defparam \rom_a[15]~output .OE_REG_MODE = 1'b0;
defparam \rom_a[15]~output .OE_ASYNC_MODE = 1'b0;
defparam \rom_a[15]~output .OE_SYNC_MODE = 1'b0;
defparam \rom_a[15]~output .OE_POWERUP = 1'b0;
defparam \rom_a[15]~output .CFG_TRI_INPUT = 1'b0;
defparam \rom_a[15]~output .CFG_INPUT_EN = 1'b0;
defparam \rom_a[15]~output .CFG_PULL_UP = 1'b0;
defparam \rom_a[15]~output .CFG_SLR = 1'b0;
defparam \rom_a[15]~output .CFG_OPEN_DRAIN = 1'b0;
defparam \rom_a[15]~output .CFG_PDRCTRL = 4'b0100;
defparam \rom_a[15]~output .CFG_KEEP = 2'b00;
defparam \rom_a[15]~output .CFG_LVDS_OUT_EN = 1'b0;
defparam \rom_a[15]~output .CFG_LVDS_SEL_CUA = 2'b00;
defparam \rom_a[15]~output .CFG_LVDS_IREF = 10'b0110000000;
defparam \rom_a[15]~output .CFG_LVDS_IN_EN = 1'b0;
defparam \rom_a[15]~output .DPCLK_DELAY = 4'b0000;
defparam \rom_a[15]~output .OUT_DELAY = 1'b0;
defparam \rom_a[15]~output .IN_DATA_DELAY = 3'b000;
defparam \rom_a[15]~output .IN_REG_DELAY = 3'b000;

alta_rio \rom_a[16]~output (
	.padio(rom_a[16]),
	.datain(\macro_inst|gbdrom|Rom_a[16]~2_combout ),
	.oe(vcc),
	.outclk(gnd),
	.outclkena(vcc),
	.inclk(gnd),
	.inclkena(vcc),
	.areset(gnd),
	.sreset(gnd),
	.combout(),
	.regout());
defparam \rom_a[16]~output .coord_x = 22;
defparam \rom_a[16]~output .coord_y = 3;
defparam \rom_a[16]~output .coord_z = 0;
defparam \rom_a[16]~output .IN_ASYNC_MODE = 1'b0;
defparam \rom_a[16]~output .IN_SYNC_MODE = 1'b0;
defparam \rom_a[16]~output .IN_POWERUP = 1'b0;
defparam \rom_a[16]~output .OUT_REG_MODE = 1'b0;
defparam \rom_a[16]~output .OUT_ASYNC_MODE = 1'b0;
defparam \rom_a[16]~output .OUT_SYNC_MODE = 1'b0;
defparam \rom_a[16]~output .OUT_POWERUP = 1'b0;
defparam \rom_a[16]~output .OE_REG_MODE = 1'b0;
defparam \rom_a[16]~output .OE_ASYNC_MODE = 1'b0;
defparam \rom_a[16]~output .OE_SYNC_MODE = 1'b0;
defparam \rom_a[16]~output .OE_POWERUP = 1'b0;
defparam \rom_a[16]~output .CFG_TRI_INPUT = 1'b0;
defparam \rom_a[16]~output .CFG_INPUT_EN = 1'b0;
defparam \rom_a[16]~output .CFG_PULL_UP = 1'b0;
defparam \rom_a[16]~output .CFG_SLR = 1'b0;
defparam \rom_a[16]~output .CFG_OPEN_DRAIN = 1'b0;
defparam \rom_a[16]~output .CFG_PDRCTRL = 4'b0100;
defparam \rom_a[16]~output .CFG_KEEP = 2'b00;
defparam \rom_a[16]~output .CFG_LVDS_OUT_EN = 1'b0;
defparam \rom_a[16]~output .CFG_LVDS_SEL_CUA = 2'b00;
defparam \rom_a[16]~output .CFG_LVDS_IREF = 10'b0110000000;
defparam \rom_a[16]~output .CFG_LVDS_IN_EN = 1'b0;
defparam \rom_a[16]~output .DPCLK_DELAY = 4'b0000;
defparam \rom_a[16]~output .OUT_DELAY = 1'b0;
defparam \rom_a[16]~output .IN_DATA_DELAY = 3'b000;
defparam \rom_a[16]~output .IN_REG_DELAY = 3'b000;

alta_rio \rom_a[17]~output (
	.padio(rom_a[17]),
	.datain(\macro_inst|gbdrom|Rom_a[17]~3_combout ),
	.oe(vcc),
	.outclk(gnd),
	.outclkena(vcc),
	.inclk(gnd),
	.inclkena(vcc),
	.areset(gnd),
	.sreset(gnd),
	.combout(),
	.regout());
defparam \rom_a[17]~output .coord_x = 19;
defparam \rom_a[17]~output .coord_y = 13;
defparam \rom_a[17]~output .coord_z = 3;
defparam \rom_a[17]~output .IN_ASYNC_MODE = 1'b0;
defparam \rom_a[17]~output .IN_SYNC_MODE = 1'b0;
defparam \rom_a[17]~output .IN_POWERUP = 1'b0;
defparam \rom_a[17]~output .OUT_REG_MODE = 1'b0;
defparam \rom_a[17]~output .OUT_ASYNC_MODE = 1'b0;
defparam \rom_a[17]~output .OUT_SYNC_MODE = 1'b0;
defparam \rom_a[17]~output .OUT_POWERUP = 1'b0;
defparam \rom_a[17]~output .OE_REG_MODE = 1'b0;
defparam \rom_a[17]~output .OE_ASYNC_MODE = 1'b0;
defparam \rom_a[17]~output .OE_SYNC_MODE = 1'b0;
defparam \rom_a[17]~output .OE_POWERUP = 1'b0;
defparam \rom_a[17]~output .CFG_TRI_INPUT = 1'b0;
defparam \rom_a[17]~output .CFG_INPUT_EN = 1'b0;
defparam \rom_a[17]~output .CFG_PULL_UP = 1'b0;
defparam \rom_a[17]~output .CFG_SLR = 1'b0;
defparam \rom_a[17]~output .CFG_OPEN_DRAIN = 1'b0;
defparam \rom_a[17]~output .CFG_PDRCTRL = 4'b0100;
defparam \rom_a[17]~output .CFG_KEEP = 2'b00;
defparam \rom_a[17]~output .CFG_LVDS_OUT_EN = 1'b0;
defparam \rom_a[17]~output .CFG_LVDS_SEL_CUA = 2'b00;
defparam \rom_a[17]~output .CFG_LVDS_IREF = 10'b0110000000;
defparam \rom_a[17]~output .CFG_LVDS_IN_EN = 1'b0;
defparam \rom_a[17]~output .DPCLK_DELAY = 4'b0000;
defparam \rom_a[17]~output .OUT_DELAY = 1'b0;
defparam \rom_a[17]~output .IN_DATA_DELAY = 3'b000;
defparam \rom_a[17]~output .IN_REG_DELAY = 3'b000;

alta_rio \rom_a[18]~output (
	.padio(rom_a[18]),
	.datain(\macro_inst|gbdrom|Rom_a[18]~4_combout ),
	.oe(vcc),
	.outclk(gnd),
	.outclkena(vcc),
	.inclk(gnd),
	.inclkena(vcc),
	.areset(gnd),
	.sreset(gnd),
	.combout(),
	.regout());
defparam \rom_a[18]~output .coord_x = 19;
defparam \rom_a[18]~output .coord_y = 0;
defparam \rom_a[18]~output .coord_z = 1;
defparam \rom_a[18]~output .IN_ASYNC_MODE = 1'b0;
defparam \rom_a[18]~output .IN_SYNC_MODE = 1'b0;
defparam \rom_a[18]~output .IN_POWERUP = 1'b0;
defparam \rom_a[18]~output .OUT_REG_MODE = 1'b0;
defparam \rom_a[18]~output .OUT_ASYNC_MODE = 1'b0;
defparam \rom_a[18]~output .OUT_SYNC_MODE = 1'b0;
defparam \rom_a[18]~output .OUT_POWERUP = 1'b0;
defparam \rom_a[18]~output .OE_REG_MODE = 1'b0;
defparam \rom_a[18]~output .OE_ASYNC_MODE = 1'b0;
defparam \rom_a[18]~output .OE_SYNC_MODE = 1'b0;
defparam \rom_a[18]~output .OE_POWERUP = 1'b0;
defparam \rom_a[18]~output .CFG_TRI_INPUT = 1'b0;
defparam \rom_a[18]~output .CFG_INPUT_EN = 1'b0;
defparam \rom_a[18]~output .CFG_PULL_UP = 1'b0;
defparam \rom_a[18]~output .CFG_SLR = 1'b0;
defparam \rom_a[18]~output .CFG_OPEN_DRAIN = 1'b0;
defparam \rom_a[18]~output .CFG_PDRCTRL = 4'b0100;
defparam \rom_a[18]~output .CFG_KEEP = 2'b00;
defparam \rom_a[18]~output .CFG_LVDS_OUT_EN = 1'b0;
defparam \rom_a[18]~output .CFG_LVDS_SEL_CUA = 2'b00;
defparam \rom_a[18]~output .CFG_LVDS_IREF = 10'b0110000000;
defparam \rom_a[18]~output .CFG_LVDS_IN_EN = 1'b0;
defparam \rom_a[18]~output .DPCLK_DELAY = 4'b0000;
defparam \rom_a[18]~output .OUT_DELAY = 1'b0;
defparam \rom_a[18]~output .IN_DATA_DELAY = 3'b000;
defparam \rom_a[18]~output .IN_REG_DELAY = 3'b000;

alta_rio \rom_a[19]~output (
	.padio(rom_a[19]),
	.datain(\macro_inst|gbdrom|Rom_a[19]~5_combout ),
	.oe(vcc),
	.outclk(gnd),
	.outclkena(vcc),
	.inclk(gnd),
	.inclkena(vcc),
	.areset(gnd),
	.sreset(gnd),
	.combout(),
	.regout());
defparam \rom_a[19]~output .coord_x = 19;
defparam \rom_a[19]~output .coord_y = 0;
defparam \rom_a[19]~output .coord_z = 3;
defparam \rom_a[19]~output .IN_ASYNC_MODE = 1'b0;
defparam \rom_a[19]~output .IN_SYNC_MODE = 1'b0;
defparam \rom_a[19]~output .IN_POWERUP = 1'b0;
defparam \rom_a[19]~output .OUT_REG_MODE = 1'b0;
defparam \rom_a[19]~output .OUT_ASYNC_MODE = 1'b0;
defparam \rom_a[19]~output .OUT_SYNC_MODE = 1'b0;
defparam \rom_a[19]~output .OUT_POWERUP = 1'b0;
defparam \rom_a[19]~output .OE_REG_MODE = 1'b0;
defparam \rom_a[19]~output .OE_ASYNC_MODE = 1'b0;
defparam \rom_a[19]~output .OE_SYNC_MODE = 1'b0;
defparam \rom_a[19]~output .OE_POWERUP = 1'b0;
defparam \rom_a[19]~output .CFG_TRI_INPUT = 1'b0;
defparam \rom_a[19]~output .CFG_INPUT_EN = 1'b0;
defparam \rom_a[19]~output .CFG_PULL_UP = 1'b0;
defparam \rom_a[19]~output .CFG_SLR = 1'b0;
defparam \rom_a[19]~output .CFG_OPEN_DRAIN = 1'b0;
defparam \rom_a[19]~output .CFG_PDRCTRL = 4'b0100;
defparam \rom_a[19]~output .CFG_KEEP = 2'b00;
defparam \rom_a[19]~output .CFG_LVDS_OUT_EN = 1'b0;
defparam \rom_a[19]~output .CFG_LVDS_SEL_CUA = 2'b00;
defparam \rom_a[19]~output .CFG_LVDS_IREF = 10'b0110000000;
defparam \rom_a[19]~output .CFG_LVDS_IN_EN = 1'b0;
defparam \rom_a[19]~output .DPCLK_DELAY = 4'b0000;
defparam \rom_a[19]~output .OUT_DELAY = 1'b0;
defparam \rom_a[19]~output .IN_DATA_DELAY = 3'b000;
defparam \rom_a[19]~output .IN_REG_DELAY = 3'b000;

alta_rio \rom_a[20]~output (
	.padio(rom_a[20]),
	.datain(gnd),
	.oe(vcc),
	.outclk(gnd),
	.outclkena(vcc),
	.inclk(gnd),
	.inclkena(vcc),
	.areset(gnd),
	.sreset(gnd),
	.combout(),
	.regout());
defparam \rom_a[20]~output .coord_x = 22;
defparam \rom_a[20]~output .coord_y = 1;
defparam \rom_a[20]~output .coord_z = 3;
defparam \rom_a[20]~output .IN_ASYNC_MODE = 1'b0;
defparam \rom_a[20]~output .IN_SYNC_MODE = 1'b0;
defparam \rom_a[20]~output .IN_POWERUP = 1'b0;
defparam \rom_a[20]~output .OUT_REG_MODE = 1'b0;
defparam \rom_a[20]~output .OUT_ASYNC_MODE = 1'b0;
defparam \rom_a[20]~output .OUT_SYNC_MODE = 1'b0;
defparam \rom_a[20]~output .OUT_POWERUP = 1'b0;
defparam \rom_a[20]~output .OE_REG_MODE = 1'b0;
defparam \rom_a[20]~output .OE_ASYNC_MODE = 1'b0;
defparam \rom_a[20]~output .OE_SYNC_MODE = 1'b0;
defparam \rom_a[20]~output .OE_POWERUP = 1'b0;
defparam \rom_a[20]~output .CFG_TRI_INPUT = 1'b0;
defparam \rom_a[20]~output .CFG_INPUT_EN = 1'b0;
defparam \rom_a[20]~output .CFG_PULL_UP = 1'b0;
defparam \rom_a[20]~output .CFG_SLR = 1'b0;
defparam \rom_a[20]~output .CFG_OPEN_DRAIN = 1'b0;
defparam \rom_a[20]~output .CFG_PDRCTRL = 4'b0100;
defparam \rom_a[20]~output .CFG_KEEP = 2'b00;
defparam \rom_a[20]~output .CFG_LVDS_OUT_EN = 1'b0;
defparam \rom_a[20]~output .CFG_LVDS_SEL_CUA = 2'b00;
defparam \rom_a[20]~output .CFG_LVDS_IREF = 10'b0110000000;
defparam \rom_a[20]~output .CFG_LVDS_IN_EN = 1'b0;
defparam \rom_a[20]~output .DPCLK_DELAY = 4'b0000;
defparam \rom_a[20]~output .OUT_DELAY = 1'b0;
defparam \rom_a[20]~output .IN_DATA_DELAY = 3'b000;
defparam \rom_a[20]~output .IN_REG_DELAY = 3'b000;

alta_rio \rom_a[21]~output (
	.padio(rom_a[21]),
	.datain(gnd),
	.oe(vcc),
	.outclk(gnd),
	.outclkena(vcc),
	.inclk(gnd),
	.inclkena(vcc),
	.areset(gnd),
	.sreset(gnd),
	.combout(),
	.regout());
defparam \rom_a[21]~output .coord_x = 20;
defparam \rom_a[21]~output .coord_y = 0;
defparam \rom_a[21]~output .coord_z = 2;
defparam \rom_a[21]~output .IN_ASYNC_MODE = 1'b0;
defparam \rom_a[21]~output .IN_SYNC_MODE = 1'b0;
defparam \rom_a[21]~output .IN_POWERUP = 1'b0;
defparam \rom_a[21]~output .OUT_REG_MODE = 1'b0;
defparam \rom_a[21]~output .OUT_ASYNC_MODE = 1'b0;
defparam \rom_a[21]~output .OUT_SYNC_MODE = 1'b0;
defparam \rom_a[21]~output .OUT_POWERUP = 1'b0;
defparam \rom_a[21]~output .OE_REG_MODE = 1'b0;
defparam \rom_a[21]~output .OE_ASYNC_MODE = 1'b0;
defparam \rom_a[21]~output .OE_SYNC_MODE = 1'b0;
defparam \rom_a[21]~output .OE_POWERUP = 1'b0;
defparam \rom_a[21]~output .CFG_TRI_INPUT = 1'b0;
defparam \rom_a[21]~output .CFG_INPUT_EN = 1'b0;
defparam \rom_a[21]~output .CFG_PULL_UP = 1'b0;
defparam \rom_a[21]~output .CFG_SLR = 1'b0;
defparam \rom_a[21]~output .CFG_OPEN_DRAIN = 1'b0;
defparam \rom_a[21]~output .CFG_PDRCTRL = 4'b0100;
defparam \rom_a[21]~output .CFG_KEEP = 2'b00;
defparam \rom_a[21]~output .CFG_LVDS_OUT_EN = 1'b0;
defparam \rom_a[21]~output .CFG_LVDS_SEL_CUA = 2'b00;
defparam \rom_a[21]~output .CFG_LVDS_IREF = 10'b0110000000;
defparam \rom_a[21]~output .CFG_LVDS_IN_EN = 1'b0;
defparam \rom_a[21]~output .DPCLK_DELAY = 4'b0000;
defparam \rom_a[21]~output .OUT_DELAY = 1'b0;
defparam \rom_a[21]~output .IN_DATA_DELAY = 3'b000;
defparam \rom_a[21]~output .IN_REG_DELAY = 3'b000;

alta_rio \rom_a[22]~output (
	.padio(rom_a[22]),
	.datain(gnd),
	.oe(vcc),
	.outclk(gnd),
	.outclkena(vcc),
	.inclk(gnd),
	.inclkena(vcc),
	.areset(gnd),
	.sreset(gnd),
	.combout(),
	.regout());
defparam \rom_a[22]~output .coord_x = 20;
defparam \rom_a[22]~output .coord_y = 0;
defparam \rom_a[22]~output .coord_z = 0;
defparam \rom_a[22]~output .IN_ASYNC_MODE = 1'b0;
defparam \rom_a[22]~output .IN_SYNC_MODE = 1'b0;
defparam \rom_a[22]~output .IN_POWERUP = 1'b0;
defparam \rom_a[22]~output .OUT_REG_MODE = 1'b0;
defparam \rom_a[22]~output .OUT_ASYNC_MODE = 1'b0;
defparam \rom_a[22]~output .OUT_SYNC_MODE = 1'b0;
defparam \rom_a[22]~output .OUT_POWERUP = 1'b0;
defparam \rom_a[22]~output .OE_REG_MODE = 1'b0;
defparam \rom_a[22]~output .OE_ASYNC_MODE = 1'b0;
defparam \rom_a[22]~output .OE_SYNC_MODE = 1'b0;
defparam \rom_a[22]~output .OE_POWERUP = 1'b0;
defparam \rom_a[22]~output .CFG_TRI_INPUT = 1'b0;
defparam \rom_a[22]~output .CFG_INPUT_EN = 1'b0;
defparam \rom_a[22]~output .CFG_PULL_UP = 1'b0;
defparam \rom_a[22]~output .CFG_SLR = 1'b0;
defparam \rom_a[22]~output .CFG_OPEN_DRAIN = 1'b0;
defparam \rom_a[22]~output .CFG_PDRCTRL = 4'b0100;
defparam \rom_a[22]~output .CFG_KEEP = 2'b00;
defparam \rom_a[22]~output .CFG_LVDS_OUT_EN = 1'b0;
defparam \rom_a[22]~output .CFG_LVDS_SEL_CUA = 2'b00;
defparam \rom_a[22]~output .CFG_LVDS_IREF = 10'b0110000000;
defparam \rom_a[22]~output .CFG_LVDS_IN_EN = 1'b0;
defparam \rom_a[22]~output .DPCLK_DELAY = 4'b0000;
defparam \rom_a[22]~output .OUT_DELAY = 1'b0;
defparam \rom_a[22]~output .IN_DATA_DELAY = 3'b000;
defparam \rom_a[22]~output .IN_REG_DELAY = 3'b000;

alta_rio \rom_nCS~output (
	.padio(rom_nCS),
	.datain(\cart_a[15]~input_o ),
	.oe(vcc),
	.outclk(gnd),
	.outclkena(vcc),
	.inclk(gnd),
	.inclkena(vcc),
	.areset(gnd),
	.sreset(gnd),
	.combout(),
	.regout());
defparam \rom_nCS~output .coord_x = 0;
defparam \rom_nCS~output .coord_y = 2;
defparam \rom_nCS~output .coord_z = 3;
defparam \rom_nCS~output .IN_ASYNC_MODE = 1'b0;
defparam \rom_nCS~output .IN_SYNC_MODE = 1'b0;
defparam \rom_nCS~output .IN_POWERUP = 1'b0;
defparam \rom_nCS~output .OUT_REG_MODE = 1'b0;
defparam \rom_nCS~output .OUT_ASYNC_MODE = 1'b0;
defparam \rom_nCS~output .OUT_SYNC_MODE = 1'b0;
defparam \rom_nCS~output .OUT_POWERUP = 1'b0;
defparam \rom_nCS~output .OE_REG_MODE = 1'b0;
defparam \rom_nCS~output .OE_ASYNC_MODE = 1'b0;
defparam \rom_nCS~output .OE_SYNC_MODE = 1'b0;
defparam \rom_nCS~output .OE_POWERUP = 1'b0;
defparam \rom_nCS~output .CFG_TRI_INPUT = 1'b0;
defparam \rom_nCS~output .CFG_INPUT_EN = 1'b0;
defparam \rom_nCS~output .CFG_PULL_UP = 1'b0;
defparam \rom_nCS~output .CFG_SLR = 1'b0;
defparam \rom_nCS~output .CFG_OPEN_DRAIN = 1'b0;
defparam \rom_nCS~output .CFG_PDRCTRL = 4'b0100;
defparam \rom_nCS~output .CFG_KEEP = 2'b00;
defparam \rom_nCS~output .CFG_LVDS_OUT_EN = 1'b0;
defparam \rom_nCS~output .CFG_LVDS_SEL_CUA = 2'b00;
defparam \rom_nCS~output .CFG_LVDS_IREF = 10'b0110000000;
defparam \rom_nCS~output .CFG_LVDS_IN_EN = 1'b0;
defparam \rom_nCS~output .DPCLK_DELAY = 4'b0000;
defparam \rom_nCS~output .OUT_DELAY = 1'b0;
defparam \rom_nCS~output .IN_DATA_DELAY = 3'b000;
defparam \rom_nCS~output .IN_REG_DELAY = 3'b000;

alta_rv32 rv32(
	.sys_clk(\gclksw_inst|gclk_switch__alta_gclksw__clkout ),
	.mem_ahb_hready(\rv32.mem_ahb_hready ),
	.mem_ahb_hreadyout(vcc),
	.mem_ahb_htrans({\rv32.mem_ahb_htrans[1] , \rv32.mem_ahb_htrans[0] }),
	.mem_ahb_hsize({\rv32.mem_ahb_hsize[2] , \rv32.mem_ahb_hsize[1] , \rv32.mem_ahb_hsize[0] }),
	.mem_ahb_hburst({\rv32.mem_ahb_hburst[2] , \rv32.mem_ahb_hburst[1] , \rv32.mem_ahb_hburst[0] }),
	.mem_ahb_hwrite(\rv32.mem_ahb_hwrite ),
	.mem_ahb_haddr({\rv32.mem_ahb_haddr[31] , \rv32.mem_ahb_haddr[30] , \rv32.mem_ahb_haddr[29] , \rv32.mem_ahb_haddr[28] , \rv32.mem_ahb_haddr[27] , \rv32.mem_ahb_haddr[26] , \rv32.mem_ahb_haddr[25] , \rv32.mem_ahb_haddr[24] , \rv32.mem_ahb_haddr[23] , \rv32.mem_ahb_haddr[22] , \rv32.mem_ahb_haddr[21] , \rv32.mem_ahb_haddr[20] , \rv32.mem_ahb_haddr[19] , \rv32.mem_ahb_haddr[18] , \rv32.mem_ahb_haddr[17] , \rv32.mem_ahb_haddr[16] , \rv32.mem_ahb_haddr[15] , \rv32.mem_ahb_haddr[14] , \rv32.mem_ahb_haddr[13] , \rv32.mem_ahb_haddr[12] , \rv32.mem_ahb_haddr[11] , \rv32.mem_ahb_haddr[10] , \rv32.mem_ahb_haddr[9] , \rv32.mem_ahb_haddr[8] , \rv32.mem_ahb_haddr[7] , \rv32.mem_ahb_haddr[6] , \rv32.mem_ahb_haddr[5] , \rv32.mem_ahb_haddr[4] , \rv32.mem_ahb_haddr[3] , \rv32.mem_ahb_haddr[2] , \rv32.mem_ahb_haddr[1] , \rv32.mem_ahb_haddr[0] }),
	.mem_ahb_hwdata({\rv32.mem_ahb_hwdata[31] , \rv32.mem_ahb_hwdata[30] , \rv32.mem_ahb_hwdata[29] , \rv32.mem_ahb_hwdata[28] , \rv32.mem_ahb_hwdata[27] , \rv32.mem_ahb_hwdata[26] , \rv32.mem_ahb_hwdata[25] , \rv32.mem_ahb_hwdata[24] , \rv32.mem_ahb_hwdata[23] , \rv32.mem_ahb_hwdata[22] , \rv32.mem_ahb_hwdata[21] , \rv32.mem_ahb_hwdata[20] , \rv32.mem_ahb_hwdata[19] , \rv32.mem_ahb_hwdata[18] , \rv32.mem_ahb_hwdata[17] , \rv32.mem_ahb_hwdata[16] , \rv32.mem_ahb_hwdata[15] , \rv32.mem_ahb_hwdata[14] , \rv32.mem_ahb_hwdata[13] , \rv32.mem_ahb_hwdata[12] , \rv32.mem_ahb_hwdata[11] , \rv32.mem_ahb_hwdata[10] , \rv32.mem_ahb_hwdata[9] , \rv32.mem_ahb_hwdata[8] , \rv32.mem_ahb_hwdata[7] , \rv32.mem_ahb_hwdata[6] , \rv32.mem_ahb_hwdata[5] , \rv32.mem_ahb_hwdata[4] , \rv32.mem_ahb_hwdata[3] , \rv32.mem_ahb_hwdata[2] , \rv32.mem_ahb_hwdata[1] , \rv32.mem_ahb_hwdata[0] }),
	.mem_ahb_hresp(gnd),
	.mem_ahb_hrdata({gnd, gnd, gnd, gnd, gnd, gnd, gnd, gnd, gnd, gnd, gnd, gnd, gnd, gnd, gnd, gnd, gnd, gnd, gnd, gnd, gnd, gnd, gnd, gnd, gnd, gnd, gnd, gnd, gnd, gnd, gnd, gnd}),
	.slave_ahb_hsel(gnd),
	.slave_ahb_hready(vcc),
	.slave_ahb_hreadyout(\rv32.slave_ahb_hreadyout ),
	.slave_ahb_htrans({gnd, gnd}),
	.slave_ahb_hsize({gnd, gnd, gnd}),
	.slave_ahb_hburst({gnd, gnd, gnd}),
	.slave_ahb_hwrite(gnd),
	.slave_ahb_haddr({gnd, gnd, gnd, gnd, gnd, gnd, gnd, gnd, gnd, gnd, gnd, gnd, gnd, gnd, gnd, gnd, gnd, gnd, gnd, gnd, gnd, gnd, gnd, gnd, gnd, gnd, gnd, gnd, gnd, gnd, gnd, gnd}),
	.slave_ahb_hwdata({gnd, gnd, gnd, gnd, gnd, gnd, gnd, gnd, gnd, gnd, gnd, gnd, gnd, gnd, gnd, gnd, gnd, gnd, gnd, gnd, gnd, gnd, gnd, gnd, gnd, gnd, gnd, gnd, gnd, gnd, gnd, gnd}),
	.slave_ahb_hresp(\rv32.slave_ahb_hresp ),
	.slave_ahb_hrdata({\rv32.slave_ahb_hrdata[31] , \rv32.slave_ahb_hrdata[30] , \rv32.slave_ahb_hrdata[29] , \rv32.slave_ahb_hrdata[28] , \rv32.slave_ahb_hrdata[27] , \rv32.slave_ahb_hrdata[26] , \rv32.slave_ahb_hrdata[25] , \rv32.slave_ahb_hrdata[24] , \rv32.slave_ahb_hrdata[23] , \rv32.slave_ahb_hrdata[22] , \rv32.slave_ahb_hrdata[21] , \rv32.slave_ahb_hrdata[20] , \rv32.slave_ahb_hrdata[19] , \rv32.slave_ahb_hrdata[18] , \rv32.slave_ahb_hrdata[17] , \rv32.slave_ahb_hrdata[16] , \rv32.slave_ahb_hrdata[15] , \rv32.slave_ahb_hrdata[14] , \rv32.slave_ahb_hrdata[13] , \rv32.slave_ahb_hrdata[12] , \rv32.slave_ahb_hrdata[11] , \rv32.slave_ahb_hrdata[10] , \rv32.slave_ahb_hrdata[9] , \rv32.slave_ahb_hrdata[8] , \rv32.slave_ahb_hrdata[7] , \rv32.slave_ahb_hrdata[6] , \rv32.slave_ahb_hrdata[5] , \rv32.slave_ahb_hrdata[4] , \rv32.slave_ahb_hrdata[3] , \rv32.slave_ahb_hrdata[2] , \rv32.slave_ahb_hrdata[1] , \rv32.slave_ahb_hrdata[0] }),
	.gpio0_io_in({gnd, gnd, gnd, gnd, gnd, gnd, gnd, gnd}),
	.gpio0_io_out_data({\rv32.gpio0_io_out_data[7] , \rv32.gpio0_io_out_data[6] , \rv32.gpio0_io_out_data[5] , \rv32.gpio0_io_out_data[4] , \rv32.gpio0_io_out_data[3] , \rv32.gpio0_io_out_data[2] , \rv32.gpio0_io_out_data[1] , \rv32.gpio0_io_out_data[0] }),
	.gpio0_io_out_en({\rv32.gpio0_io_out_en[7] , \rv32.gpio0_io_out_en[6] , \rv32.gpio0_io_out_en[5] , \rv32.gpio0_io_out_en[4] , \rv32.gpio0_io_out_en[3] , \rv32.gpio0_io_out_en[2] , \rv32.gpio0_io_out_en[1] , \rv32.gpio0_io_out_en[0] }),
	.gpio1_io_in({gnd, gnd, gnd, gnd, gnd, gnd, gnd, \GPIO1_0~input_o }),
	.gpio1_io_out_data({\rv32.gpio1_io_out_data[7] , \rv32.gpio1_io_out_data[6] , \rv32.gpio1_io_out_data[5] , \rv32.gpio1_io_out_data[4] , \rv32.gpio1_io_out_data[3] , \rv32.gpio1_io_out_data[2] , \rv32.gpio1_io_out_data[1] , \rv32.gpio1_io_out_data[0] }),
	.gpio1_io_out_en({\rv32.gpio1_io_out_en[7] , \rv32.gpio1_io_out_en[6] , \rv32.gpio1_io_out_en[5] , \rv32.gpio1_io_out_en[4] , \rv32.gpio1_io_out_en[3] , \rv32.gpio1_io_out_en[2] , \rv32.gpio1_io_out_en[1] , \rv32.gpio1_io_out_en[0] }),
	.sys_ctrl_clkSource({\rv32.sys_ctrl_clkSource[1] , \rv32.sys_ctrl_clkSource[0] }),
	.sys_ctrl_hseEnable(\rv32.sys_ctrl_hseEnable ),
	.sys_ctrl_hseBypass(\rv32.sys_ctrl_hseBypass ),
	.sys_ctrl_pllEnable(\rv32.sys_ctrl_pllEnable ),
	.sys_ctrl_pllReady(\auto_generated_inst.hbo_13_83378d4b1997463f_bp ),
	.sys_ctrl_sleep(\rv32.sys_ctrl_sleep ),
	.sys_ctrl_stop(\rv32.sys_ctrl_stop ),
	.sys_ctrl_standby(\rv32.sys_ctrl_standby ),
	.gpio2_io_in({gnd, gnd, gnd, gnd, gnd, gnd, gnd, gnd}),
	.gpio2_io_out_data({\rv32.gpio2_io_out_data[7] , \rv32.gpio2_io_out_data[6] , \rv32.gpio2_io_out_data[5] , \rv32.gpio2_io_out_data[4] , \rv32.gpio2_io_out_data[3] , \rv32.gpio2_io_out_data[2] , \rv32.gpio2_io_out_data[1] , \rv32.gpio2_io_out_data[0] }),
	.gpio2_io_out_en({\rv32.gpio2_io_out_en[7] , \rv32.gpio2_io_out_en[6] , \rv32.gpio2_io_out_en[5] , \rv32.gpio2_io_out_en[4] , \rv32.gpio2_io_out_en[3] , \rv32.gpio2_io_out_en[2] , \rv32.gpio2_io_out_en[1] , \rv32.gpio2_io_out_en[0] }),
	.gpio3_io_in({gnd, gnd, gnd, gnd, gnd, gnd, gnd, gnd}),
	.gpio3_io_out_data({\rv32.gpio3_io_out_data[7] , \rv32.gpio3_io_out_data[6] , \rv32.gpio3_io_out_data[5] , \rv32.gpio3_io_out_data[4] , \rv32.gpio3_io_out_data[3] , \rv32.gpio3_io_out_data[2] , \rv32.gpio3_io_out_data[1] , \rv32.gpio3_io_out_data[0] }),
	.gpio3_io_out_en({\rv32.gpio3_io_out_en[7] , \rv32.gpio3_io_out_en[6] , \rv32.gpio3_io_out_en[5] , \rv32.gpio3_io_out_en[4] , \rv32.gpio3_io_out_en[3] , \rv32.gpio3_io_out_en[2] , \rv32.gpio3_io_out_en[1] , \rv32.gpio3_io_out_en[0] }),
	.gpio4_io_in({gnd, gnd, gnd, gnd, gnd, gnd, gnd, gnd}),
	.gpio4_io_out_data({\rv32.gpio4_io_out_data[7] , \rv32.gpio4_io_out_data[6] , \rv32.gpio4_io_out_data[5] , \rv32.gpio4_io_out_data[4] , \rv32.gpio4_io_out_data[3] , \rv32.gpio4_io_out_data[2] , \rv32.gpio4_io_out_data[1] , \rv32.gpio4_io_out_data[0] }),
	.gpio4_io_out_en({\rv32.gpio4_io_out_en[7] , \rv32.gpio4_io_out_en[6] , \rv32.gpio4_io_out_en[5] , \rv32.gpio4_io_out_en[4] , \rv32.gpio4_io_out_en[3] , \rv32.gpio4_io_out_en[2] , \rv32.gpio4_io_out_en[1] , \rv32.gpio4_io_out_en[0] }),
	.gpio5_io_in({gnd, gnd, gnd, gnd, gnd, gnd, gnd, gnd}),
	.gpio5_io_out_data({\rv32.gpio5_io_out_data[7] , \rv32.gpio5_io_out_data[6] , \rv32.gpio5_io_out_data[5] , \rv32.gpio5_io_out_data[4] , \rv32.gpio5_io_out_data[3] , \rv32.gpio5_io_out_data[2] , \rv32.gpio5_io_out_data[1] , \rv32.gpio5_io_out_data[0] }),
	.gpio5_io_out_en({\rv32.gpio5_io_out_en[7] , \rv32.gpio5_io_out_en[6] , \rv32.gpio5_io_out_en[5] , \rv32.gpio5_io_out_en[4] , \rv32.gpio5_io_out_en[3] , \rv32.gpio5_io_out_en[2] , \rv32.gpio5_io_out_en[1] , \rv32.gpio5_io_out_en[0] }),
	.gpio6_io_in({gnd, gnd, gnd, gnd, gnd, gnd, gnd, gnd}),
	.gpio6_io_out_data({\rv32.gpio6_io_out_data[7] , \rv32.gpio6_io_out_data[6] , \rv32.gpio6_io_out_data[5] , \rv32.gpio6_io_out_data[4] , \rv32.gpio6_io_out_data[3] , \rv32.gpio6_io_out_data[2] , \rv32.gpio6_io_out_data[1] , \rv32.gpio6_io_out_data[0] }),
	.gpio6_io_out_en({\rv32.gpio6_io_out_en[7] , \rv32.gpio6_io_out_en[6] , \rv32.gpio6_io_out_en[5] , \rv32.gpio6_io_out_en[4] , \rv32.gpio6_io_out_en[3] , \rv32.gpio6_io_out_en[2] , \rv32.gpio6_io_out_en[1] , \rv32.gpio6_io_out_en[0] }),
	.gpio7_io_in({gnd, gnd, gnd, gnd, gnd, gnd, gnd, gnd}),
	.gpio7_io_out_data({\rv32.gpio7_io_out_data[7] , \rv32.gpio7_io_out_data[6] , \rv32.gpio7_io_out_data[5] , \rv32.gpio7_io_out_data[4] , \rv32.gpio7_io_out_data[3] , \rv32.gpio7_io_out_data[2] , \rv32.gpio7_io_out_data[1] , \rv32.gpio7_io_out_data[0] }),
	.gpio7_io_out_en({\rv32.gpio7_io_out_en[7] , \rv32.gpio7_io_out_en[6] , \rv32.gpio7_io_out_en[5] , \rv32.gpio7_io_out_en[4] , \rv32.gpio7_io_out_en[3] , \rv32.gpio7_io_out_en[2] , \rv32.gpio7_io_out_en[1] , \rv32.gpio7_io_out_en[0] }),
	.gpio8_io_in({gnd, gnd, gnd, gnd, gnd, gnd, gnd, gnd}),
	.gpio8_io_out_data({\rv32.gpio8_io_out_data[7] , \rv32.gpio8_io_out_data[6] , \rv32.gpio8_io_out_data[5] , \rv32.gpio8_io_out_data[4] , \rv32.gpio8_io_out_data[3] , \rv32.gpio8_io_out_data[2] , \rv32.gpio8_io_out_data[1] , \rv32.gpio8_io_out_data[0] }),
	.gpio8_io_out_en({\rv32.gpio8_io_out_en[7] , \rv32.gpio8_io_out_en[6] , \rv32.gpio8_io_out_en[5] , \rv32.gpio8_io_out_en[4] , \rv32.gpio8_io_out_en[3] , \rv32.gpio8_io_out_en[2] , \rv32.gpio8_io_out_en[1] , \rv32.gpio8_io_out_en[0] }),
	.gpio9_io_in({gnd, gnd, gnd, gnd, gnd, gnd, gnd, gnd}),
	.gpio9_io_out_data({\rv32.gpio9_io_out_data[7] , \rv32.gpio9_io_out_data[6] , \rv32.gpio9_io_out_data[5] , \rv32.gpio9_io_out_data[4] , \rv32.gpio9_io_out_data[3] , \rv32.gpio9_io_out_data[2] , \rv32.gpio9_io_out_data[1] , \rv32.gpio9_io_out_data[0] }),
	.gpio9_io_out_en({\rv32.gpio9_io_out_en[7] , \rv32.gpio9_io_out_en[6] , \rv32.gpio9_io_out_en[5] , \rv32.gpio9_io_out_en[4] , \rv32.gpio9_io_out_en[3] , \rv32.gpio9_io_out_en[2] , \rv32.gpio9_io_out_en[1] , \rv32.gpio9_io_out_en[0] }),
	.ext_resetn(vcc),
	.resetn_out(\rv32.resetn_out ),
	.dmactive(\rv32.dmactive ),
	.swj_JTAGNSW(\rv32.swj_JTAGNSW ),
	.swj_JTAGSTATE({\rv32.swj_JTAGSTATE[3] , \rv32.swj_JTAGSTATE[2] , \rv32.swj_JTAGSTATE[1] , \rv32.swj_JTAGSTATE[0] }),
	.swj_JTAGIR({\rv32.swj_JTAGIR[3] , \rv32.swj_JTAGIR[2] , \rv32.swj_JTAGIR[1] , \rv32.swj_JTAGIR[0] }),
	.ext_int({gnd, gnd, gnd, gnd, gnd, gnd, gnd, gnd}),
	.ext_dma_DMACBREQ({gnd, gnd, gnd, gnd}),
	.ext_dma_DMACLBREQ({gnd, gnd, gnd, gnd}),
	.ext_dma_DMACSREQ({gnd, gnd, gnd, gnd}),
	.ext_dma_DMACLSREQ({gnd, gnd, gnd, gnd}),
	.ext_dma_DMACCLR({\rv32.ext_dma_DMACCLR[3] , \rv32.ext_dma_DMACCLR[2] , \rv32.ext_dma_DMACCLR[1] , \rv32.ext_dma_DMACCLR[0] }),
	.ext_dma_DMACTC({\rv32.ext_dma_DMACTC[3] , \rv32.ext_dma_DMACTC[2] , \rv32.ext_dma_DMACTC[1] , \rv32.ext_dma_DMACTC[0] }),
	.local_int({gnd, gnd, gnd, gnd}),
	.test_mode({gnd, gnd}),
	.usb0_xcvr_clk(vcc),
	.usb0_id(vcc));
defparam rv32.coord_x = 0;
defparam rv32.coord_y = 5;
defparam rv32.coord_z = 0;

alta_rio \sens_load~output (
	.padio(sens_load),
	.datain(gnd),
	.oe(vcc),
	.outclk(gnd),
	.outclkena(vcc),
	.inclk(gnd),
	.inclkena(vcc),
	.areset(gnd),
	.sreset(gnd),
	.combout(),
	.regout());
defparam \sens_load~output .coord_x = 18;
defparam \sens_load~output .coord_y = 13;
defparam \sens_load~output .coord_z = 1;
defparam \sens_load~output .IN_ASYNC_MODE = 1'b0;
defparam \sens_load~output .IN_SYNC_MODE = 1'b0;
defparam \sens_load~output .IN_POWERUP = 1'b0;
defparam \sens_load~output .OUT_REG_MODE = 1'b0;
defparam \sens_load~output .OUT_ASYNC_MODE = 1'b0;
defparam \sens_load~output .OUT_SYNC_MODE = 1'b0;
defparam \sens_load~output .OUT_POWERUP = 1'b0;
defparam \sens_load~output .OE_REG_MODE = 1'b0;
defparam \sens_load~output .OE_ASYNC_MODE = 1'b0;
defparam \sens_load~output .OE_SYNC_MODE = 1'b0;
defparam \sens_load~output .OE_POWERUP = 1'b0;
defparam \sens_load~output .CFG_TRI_INPUT = 1'b0;
defparam \sens_load~output .CFG_INPUT_EN = 1'b0;
defparam \sens_load~output .CFG_PULL_UP = 1'b0;
defparam \sens_load~output .CFG_SLR = 1'b0;
defparam \sens_load~output .CFG_OPEN_DRAIN = 1'b0;
defparam \sens_load~output .CFG_PDRCTRL = 4'b0100;
defparam \sens_load~output .CFG_KEEP = 2'b00;
defparam \sens_load~output .CFG_LVDS_OUT_EN = 1'b0;
defparam \sens_load~output .CFG_LVDS_SEL_CUA = 2'b00;
defparam \sens_load~output .CFG_LVDS_IREF = 10'b0110000000;
defparam \sens_load~output .CFG_LVDS_IN_EN = 1'b0;
defparam \sens_load~output .DPCLK_DELAY = 4'b0000;
defparam \sens_load~output .OUT_DELAY = 1'b0;
defparam \sens_load~output .IN_DATA_DELAY = 3'b000;
defparam \sens_load~output .IN_REG_DELAY = 3'b000;

alta_rio \sens_read~output (
	.padio(sens_read),
	.datain(\macro_inst|gbdreg|Cam_Capture~q ),
	.oe(vcc),
	.outclk(gnd),
	.outclkena(vcc),
	.inclk(gnd),
	.inclkena(vcc),
	.areset(gnd),
	.sreset(gnd),
	.combout(),
	.regout());
defparam \sens_read~output .coord_x = 19;
defparam \sens_read~output .coord_y = 13;
defparam \sens_read~output .coord_z = 0;
defparam \sens_read~output .IN_ASYNC_MODE = 1'b0;
defparam \sens_read~output .IN_SYNC_MODE = 1'b0;
defparam \sens_read~output .IN_POWERUP = 1'b0;
defparam \sens_read~output .OUT_REG_MODE = 1'b0;
defparam \sens_read~output .OUT_ASYNC_MODE = 1'b0;
defparam \sens_read~output .OUT_SYNC_MODE = 1'b0;
defparam \sens_read~output .OUT_POWERUP = 1'b0;
defparam \sens_read~output .OE_REG_MODE = 1'b0;
defparam \sens_read~output .OE_ASYNC_MODE = 1'b0;
defparam \sens_read~output .OE_SYNC_MODE = 1'b0;
defparam \sens_read~output .OE_POWERUP = 1'b0;
defparam \sens_read~output .CFG_TRI_INPUT = 1'b0;
defparam \sens_read~output .CFG_INPUT_EN = 1'b0;
defparam \sens_read~output .CFG_PULL_UP = 1'b0;
defparam \sens_read~output .CFG_SLR = 1'b0;
defparam \sens_read~output .CFG_OPEN_DRAIN = 1'b0;
defparam \sens_read~output .CFG_PDRCTRL = 4'b0100;
defparam \sens_read~output .CFG_KEEP = 2'b00;
defparam \sens_read~output .CFG_LVDS_OUT_EN = 1'b0;
defparam \sens_read~output .CFG_LVDS_SEL_CUA = 2'b00;
defparam \sens_read~output .CFG_LVDS_IREF = 10'b0110000000;
defparam \sens_read~output .CFG_LVDS_IN_EN = 1'b0;
defparam \sens_read~output .DPCLK_DELAY = 4'b0000;
defparam \sens_read~output .OUT_DELAY = 1'b0;
defparam \sens_read~output .IN_DATA_DELAY = 3'b000;
defparam \sens_read~output .IN_REG_DELAY = 3'b000;

alta_rio \sens_reset~output (
	.padio(sens_reset),
	.datain(\macro_inst|gbdreg|Reg_OutputValid~q ),
	.oe(vcc),
	.outclk(gnd),
	.outclkena(vcc),
	.inclk(gnd),
	.inclkena(vcc),
	.areset(gnd),
	.sreset(gnd),
	.combout(),
	.regout());
defparam \sens_reset~output .coord_x = 18;
defparam \sens_reset~output .coord_y = 13;
defparam \sens_reset~output .coord_z = 2;
defparam \sens_reset~output .IN_ASYNC_MODE = 1'b0;
defparam \sens_reset~output .IN_SYNC_MODE = 1'b0;
defparam \sens_reset~output .IN_POWERUP = 1'b0;
defparam \sens_reset~output .OUT_REG_MODE = 1'b0;
defparam \sens_reset~output .OUT_ASYNC_MODE = 1'b0;
defparam \sens_reset~output .OUT_SYNC_MODE = 1'b0;
defparam \sens_reset~output .OUT_POWERUP = 1'b0;
defparam \sens_reset~output .OE_REG_MODE = 1'b0;
defparam \sens_reset~output .OE_ASYNC_MODE = 1'b0;
defparam \sens_reset~output .OE_SYNC_MODE = 1'b0;
defparam \sens_reset~output .OE_POWERUP = 1'b0;
defparam \sens_reset~output .CFG_TRI_INPUT = 1'b0;
defparam \sens_reset~output .CFG_INPUT_EN = 1'b0;
defparam \sens_reset~output .CFG_PULL_UP = 1'b0;
defparam \sens_reset~output .CFG_SLR = 1'b0;
defparam \sens_reset~output .CFG_OPEN_DRAIN = 1'b0;
defparam \sens_reset~output .CFG_PDRCTRL = 4'b0100;
defparam \sens_reset~output .CFG_KEEP = 2'b00;
defparam \sens_reset~output .CFG_LVDS_OUT_EN = 1'b0;
defparam \sens_reset~output .CFG_LVDS_SEL_CUA = 2'b00;
defparam \sens_reset~output .CFG_LVDS_IREF = 10'b0110000000;
defparam \sens_reset~output .CFG_LVDS_IN_EN = 1'b0;
defparam \sens_reset~output .DPCLK_DELAY = 4'b0000;
defparam \sens_reset~output .OUT_DELAY = 1'b0;
defparam \sens_reset~output .IN_DATA_DELAY = 3'b000;
defparam \sens_reset~output .IN_REG_DELAY = 3'b000;

alta_rio \sens_sin~output (
	.padio(sens_sin),
	.datain(gnd),
	.oe(vcc),
	.outclk(gnd),
	.outclkena(vcc),
	.inclk(gnd),
	.inclkena(vcc),
	.areset(gnd),
	.sreset(gnd),
	.combout(),
	.regout());
defparam \sens_sin~output .coord_x = 18;
defparam \sens_sin~output .coord_y = 13;
defparam \sens_sin~output .coord_z = 0;
defparam \sens_sin~output .IN_ASYNC_MODE = 1'b0;
defparam \sens_sin~output .IN_SYNC_MODE = 1'b0;
defparam \sens_sin~output .IN_POWERUP = 1'b0;
defparam \sens_sin~output .OUT_REG_MODE = 1'b0;
defparam \sens_sin~output .OUT_ASYNC_MODE = 1'b0;
defparam \sens_sin~output .OUT_SYNC_MODE = 1'b0;
defparam \sens_sin~output .OUT_POWERUP = 1'b0;
defparam \sens_sin~output .OE_REG_MODE = 1'b0;
defparam \sens_sin~output .OE_ASYNC_MODE = 1'b0;
defparam \sens_sin~output .OE_SYNC_MODE = 1'b0;
defparam \sens_sin~output .OE_POWERUP = 1'b0;
defparam \sens_sin~output .CFG_TRI_INPUT = 1'b0;
defparam \sens_sin~output .CFG_INPUT_EN = 1'b0;
defparam \sens_sin~output .CFG_PULL_UP = 1'b0;
defparam \sens_sin~output .CFG_SLR = 1'b0;
defparam \sens_sin~output .CFG_OPEN_DRAIN = 1'b0;
defparam \sens_sin~output .CFG_PDRCTRL = 4'b0100;
defparam \sens_sin~output .CFG_KEEP = 2'b00;
defparam \sens_sin~output .CFG_LVDS_OUT_EN = 1'b0;
defparam \sens_sin~output .CFG_LVDS_SEL_CUA = 2'b00;
defparam \sens_sin~output .CFG_LVDS_IREF = 10'b0110000000;
defparam \sens_sin~output .CFG_LVDS_IN_EN = 1'b0;
defparam \sens_sin~output .DPCLK_DELAY = 4'b0000;
defparam \sens_sin~output .OUT_DELAY = 1'b0;
defparam \sens_sin~output .IN_DATA_DELAY = 3'b000;
defparam \sens_sin~output .IN_REG_DELAY = 3'b000;

alta_rio \sens_start~output (
	.padio(sens_start),
	.datain(gnd),
	.oe(vcc),
	.outclk(gnd),
	.outclkena(vcc),
	.inclk(gnd),
	.inclkena(vcc),
	.areset(gnd),
	.sreset(gnd),
	.combout(),
	.regout());
defparam \sens_start~output .coord_x = 17;
defparam \sens_start~output .coord_y = 13;
defparam \sens_start~output .coord_z = 3;
defparam \sens_start~output .IN_ASYNC_MODE = 1'b0;
defparam \sens_start~output .IN_SYNC_MODE = 1'b0;
defparam \sens_start~output .IN_POWERUP = 1'b0;
defparam \sens_start~output .OUT_REG_MODE = 1'b0;
defparam \sens_start~output .OUT_ASYNC_MODE = 1'b0;
defparam \sens_start~output .OUT_SYNC_MODE = 1'b0;
defparam \sens_start~output .OUT_POWERUP = 1'b0;
defparam \sens_start~output .OE_REG_MODE = 1'b0;
defparam \sens_start~output .OE_ASYNC_MODE = 1'b0;
defparam \sens_start~output .OE_SYNC_MODE = 1'b0;
defparam \sens_start~output .OE_POWERUP = 1'b0;
defparam \sens_start~output .CFG_TRI_INPUT = 1'b0;
defparam \sens_start~output .CFG_INPUT_EN = 1'b0;
defparam \sens_start~output .CFG_PULL_UP = 1'b0;
defparam \sens_start~output .CFG_SLR = 1'b0;
defparam \sens_start~output .CFG_OPEN_DRAIN = 1'b0;
defparam \sens_start~output .CFG_PDRCTRL = 4'b0100;
defparam \sens_start~output .CFG_KEEP = 2'b00;
defparam \sens_start~output .CFG_LVDS_OUT_EN = 1'b0;
defparam \sens_start~output .CFG_LVDS_SEL_CUA = 2'b00;
defparam \sens_start~output .CFG_LVDS_IREF = 10'b0110000000;
defparam \sens_start~output .CFG_LVDS_IN_EN = 1'b0;
defparam \sens_start~output .DPCLK_DELAY = 4'b0000;
defparam \sens_start~output .OUT_DELAY = 1'b0;
defparam \sens_start~output .IN_DATA_DELAY = 3'b000;
defparam \sens_start~output .IN_REG_DELAY = 3'b000;

alta_rio \sens_xck~output (
	.padio(sens_xck),
	.datain(\macro_inst|gbdcam|Sens_XCK_Reg~q ),
	.oe(vcc),
	.outclk(gnd),
	.outclkena(vcc),
	.inclk(gnd),
	.inclkena(vcc),
	.areset(gnd),
	.sreset(gnd),
	.combout(),
	.regout());
defparam \sens_xck~output .coord_x = 18;
defparam \sens_xck~output .coord_y = 13;
defparam \sens_xck~output .coord_z = 3;
defparam \sens_xck~output .IN_ASYNC_MODE = 1'b0;
defparam \sens_xck~output .IN_SYNC_MODE = 1'b0;
defparam \sens_xck~output .IN_POWERUP = 1'b0;
defparam \sens_xck~output .OUT_REG_MODE = 1'b0;
defparam \sens_xck~output .OUT_ASYNC_MODE = 1'b0;
defparam \sens_xck~output .OUT_SYNC_MODE = 1'b0;
defparam \sens_xck~output .OUT_POWERUP = 1'b0;
defparam \sens_xck~output .OE_REG_MODE = 1'b0;
defparam \sens_xck~output .OE_ASYNC_MODE = 1'b0;
defparam \sens_xck~output .OE_SYNC_MODE = 1'b0;
defparam \sens_xck~output .OE_POWERUP = 1'b0;
defparam \sens_xck~output .CFG_TRI_INPUT = 1'b0;
defparam \sens_xck~output .CFG_INPUT_EN = 1'b0;
defparam \sens_xck~output .CFG_PULL_UP = 1'b0;
defparam \sens_xck~output .CFG_SLR = 1'b0;
defparam \sens_xck~output .CFG_OPEN_DRAIN = 1'b0;
defparam \sens_xck~output .CFG_PDRCTRL = 4'b0100;
defparam \sens_xck~output .CFG_KEEP = 2'b00;
defparam \sens_xck~output .CFG_LVDS_OUT_EN = 1'b0;
defparam \sens_xck~output .CFG_LVDS_SEL_CUA = 2'b00;
defparam \sens_xck~output .CFG_LVDS_IREF = 10'b0110000000;
defparam \sens_xck~output .CFG_LVDS_IN_EN = 1'b0;
defparam \sens_xck~output .DPCLK_DELAY = 4'b0000;
defparam \sens_xck~output .OUT_DELAY = 1'b0;
defparam \sens_xck~output .IN_DATA_DELAY = 3'b000;
defparam \sens_xck~output .IN_REG_DELAY = 3'b000;

alta_syncctrl syncload_ctrl_X57_Y1(
	.Din(),
	.Dout(SyncLoad_X57_Y1_VCC));
defparam syncload_ctrl_X57_Y1.coord_x = 8;
defparam syncload_ctrl_X57_Y1.coord_y = 3;
defparam syncload_ctrl_X57_Y1.coord_z = 1;
defparam syncload_ctrl_X57_Y1.SyncCtrlMux = 2'b01;

alta_syncctrl syncload_ctrl_X58_Y1(
	.Din(),
	.Dout(SyncLoad_X58_Y1_VCC));
defparam syncload_ctrl_X58_Y1.coord_x = 7;
defparam syncload_ctrl_X58_Y1.coord_y = 3;
defparam syncload_ctrl_X58_Y1.coord_z = 1;
defparam syncload_ctrl_X58_Y1.SyncCtrlMux = 2'b01;

alta_syncctrl syncload_ctrl_X59_Y3(
	.Din(),
	.Dout(SyncLoad_X59_Y3_VCC));
defparam syncload_ctrl_X59_Y3.coord_x = 15;
defparam syncload_ctrl_X59_Y3.coord_y = 2;
defparam syncload_ctrl_X59_Y3.coord_z = 1;
defparam syncload_ctrl_X59_Y3.SyncCtrlMux = 2'b01;

alta_syncctrl syncload_ctrl_X60_Y2(
	.Din(),
	.Dout(SyncLoad_X60_Y2_GND));
defparam syncload_ctrl_X60_Y2.coord_x = 16;
defparam syncload_ctrl_X60_Y2.coord_y = 1;
defparam syncload_ctrl_X60_Y2.coord_z = 1;
defparam syncload_ctrl_X60_Y2.SyncCtrlMux = 2'b00;

alta_syncctrl syncload_ctrl_X60_Y3(
	.Din(),
	.Dout(SyncLoad_X60_Y3_GND));
defparam syncload_ctrl_X60_Y3.coord_x = 16;
defparam syncload_ctrl_X60_Y3.coord_y = 2;
defparam syncload_ctrl_X60_Y3.coord_z = 1;
defparam syncload_ctrl_X60_Y3.SyncCtrlMux = 2'b00;

alta_syncctrl syncreset_ctrl_X57_Y1(
	.Din(),
	.Dout(SyncReset_X57_Y1_GND));
defparam syncreset_ctrl_X57_Y1.coord_x = 8;
defparam syncreset_ctrl_X57_Y1.coord_y = 3;
defparam syncreset_ctrl_X57_Y1.coord_z = 0;
defparam syncreset_ctrl_X57_Y1.SyncCtrlMux = 2'b00;

alta_syncctrl syncreset_ctrl_X58_Y1(
	.Din(),
	.Dout(SyncReset_X58_Y1_GND));
defparam syncreset_ctrl_X58_Y1.coord_x = 7;
defparam syncreset_ctrl_X58_Y1.coord_y = 3;
defparam syncreset_ctrl_X58_Y1.coord_z = 0;
defparam syncreset_ctrl_X58_Y1.SyncCtrlMux = 2'b00;

alta_syncctrl syncreset_ctrl_X59_Y3(
	.Din(),
	.Dout(SyncReset_X59_Y3_GND));
defparam syncreset_ctrl_X59_Y3.coord_x = 15;
defparam syncreset_ctrl_X59_Y3.coord_y = 2;
defparam syncreset_ctrl_X59_Y3.coord_z = 0;
defparam syncreset_ctrl_X59_Y3.SyncCtrlMux = 2'b00;

alta_syncctrl syncreset_ctrl_X60_Y2(
	.Din(\macro_inst|gbdcam|main_state.S_WAIT0~q ),
	.Dout(\macro_inst|gbdcam|main_state.S_WAIT0~q__SyncReset_X60_Y2_INV ));
defparam syncreset_ctrl_X60_Y2.coord_x = 16;
defparam syncreset_ctrl_X60_Y2.coord_y = 1;
defparam syncreset_ctrl_X60_Y2.coord_z = 0;
defparam syncreset_ctrl_X60_Y2.SyncCtrlMux = 2'b11;

alta_syncctrl syncreset_ctrl_X60_Y3(
	.Din(\macro_inst|gbdcam|main_state.S_WAIT0~q ),
	.Dout(\macro_inst|gbdcam|main_state.S_WAIT0~q__SyncReset_X60_Y3_INV ));
defparam syncreset_ctrl_X60_Y3.coord_x = 16;
defparam syncreset_ctrl_X60_Y3.coord_y = 2;
defparam syncreset_ctrl_X60_Y3.coord_z = 0;
defparam syncreset_ctrl_X60_Y3.SyncCtrlMux = 2'b11;

alta_slice sys_resetn(
	.A(vcc),
	.B(vcc),
	.C(vcc),
	.D(\rv32.resetn_out ),
	.Cin(),
	.Qin(),
	.Clk(),
	.AsyncReset(),
	.SyncReset(),
	.ShiftData(),
	.SyncLoad(),
	.LutOut(\sys_resetn~combout ),
	.Cout(),
	.Q());
defparam sys_resetn.coord_x = 9;
defparam sys_resetn.coord_y = 4;
defparam sys_resetn.coord_z = 2;
defparam sys_resetn.mask = 16'h00FF;
defparam sys_resetn.modeMux = 1'b0;
defparam sys_resetn.FeedbackMux = 1'b0;
defparam sys_resetn.ShiftMux = 1'b0;
defparam sys_resetn.BypassEn = 1'b0;
defparam sys_resetn.CarryEnb = 1'b1;

alta_io_gclk \sys_resetn~clkctrl (
	.inclk(\sys_resetn~combout ),
	.outclk(\sys_resetn~clkctrl_outclk ));
defparam \sys_resetn~clkctrl .coord_x = 22;
defparam \sys_resetn~clkctrl .coord_y = 4;
defparam \sys_resetn~clkctrl .coord_z = 2;

endmodule
