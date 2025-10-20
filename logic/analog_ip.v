`timescale 1ns/1ps

module analog_ip (
  input         stop,
  input         sys_clock,
  input         bus_clock,
  input         resetn,
  input  [1:0]  mem_ahb_htrans,
  input         mem_ahb_hready,
  input         mem_ahb_hwrite,
  input  [31:0] mem_ahb_haddr,
  input  [2:0]  mem_ahb_hsize,       // Not used, only support word access
  input  [2:0]  mem_ahb_hburst,      // Not used, only support word access
  input  [31:0] mem_ahb_hwdata,
  output tri1   mem_ahb_hreadyout,
  output        mem_ahb_hresp,
  output [31:0] mem_ahb_hrdata,
  output        slave_ahb_hsel,
  output tri1   slave_ahb_hready,
  input         slave_ahb_hreadyout,
  output [1:0]  slave_ahb_htrans,
  output [2:0]  slave_ahb_hsize,
  output [2:0]  slave_ahb_hburst,
  output        slave_ahb_hwrite,
  output [31:0] slave_ahb_haddr,
  output [31:0] slave_ahb_hwdata,
  input         slave_ahb_hresp,
  input  [31:0] slave_ahb_hrdata,
  output [3:0]  ext_dma_DMACBREQ,
  output [3:0]  ext_dma_DMACLBREQ,
  output [3:0]  ext_dma_DMACSREQ,
  output [3:0]  ext_dma_DMACLSREQ,
  input  [3:0]  ext_dma_DMACCLR,
  input  [3:0]  ext_dma_DMACTC,
  output [3:0]  local_int
);
// Change the following bits to enable or disable a peripheral.
parameter ENABLE_ADC0 = 1'b1;
parameter ENABLE_ADC1 = 1'b0;
parameter ENABLE_ADC2 = 1'b0;
parameter ENABLE_DAC0 = 1'b0;
parameter ENABLE_DAC1 = 1'b0;
parameter ENABLE_CMP0 = 1'b0;

// Maximum number of channels for ADC sequence conversion.
parameter ADC_SEQ_MAX = 8;

/*** End of parameters that will change resource usage. ***/

assign slave_ahb_hsel   = 1'b0;
assign slave_ahb_hready = 1'b1;
assign slave_ahb_htrans = 2'b0;
assign slave_ahb_hsize  = 3'b0;
assign slave_ahb_hburst = 3'b0;
assign slave_ahb_hwrite = 1'b0;
assign slave_ahb_haddr  = 32'b0;
assign slave_ahb_hwdata = 32'b0;

assign ext_dma_DMACLBREQ = 4'b0;
assign ext_dma_DMACSREQ  = 4'b0;
assign ext_dma_DMACLSREQ = 4'b0;
assign local_int         = 4'b0;

parameter ADDR_BITS = 16;
parameter DATA_BITS = 32;
parameter PER_BITS = 8;

parameter ADC0_ADDR = 'h0000;
parameter ADC1_ADDR = 'h1000;
parameter ADC2_ADDR = 'h2000;
parameter DAC0_ADDR = 'h3000;
parameter DAC1_ADDR = 'h4000;
parameter CMP0_ADDR = 'h5000;

wire                 apb_psel;
wire                 apb_penable;
wire                 apb_pwrite;
wire [ADDR_BITS-1:0] apb_paddr;
wire [DATA_BITS-1:0] apb_pwdata;
wire [3:0]           apb_pstrb;
wire [2:0]           apb_pprot;
wire                 apb_pready  = 1'b1;
wire                 apb_pslverr = 1'b0;
reg  [DATA_BITS-1:0] apb_prdata;

assign apb_clock = bus_clock;
ahb2apb #(ADDR_BITS, DATA_BITS) ahb2apb_inst(
  .reset        (!resetn                     ),
  .ahb_clock    (sys_clock                   ),
  .ahb_hmastlock(1'b0                        ),
  .ahb_htrans   (mem_ahb_htrans              ),
  .ahb_hsel     (1'b1                        ),
  .ahb_hready   (mem_ahb_hready              ),
  .ahb_hwrite   (mem_ahb_hwrite              ),
  .ahb_haddr    (mem_ahb_haddr[ADDR_BITS-1:0]),
  .ahb_hsize    (mem_ahb_hsize               ),
  .ahb_hburst   (mem_ahb_hburst              ),
  .ahb_hprot    (4'b0011                     ),
  .ahb_hwdata   (mem_ahb_hwdata              ),
  .ahb_hrdata   (mem_ahb_hrdata              ),
  .ahb_hreadyout(mem_ahb_hreadyout           ),
  .ahb_hresp    (mem_ahb_hresp               ),
  .apb_clock    (apb_clock                   ),
  .apb_psel     (apb_psel                    ),
  .apb_penable  (apb_penable                 ),
  .apb_pwrite   (apb_pwrite                  ),
  .apb_paddr    (apb_paddr                   ),
  .apb_pwdata   (apb_pwdata                  ),
  .apb_pstrb    (apb_pstrb                   ),
  .apb_pprot    (apb_pprot                   ),
  .apb_pready   (apb_pready                  ),
  .apb_pslverr  (apb_pslverr                 ),
  .apb_prdata   (apb_prdata                  )
);

parameter [5:0] PER_ENABLE = { ENABLE_CMP0, ENABLE_DAC1, ENABLE_DAC0, ENABLE_ADC2, ENABLE_ADC1, ENABLE_ADC0 };
wire [5:0] select = 1 << (apb_paddr[ADDR_BITS-1:PER_BITS]);

wire                 per_psel[6];
wire                 per_penable[6];
wire                 per_pwrite[6];
wire [PER_BITS-1:0]  per_paddr[6];
wire [DATA_BITS-1:0] per_pwdata[6];
wire [DATA_BITS-1:0] per_prdata[6];

wire [5:0] dma_req;
wire [5:0] dma_clr;

// EXT_DMA0: ADC0
// EXT_DMA1: ADC1
// EXT_DMA2: ADC2 + DAC1 (shared)
// EXT_DMA3: DAC0
assign ext_dma_DMACBREQ  = dma_req[3:0] | (dma_req[4] << 2);
assign dma_clr           = {ext_dma_DMACCLR[2], ext_dma_DMACCLR[3:0]};

genvar i;
generate
  for (i = 0; i < 6; i = i + 1) begin : gen_per
    assign per_psel[i]    = apb_psel    & select[i];
    assign per_penable[i] = apb_penable & select[i];
    assign per_pwrite[i]  = apb_pwrite;
    assign per_paddr[i]   = apb_paddr[PER_BITS-1:0];
    assign per_pwdata[i]  = apb_pwdata;
    if (!PER_ENABLE[i]) begin
      assign dma_req[i]    = 1'b0;
      assign per_prdata[i] = 32'h0;
    end else if (i < 3) begin : gen_adc
      apb_adc #(ADC_SEQ_MAX) adc_inst(
        .stop       (stop          ),
        .dma_req    (dma_req[i]    ),
        .dma_clr    (dma_clr[i]    ),
        .apb_clock  (apb_clock     ),
        .apb_resetn (resetn        ),
        .apb_psel   (per_psel[i]   ),
        .apb_penable(per_penable[i]),
        .apb_pwrite (per_pwrite[i] ),
        .apb_paddr  (per_paddr[i]  ),
        .apb_pwdata (per_pwdata[i] ),
        .apb_prdata (per_prdata[i] )
      );
    end else if (i < 5) begin : gen_dac
      apb_dac dac_inst(
        .stop       (stop          ),
        .dma_req    (dma_req[i]    ),
        .dma_clr    (dma_clr[i]    ),
        .apb_clock  (apb_clock     ),
        .apb_resetn (resetn        ),
        .apb_psel   (per_psel[i]   ),
        .apb_penable(per_penable[i]),
        .apb_pwrite (per_pwrite[i] ),
        .apb_paddr  (per_paddr[i]  ),
        .apb_pwdata (per_pwdata[i] ),
        .apb_prdata (per_prdata[i] )
      );
    end else begin : gen_cmp
      apb_cmp cmp_inst(
        .stop       (stop          ),
        .apb_clock  (apb_clock     ),
        .apb_resetn (resetn        ),
        .apb_psel   (per_psel[i]   ),
        .apb_penable(per_penable[i]),
        .apb_pwrite (per_pwrite[i] ),
        .apb_paddr  (per_paddr[i]  ),
        .apb_pwdata (per_pwdata[i] ),
        .apb_prdata (per_prdata[i] )
      );
    end
  end
endgenerate

reg [5:0] pr_select; // These extra registers provide better timing to apb_prdata (ahb_hrdata)
always @ (posedge apb_clock or negedge resetn) begin
  if (!resetn) begin
    pr_select <= 'b0;
  end else if (apb_psel && !apb_penable) begin
    pr_select <= select;
  end
end

integer j;
always @ (*) begin
  apb_prdata = 0;
  for (j = 0; j < 6; j = j + 1) begin
    apb_prdata = apb_prdata | (pr_select[j] ? per_prdata[j] : 0);
  end
end

endmodule

module apb_adc #(parameter SEQ_MAX = 8) (
  input         stop,
  output        dma_req,
  input         dma_clr,
  input         apb_clock,
  input         apb_resetn,
  input         apb_psel,
  input         apb_penable,
  input         apb_pwrite,
  input  [11:0] apb_paddr,
  input  [31:0] apb_pwdata,
  output [31:0] apb_prdata
);
parameter SCLK_BIT = 16;

parameter ADDR_CTRL = 'h00;
parameter ADDR_STAT = 'h04;
parameter ADDR_DATA = 'h08;
parameter ADDR_CHNL = 'h3C;
parameter ADDR_SEQ0 = 'h40;

wire is_seq_addr = apb_paddr[11:6] == (ADDR_SEQ0 >> 6);
wire [3:0] seq_idx = apb_paddr[5:2];

reg adc_en;
reg apb_eoc;
reg [11:0] apb_db;
wire adc_eoc;
wire [11:0] adc_db;
wire eoc_rising = !adc_eoc && !apb_eoc;
wire apb_data_phase = apb_psel && apb_penable;

reg ctrl_adc_start;       // Write 1 to set. Self clear with ctrl_adc_stop or eoc in non-continuous mode.
reg ctrl_adc_stop;        // Write 1 to stop adc
reg ctrl_adc_cont;        // Continous mode
reg ctrl_adc_dmaen;       // DMA enable
reg [SCLK_BIT-1:0] ctrl_sclk_div; // Sclk is divided by (ctrl_sclk_div + 1) * 2 from apb_clock
`define ADC_CTRL_REG {ctrl_sclk_div, 12'b0, ctrl_adc_dmaen, ctrl_adc_cont, ctrl_adc_stop, ctrl_adc_start}

reg stat_adc_eoc;
`define ADC_STAT_REG {stat_adc_eoc, adc_en}

reg seq_last;
reg [3:0] seq_length;
reg [4:0] seq_reg [SEQ_MAX];
reg [3:0] seq_cnt;
wire [4:0] chnl_sel;
`define ADC_CHNL_REG {chnl_sel, seq_cnt, seq_length}

wire seq_done = apb_eoc && seq_last;
wire adc_stop = ctrl_adc_stop || (seq_done && !ctrl_adc_cont);
always @ (posedge apb_clock or negedge apb_resetn) begin
  if (!apb_resetn) begin
    ctrl_adc_start <= 1'b0;
    ctrl_adc_stop  <= 1'b0;
    ctrl_adc_cont  <= 1'b0;
    ctrl_adc_dmaen <= 1'b0;
    ctrl_sclk_div  <= 'b0;
  end else if (apb_data_phase && apb_pwrite && apb_paddr == ADDR_CTRL) begin
    ctrl_adc_start <= apb_pwdata[0] | ctrl_adc_start;
    ctrl_adc_stop  <= apb_pwdata[1] | ctrl_adc_stop;
    ctrl_adc_cont  <= apb_pwdata[2];
    ctrl_adc_dmaen <= apb_pwdata[3];
    ctrl_sclk_div  <= apb_pwdata[31:32-SCLK_BIT];
  end else begin
    if (adc_stop) begin
      ctrl_adc_start <= 1'b0;
      ctrl_adc_stop  <= 1'b0;
    end
  end
end

always @ (posedge apb_clock or negedge apb_resetn) begin
  if (!apb_resetn) begin
    apb_eoc <= 1'b0;
  end else begin
    apb_eoc <= !adc_eoc;
  end
end

always @ (posedge apb_clock or negedge apb_resetn) begin
  if (!apb_resetn) begin
    apb_db <= 12'b0;
  end else if (adc_en && eoc_rising) begin
    apb_db <= adc_db;
  end
end

reg adc_restart;
always @ (posedge apb_clock or negedge apb_resetn) begin
  if (!apb_resetn) begin
    adc_restart <= 'h0;
  end else if (apb_data_phase && apb_pwrite && (apb_paddr == ADDR_CHNL || is_seq_addr)) begin
    adc_restart <= 1'b1;
  end else if (adc_restart) begin
    adc_restart <= 1'b0;
  end
end

always @ (posedge apb_clock or negedge apb_resetn) begin
  if (!apb_resetn) begin
    stat_adc_eoc <= 1'b0;
  end else if (apb_data_phase && apb_pwrite && apb_paddr == ADDR_STAT && apb_pwdata[0] == 1'b0) begin
    stat_adc_eoc <= 1'b0;
  end else if (apb_data_phase && !apb_pwrite && apb_paddr == ADDR_DATA) begin
    stat_adc_eoc <= 1'b0;
  end else if (seq_done) begin
    stat_adc_eoc <= 1'b1;
  end
end

always @ (posedge apb_clock or negedge apb_resetn) begin
  if (!apb_resetn) begin
    seq_length <= 'h0;
  end else if (apb_data_phase && apb_pwrite && apb_paddr == ADDR_CHNL) begin
    seq_length <= apb_pwdata[3:0];
  end
end

genvar i;
generate
  for (i = 0; i < SEQ_MAX; i = i + 1) begin : gen_seq
    always @ (posedge apb_clock or negedge apb_resetn) begin
      if (!apb_resetn) begin
        seq_reg[i] <= 'h0;
      end else if (apb_data_phase && apb_pwrite && is_seq_addr && seq_idx == i) begin
        seq_reg[i] <= apb_pwdata[4:0];
      end
    end
  end
endgenerate

wire adc_seq_next;
always @ (posedge apb_clock or negedge apb_resetn) begin
  if (!apb_resetn) begin
    seq_last <= 1'b0;
  end else if (apb_eoc) begin
    seq_last <= 1'b0;
  end else if (adc_seq_next && seq_cnt == seq_length) begin
    seq_last <= 1'b1;
  end
end

always @ (posedge apb_clock or negedge apb_resetn) begin
  if (!apb_resetn) begin
    seq_cnt <= 0;
  end else if (!ctrl_adc_start || seq_last) begin
    seq_cnt <= 0;
  end else if (adc_seq_next) begin
    seq_cnt <= seq_cnt + 1;
  end
end
assign chnl_sel = seq_reg[seq_cnt];

wire [31:0] ctrl_read = apb_paddr == ADDR_CTRL ? `ADC_CTRL_REG : 0;
wire [31:0] stat_read = apb_paddr == ADDR_STAT ? `ADC_STAT_REG : 0;
wire [31:0] chnl_read = apb_paddr == ADDR_CHNL ? `ADC_CHNL_REG : 0;
wire [31:0] data_read = apb_paddr == ADDR_DATA ? apb_db        : 0;
wire [31:0] seq_read  = is_seq_addr ? seq_reg[seq_idx] : 0;

reg [31:0] prdata;
always @ (posedge apb_clock or negedge apb_resetn) begin
  if (!apb_resetn) begin
    prdata <= 32'h0;
  end else if (apb_psel && !apb_penable && !apb_pwrite) begin
    prdata <= ctrl_read | stat_read | chnl_read | data_read | seq_read;
  end
end
assign apb_prdata = prdata;

reg [3:0] adc_state;
// Pause sclk_en when DMA is in action
wire sclk_en = ctrl_adc_start && (ctrl_adc_cont || !stat_adc_eoc) && (!dma_req && !dma_clr || adc_state < 10);
reg [SCLK_BIT-1:0] sclk_counter;
reg sclk;
always @ (posedge apb_clock or negedge apb_resetn) begin
  if (!apb_resetn) begin
    sclk_counter <= 0;
    sclk <= 1'b0;
  end else if (!adc_en) begin
    sclk_counter <= 0;
    sclk <= 1'b0;
  end else if (sclk_en) begin
    if (sclk_counter == ctrl_sclk_div) begin
      sclk_counter <= 0;
      sclk         <= !sclk;
    end else begin
      sclk_counter <= sclk_counter + 1;
    end
  end
end
wire sclk_rising = sclk_en && !sclk && sclk_counter == ctrl_sclk_div;

assign adc_seq_next = adc_state == 4 && sclk_rising;
always @ (posedge apb_clock or negedge apb_resetn) begin
  if (!apb_resetn) begin
    adc_state <= 0;
  end else if (!adc_en || apb_eoc) begin
    adc_state <= 0;
  end else if (sclk_rising) begin
    adc_state <= adc_state + 1;
  end
end

always @ (posedge apb_clock or negedge apb_resetn) begin
  if (!apb_resetn) begin
    adc_en <= 1'b0;
  end else if (adc_stop || adc_restart) begin
    adc_en <= 1'b0;
  end else if (ctrl_adc_start) begin
    adc_en <= 1'b1;
  end
end

reg dma_reg;
always @ (posedge apb_clock or negedge apb_resetn) begin
  if (!apb_resetn) begin
    dma_reg <= 1'b0;
  end else if (!ctrl_adc_dmaen || dma_clr) begin
    dma_reg <= 1'b0;
  end else if (ctrl_adc_dmaen && eoc_rising) begin
    dma_reg <= 1'b1;
  end
end
assign dma_req = dma_reg;

alta_adc adc_inst(
  .enb  (!adc_en ),
  .sclk (sclk    ),
  .insel(chnl_sel),
  .stop (stop    ),
  .db   (adc_db  ),
  .eoc  (adc_eoc )
);
endmodule

module apb_dac (
  input         stop,
  output        dma_req,
  input         dma_clr,
  input         apb_clock,
  input         apb_resetn,
  input         apb_psel,
  input         apb_penable,
  input         apb_pwrite,
  input  [11:0] apb_paddr,
  input  [31:0] apb_pwdata,
  output [31:0] apb_prdata
);
parameter SCLK_BIT = 16;

parameter ADDR_CTRL = 'h00;
parameter ADDR_DATA = 'h04;

wire apb_data_phase = apb_psel && apb_penable;

reg ctrl_dac_en, ctrl_dac_bufen, ctrl_dac_dmaen;
reg [SCLK_BIT-1:0] ctrl_sclk_div; // Sclk is divided by (ctrl_sclk_div + 1) from apb_clock
`define DAC_CTRL_REG {ctrl_sclk_div, 13'b0, ctrl_dac_dmaen, ctrl_dac_bufen, ctrl_dac_en}

reg [9:0] dac_din;

always @ (posedge apb_clock or negedge apb_resetn) begin
  if (!apb_resetn) begin
    ctrl_dac_en    <= 'b0;
    ctrl_dac_bufen <= 'b0;
    ctrl_dac_dmaen <= 'b0;
    ctrl_sclk_div  <= 'b0;
  end else if (apb_data_phase && apb_pwrite && apb_paddr == ADDR_CTRL) begin
    ctrl_dac_en    <= apb_pwdata[0];
    ctrl_dac_bufen <= apb_pwdata[1];
    ctrl_dac_dmaen <= apb_pwdata[2];
    ctrl_sclk_div  <= apb_pwdata[31:16];
  end
end

always @ (posedge apb_clock or negedge apb_resetn) begin
  if (!apb_resetn) begin
    dac_din <= 'b0;
  end else if (apb_data_phase && apb_pwrite && apb_paddr == ADDR_DATA) begin
    dac_din <= apb_pwdata[9:0];
  end
end

wire [31:0] ctrl_read = apb_paddr == ADDR_CTRL ? `DAC_CTRL_REG : 0;
wire [31:0] data_read = apb_paddr == ADDR_DATA ? dac_din       : 0;

reg [31:0] prdata;
always @ (posedge apb_clock or negedge apb_resetn) begin
  if (!apb_resetn) begin
    prdata <= 32'h0;
  end else if (apb_psel && !apb_penable && !apb_pwrite) begin
    prdata <= ctrl_read | data_read;
  end
end
assign apb_prdata = prdata;

reg [SCLK_BIT-1:0] sclk_counter;
wire sclk_pulse = sclk_counter == 0;
always @ (posedge apb_clock or negedge apb_resetn) begin
  if (!apb_resetn) begin
    sclk_counter <= 'b0;
  end else if (!ctrl_dac_dmaen || sclk_pulse) begin
    sclk_counter <= ctrl_sclk_div;
  end else begin
    sclk_counter <= sclk_counter - 1;
  end
end

reg dma_reg;
always @ (posedge apb_clock or negedge apb_resetn) begin
  if (!apb_resetn) begin
    dma_reg <= 1'b0;
  end else if (!ctrl_dac_dmaen || dma_clr) begin
    dma_reg <= 1'b0;
  end else if (ctrl_dac_dmaen && sclk_pulse) begin
    dma_reg <= 1'b1;
  end
end
assign dma_req = dma_reg;

alta_dac dac_inst(
  .enb   (!ctrl_dac_en   ),
  .bufenb(!ctrl_dac_bufen),
  .din   (dac_din        ),
  .stop  (stop           ),
  .dout  (dac_dout       )
);
endmodule

module apb_cmp (
  input         stop,
  input         apb_clock,
  input         apb_resetn,
  input         apb_psel,
  input         apb_penable,
  input         apb_pwrite,
  input  [11:0] apb_paddr,
  input  [31:0] apb_pwdata,
  output [31:0] apb_prdata
);
parameter ADDR_CTRL = 'h00;
parameter ADDR_CHNL = 'h04;
parameter ADDR_DATA = 'h08;

reg cmp_en1, cmp_en2, cmp_hyst1, cmp_hyst2, cmp_mode1, cmp_mode2;
reg [2:0] cmp_imsel1, cmp_imsel2;
reg [1:0] cmp_ipsel1, cmp_ipsel2;
wire cmp_out1, cmp_out2;
`define CMP_CTRL_REG {cmp_mode2, cmp_hyst2, cmp_en2, 5'b0, cmp_mode1, cmp_hyst1, cmp_en1}
`define CMP_CHNL_REG {cmp_imsel2, 2'b0, cmp_ipsel2, 1'b0, cmp_imsel1, 2'b0, cmp_ipsel1}
`define CMP_DATA_REG {cmp_out2, 7'b0, cmp_out1}

alta_cmp cmp(
  .enb1  (!cmp_en1  ),
  .enb2  (!cmp_en2  ),
  .hyst1 (cmp_hyst1 ),
  .hyst2 (cmp_hyst2 ),
  .mode1 (cmp_mode1 ),
  .mode2 (cmp_mode2 ),
  .stop  (stop      ),
  .imsel1(cmp_imsel1),
  .imsel2(cmp_imsel2),
  .ipsel1(cmp_ipsel1),
  .ipsel2(cmp_ipsel2),
  .out1  (cmp_out1  ),
  .out2  (cmp_out2  )
);

wire apb_data_phase = apb_psel && apb_penable;
always @ (posedge apb_clock or negedge apb_resetn) begin
  if (!apb_resetn) begin
    cmp_en1   <= 'b0;
    cmp_hyst1 <= 'b0;
    cmp_mode1 <= 'b0;
    cmp_en2   <= 'b0;
    cmp_hyst2 <= 'b0;
    cmp_mode2 <= 'b0;
  end else if (apb_data_phase && apb_pwrite && apb_paddr == ADDR_CTRL) begin
    cmp_en1   <= apb_pwdata[0];
    cmp_hyst1 <= apb_pwdata[1];
    cmp_mode1 <= apb_pwdata[2];
    cmp_en2   <= apb_pwdata[8];
    cmp_hyst2 <= apb_pwdata[9];
    cmp_mode2 <= apb_pwdata[10];
  end
end

always @ (posedge apb_clock or negedge apb_resetn) begin
  if (!apb_resetn) begin
    cmp_ipsel1 <= 'b0;
    cmp_imsel1 <= 'b0;
    cmp_ipsel2 <= 'b0;
    cmp_imsel2 <= 'b0;
  end else if (apb_data_phase && apb_pwrite && apb_paddr == ADDR_CHNL) begin
    cmp_ipsel1 <= apb_pwdata[1:0];
    cmp_imsel1 <= apb_pwdata[6:4];
    cmp_ipsel2 <= apb_pwdata[9:8];
    cmp_imsel2 <= apb_pwdata[14:12];
  end
end

wire [31:0] ctrl_read = apb_paddr == ADDR_CTRL ? `CMP_CTRL_REG : 0;
wire [31:0] chnl_read = apb_paddr == ADDR_CHNL ? `CMP_CHNL_REG : 0;
wire [31:0] data_read = apb_paddr == ADDR_DATA ? `CMP_DATA_REG : 0;

reg [31:0] prdata;
always @ (posedge apb_clock or negedge apb_resetn) begin
  if (!apb_resetn) begin
    prdata <= 32'h0;
  end else if (apb_psel && !apb_penable && !apb_pwrite) begin
    prdata <= ctrl_read | chnl_read | data_read;
  end
end
assign apb_prdata = prdata;
endmodule
