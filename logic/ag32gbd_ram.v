`default_nettype none
`timescale 1ps/1ps

module ag32gbd_ram (
    input       [15:0]    Cart_a,
    inout       [7:0]     Cart_d,
    input                 Cart_nWR,
    input                 Cart_nRD,
    input                 Cart_nCS,
    input                 sys_resetn,
    input                 sys_clock,

    input                is_gbd_writing_ram,
    input       [7:0]    in_Writing_dq,
    input       [11:0]   in_Writing_Addr_low,
    input                in_Writing_nCS,
    input                in_Writing_nWE,

    output               is_accessing_ram,
    output      [16:0]   Ram_addr,
    inout       [7:0]    Ram_dq,
    output               Ram_nCS,
    output               Ram_nWE,
    output               Ram_nRD,

    output      [4:0]    Ram_Bank_Id,
    output      [7:0]    Ram_output_to_cart
);

reg [4:0] regRamBankId = 5'b0;
reg ram_wren = 1'b0;
reg [1:0] last_nWR = 2'b11;


wire is_ram_bank_id_addr = (Cart_a[15:13] == 3'b010);
wire is_ram_wren_addr = (Cart_a[15:13] == 3'b000);
wire is_accessing_ram_addr = (Cart_a[15:13] == 3'b101);

always @(negedge sys_resetn or posedge sys_clock) begin
    if (!sys_resetn) begin
        last_nWR <= 2'b11;
    end else begin 
        last_nWR[1:0] <= {last_nWR[0], Cart_nWR};
    end
end


always @(negedge sys_resetn or posedge sys_clock) begin
    if (!sys_resetn) begin
        ram_wren <= 1'b0;
    end else begin
        if (last_nWR[1] && !last_nWR[0]) begin // negedge of ~WR
            if (is_ram_wren_addr) begin
                if (Cart_d[3:0] == 4'hA) begin
                    ram_wren <= 1'b1;
                end else begin
                    ram_wren <= 1'b0;
                end
            end
        end
    end
end

always @(negedge sys_resetn or posedge sys_clock) begin
    if (!sys_resetn) begin
        regRamBankId <= 5'b0;
    end else begin
        if (last_nWR[1] && !last_nWR[0]) begin // negedge of ~WR
            if (is_ram_bank_id_addr) begin
                regRamBankId [4:0] <= Cart_d[4:0];
            end
        end
    end
end


wire is_ram_bank = (regRamBankId[4] == 1'b0);
assign is_accessing_ram = is_accessing_ram_addr && is_ram_bank;

assign Ram_addr[16:0] = 
    is_gbd_writing_ram
    ? {5'b00000, in_Writing_Addr_low[11:0]}
    : {regRamBankId[3:0], Cart_a[12:0]};
    //  16:13        12         11:0
assign Ram_nCS      = is_gbd_writing_ram ? (in_Writing_nCS)              : (is_accessing_ram ? Cart_nCS : 1'b1);
assign Ram_nWE      = is_gbd_writing_ram ? (in_Writing_nWE)              : (ram_wren ? Cart_nWR : 1'b1);
assign Ram_nRD      = is_gbd_writing_ram ? (1'b1)                        : (!Cart_nCS ? Cart_nRD : 1'b1);
assign Ram_dq[7:0]  = is_gbd_writing_ram ? (in_Writing_dq[7:0])          : ((!Ram_nCS && !Ram_nWE) ? Cart_d[7:0] : 8'bz);

assign Ram_Bank_Id[4:0] = regRamBankId[4:0];
assign Ram_output_to_cart[7:0] =
    is_gbd_writing_ram
    ? (8'b0)
    : ((is_accessing_ram && !Ram_nCS && !Cart_nRD) ? Ram_dq[7:0] : 8'b0);

endmodule
`default_nettype wire