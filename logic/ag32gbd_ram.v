`default_nettype none
`timescale 1ps/1ps

module ag32gbd_ram (
    input       [15:0]    Cart_a,
    inout       [7:0]     Cart_d,
    input                 Cart_nWR,
    input                 Cart_nCS,

    input                 sys_resetn,
    input                 sys_clock,

    output      [16:13]  Ram_a,
    output               Ram_nCS,
    output               Ram_nWE,

    output      [4:0]    Ram_Bank_Id
);

reg [4:0] ram_bank_id = 5'b0;
reg ram_wren = 1'b0;
reg [1:0] last_nWR = 2'b11;

wire is_ram_bank_id_addr = (Cart_a[15:13] == 3'b010);
wire is_ram_wren_addr = (Cart_a[15:13] == 3'b000);
wire is_accessing_ram_addr = (Cart_a[15:13] == 3'b101);

always @(negedge sys_resetn or posedge sys_clock) begin
    if (!sys_resetn) begin
        last_nWR <= 2'b11;
    end else begin 
        last_nWR[1] <= last_nWR[0];
        last_nWR[0] <= Cart_nWR;
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
        ram_bank_id <= 5'b0;
    end else begin
        if (last_nWR[1] && !last_nWR[0]) begin // negedge of ~WR
            if (is_ram_bank_id_addr) begin
                ram_bank_id [4:0] <= Cart_d[4:0];
            end
        end
    end
end


wire is_ram_bank = (ram_bank_id[4] == 1'b0);
assign Ram_a[16:13] = ram_bank_id[3:0];
assign Ram_nCS = (is_accessing_ram_addr && is_ram_bank) ? Cart_nCS : 1'b1;
assign Ram_nWE = ram_wren ? Cart_nWR : 1'b1;
assign Ram_Bank_Id[4:0] = ram_bank_id[4:0];

endmodule
`default_nettype wire