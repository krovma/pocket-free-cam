`default_nettype none
`timescale 1ps/1ps

/*
 * Writing SRAM bank0[000-FFF]
 */

module ag32gbd_ram_write (
    input                 sys_resetn,
    input                 sys_clock,
    input                 cart_CLK,


    output   reg           Gbd_Writing_Ram,
    output   reg [11:0]    Ram_Writing_Addr_Low,
    output   reg [7:0]     Ram_Writing_Data,
    output   reg           Ram_Writing_nCS,
    output   reg           Ram_Writing_nWE,

    output   reg           RequestReadBuffer,
    output   reg [9:0]     ReadBufferOffset,
    input                  BufferDataReady,
    input                  BufferReadResult
);

always @(negedge sys_resetn or posedge sys_clock) begin
    if (!sys_resetn) begin
        Gbd_Writing_Ram <= 1'b0;
        Ram_Writing_Addr_Low <= 12'bz;
        Ram_Writing_Data <= 8'bz;
        Ram_Writing_nCS <= 1'b1;
        Ram_Writing_nWE <= 1'b1;
        RequestReadBuffer <= 1'b0;
        ReadBufferOffset <= 10'b0;
    end
end

endmodule
`default_nettype wire