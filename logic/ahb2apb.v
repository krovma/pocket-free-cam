module ahb2apb #(parameter integer
  ADDR_BITS = 32,
  DATA_BITS = 32
) (
  input                  reset,
  input                  ahb_clock,
  input                  ahb_hmastlock,
  input  [1:0]           ahb_htrans,
  input                  ahb_hsel,
  input                  ahb_hready,
  input                  ahb_hwrite,
  input  [ADDR_BITS-1:0] ahb_haddr,
  input  [2:0]           ahb_hsize,
  input  [2:0]           ahb_hburst,
  input  [3:0]           ahb_hprot,
  input  [DATA_BITS-1:0] ahb_hwdata,
  output [DATA_BITS-1:0] ahb_hrdata,
  output                 ahb_hreadyout,
  output                 ahb_hresp,
  input                  apb_clock,
  output                 apb_psel,
  output                 apb_penable,
  output                 apb_pwrite,
  output [ADDR_BITS-1:0] apb_paddr,
  output [DATA_BITS-1:0] apb_pwdata,
  output [3:0]           apb_pstrb,
  output [2:0]           apb_pprot,
  input                  apb_pready,
  input                  apb_pslverr,
  input  [DATA_BITS-1:0] apb_prdata
);
localparam apbIdle = 2'b00;
localparam apbSetup = 2'b01;
localparam apbAccess = 2'b10;

reg [1:0] apbState;
reg psel;
reg penable;
reg pwrite;
reg [ADDR_BITS-1:0] paddr;
reg [3:0] pstrb;
reg [DATA_BITS-1:0] prdata;
reg pvalid;
reg pdone;

reg [ADDR_BITS-1:0] haddr;
reg hreadyout;
reg hresp;
reg hwrite;
reg [2:0] hsize;
reg hdone;
wire [3:0] ahb_strb = hwrite ? (~(~1'b0 << (1 << hsize)) << haddr[1:0]) : 'b0;

wire apb_pdone = psel && penable && apb_pready;

always @ (posedge ahb_clock or posedge reset) begin
  if (reset) begin
    hreadyout <= 1'b1;
    haddr <= 0;
    hwrite <= 1'b0;
    hsize <= 3'b0;
  end else if (ahb_hsel && ahb_htrans[1] && hreadyout && !hresp) begin
    hreadyout <= 1'b0;
    haddr <= ahb_haddr;
    hwrite <= ahb_hwrite;
    hsize <= ahb_hsize;
  end else if (pdone && !hdone || hresp) begin
    // hdone is used to prevent hreadyout going high due to pdone from previous access
    hreadyout <= 1'b1;
  end
end

always @ (posedge ahb_clock or posedge reset) begin
  if (reset) begin
    hdone <= 1'b1;
  end else if (hreadyout) begin
    hdone <= 1'b1;
  end else if (pvalid) begin
    hdone <= 1'b0;
  end
end

always @ (posedge apb_clock or posedge reset) begin
  if (reset) begin
    pvalid <= 1'b0;
  end else if (!hreadyout && !(psel || pdone)) begin
    pvalid <= 1'b1;
  end else begin
    pvalid <= 1'b0;
  end
end

always @ (posedge apb_clock or posedge reset) begin
  if (reset) begin
    pdone <= 1'b0;
  end else if (pdone) begin
    pdone <= 1'b0;
  end else if (apb_pdone) begin
    pdone <= 1'b1;
  end
end

always @ (posedge apb_clock or posedge reset) begin
  if (reset) begin
    apbState <= apbIdle;
    psel     <= 'b0;
    penable  <= 'b0;
    pwrite   <= 'b0;
    paddr    <= 'h0;
    pstrb    <= 'h0;
  end else begin
    case (apbState)
      apbIdle: begin // idle => setup
        if (pvalid) begin
          apbState <= apbSetup;
          psel     <= 'b1;
          pwrite   <= hwrite;
          paddr    <= {haddr[ADDR_BITS-1:2], 2'b00};
          pstrb    <= ahb_strb;
        end
      end
      apbSetup: begin // setup => access
        apbState <= apbAccess;
        penable  <= 'b1;
      end
      apbAccess: begin // access => setup or idle
        if (apb_pready) begin
          if (pvalid) begin // => setup
            apbState <= apbSetup;
            penable  <= 'b0;
            psel     <= 'b1;
            pwrite   <= hwrite;
            paddr    <= {haddr[ADDR_BITS-1:2], 2'b00};
            pstrb    <= ahb_strb;
          end else begin // => idle
            apbState <= apbIdle;
            penable  <= 'b0;
            psel     <= 'b0;
          end
        end
      end
    endcase
  end
end

always @ (posedge apb_clock or posedge reset) begin
  if (reset) begin
    prdata <= 'b0;
  end else if (apb_pdone) begin
    prdata <= apb_prdata;
  end
end

always @ (posedge ahb_clock or posedge reset) begin
  if (reset) begin
    hresp <= 1'b0;
  end else if (ahb_hready) begin
    hresp <= 1'b0;
  end else if (apb_pdone & apb_pslverr) begin
    hresp <= 1'b1;
  end
end


assign ahb_hreadyout = hreadyout;
assign ahb_hresp     = hresp;
assign ahb_hrdata    = prdata;

assign apb_psel    = psel;
assign apb_penable = penable;
assign apb_pwrite  = pwrite;
assign apb_paddr   = paddr;
assign apb_pprot   = 3'b001;
assign apb_pwdata  = ahb_hwdata;
assign apb_pstrb   = pstrb;

endmodule
