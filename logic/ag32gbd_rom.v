`default_nettype none
`timescale 1ps/1ps

module ag32gbd_rom (
    input       [15:0]    Cart_a,
    inout       [7:0]     Cart_d,
    input                 Cart_nWR,

    input                 sys_resetn,
    input                 sys_clock,

    output [22:14]        Rom_a,
    output                Rom_nCS
);

reg [5:0] bank_id = 6'h01; // default select bank 01
reg [1:0] last_nWR = 2'b11;

wire is_rom_addr = (Cart_a[15] == 1'b0); // 0000-7FFF
wire is_rom_bank0_addr = (Cart_a[15:14] == 2'b0); // 0000-3FFF
wire is_rom_bank_id = (Cart_a[15:13] == 3'b001); // 2000-3FFF

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
        bank_id <= 6'h01;
    end else begin
        if (last_nWR[1] && !last_nWR[0]) begin // negedge of ~WR
            if (is_rom_bank_id) begin
                bank_id[5:0] <= Cart_d[5:0];
            end
        end
    end
end

wire [22:14] rom_addr_high = {3'b000, bank_id[5:0]};
assign Rom_nCS = Cart_a[15]; //!is_rom_addr;
assign Rom_a[22:14] = is_rom_bank0_addr ? 9'b0 : rom_addr_high[22:14];

endmodule
`default_nettype wire
