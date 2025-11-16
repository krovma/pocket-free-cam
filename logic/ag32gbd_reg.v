`default_nettype none
`timescale 1ps/1ps

// gameboy bus i/o for writing Cam regs, and read result of a000

module ag32gbd_reg (
    input       [15:0]    Cart_a,
    inout       [7:0]     Cart_d,
    input                 Cart_nRD,
    input                 Cart_nWR,
    input                 Cart_nCS,

    input                 sys_resetn,
    input                 sys_clock,

    input       [4:0]     Ram_bank_id,
    input                 Sig_CamCaptureFinish,

    output  reg           Reg_OutputValid,
    output  reg [7:0]     Reg_OutputData,
    output  reg           Bram_Req_Write,
    output  reg [9:0]     Bram_Addr,
    output  reg [7:0]     Bram_Data,

    output  reg [7:0]     Reg_A000,
    output  reg [7:0]     Reg_A001,
    output  reg [7:0]     Reg_A002,
    output  reg [7:0]     Reg_A003,
    output  reg [7:0]     Reg_A004,
    output  reg [7:0]     Reg_A005,

    output  wire          Cam_Capture
);

reg [2:0] bram_signal_reset_cnt;

wire is_accessing_ram_addr = (Cart_a[15:13] == 3'b101 && !Cart_nCS);
wire is_accessing_reg = (Ram_bank_id == 5'h10 && is_accessing_ram_addr);
wire [6:0] reg_addr = Cart_a[6:0]; // only low 7-bit address is valid for reg, reg loops per 80h

reg [1:0] last_nWR = 2'b11;
reg [1:0] last_nCS = 2'b11;
reg [1:0] last_CamCaptureFinish = 2'b00;

function [9:0] RegAddrToBramAddr;
    input [6:0] RegAddr;
    RegAddrToBramAddr = (RegAddr - 7'd6) | 10'h200;
endfunction

always @(negedge sys_resetn or posedge sys_clock) begin
    if (!sys_resetn) begin
        last_nWR <= 2'b11;
    end else begin 
        last_nWR[1:0] <= {last_nWR[0], Cart_nWR};
    end
end

always @(negedge sys_resetn or posedge sys_clock) begin
    if (!sys_resetn) begin
        last_nCS <= 2'b11;
    end else begin 
        last_nCS[1:0] <= {last_nCS[0], Cart_nCS};
    end
end

always @(negedge sys_resetn or posedge sys_clock) begin
    if (!sys_resetn) begin
        last_CamCaptureFinish <= 2'b00;
    end else begin 
        last_CamCaptureFinish[1:0] <= {last_CamCaptureFinish[0], Sig_CamCaptureFinish};
    end
end

always @(negedge sys_resetn or posedge sys_clock) begin
    if (!sys_resetn) begin
        Bram_Req_Write <= 1'b0;
        Bram_Addr <= 10'b0;
        Bram_Data <= 8'b0;
        bram_signal_reset_cnt <= 3'b0;

        Reg_A000 <= 8'b0;
        Reg_A001 <= 8'b0;
        Reg_A002 <= 8'b0;
        Reg_A003 <= 8'b0;
        Reg_A004 <= 8'b0;
        Reg_A005 <= 8'b0;
    end else begin
        if (Bram_Req_Write) begin
            if (bram_signal_reset_cnt == 3'd7) begin
                bram_signal_reset_cnt <= 3'b0;
                Bram_Req_Write <= 1'b0;
                Bram_Data <= 8'b0;
            end else begin
                bram_signal_reset_cnt = bram_signal_reset_cnt + 3'd1;
            end
        end else begin
            if (last_nWR[1] && !last_nWR[0]) begin // negedge of nWR
                if (is_accessing_reg) begin
                    // write reg or bram
                    case(reg_addr)
                        7'h00: Reg_A000[7:0] <= Cart_d[7:0];
                        7'h01: Reg_A001[7:0] <= Cart_d[7:0];
                        7'h02: Reg_A002[7:0] <= Cart_d[7:0];
                        7'h03: Reg_A003[7:0] <= Cart_d[7:0];
                        7'h04: Reg_A004[7:0] <= Cart_d[7:0];
                        7'h05: Reg_A005[7:0] <= Cart_d[7:0];
                        default: begin
                            Bram_Req_Write <= 1'b1;
                            Bram_Addr <= RegAddrToBramAddr(reg_addr);
                            Bram_Data <= Cart_d[7:0];
                        end
                    endcase
                end
            end // if negedge of nWR
        end // bram_req_write
        
        if (!last_CamCaptureFinish[1] && last_CamCaptureFinish[0]) begin
            Reg_A000[7:0] <= 8'd0;
        end
    end
end //always

always @(negedge sys_resetn or posedge sys_clock) begin
    if (!sys_resetn) begin
        Reg_OutputValid <= 1'b0;
        Reg_OutputData <= 8'b0;
    end else begin
        if (!Cart_nRD) begin
            if (last_nCS[1] && !last_nCS[0]) begin // negedge of nCS
                    if (is_accessing_reg) begin
                        if (reg_addr == 7'h00) begin
                            Reg_OutputValid <= 1'b1;
                            Reg_OutputData[7:0] <= Reg_A000[7:0];
                        end else begin
                            Reg_OutputValid <= 1'b1;
                            Reg_OutputData[7:0] <= 8'b0;
                        end
                    end
            end else if (!last_nCS[1] && last_nCS[0]) begin // posedge of nCS
                if (Reg_OutputValid) begin
                    Reg_OutputValid <= 1'b0;
                    Reg_OutputData[7:0] <= 8'b0;
                end
            end
        end // read
    end
end

assign Cam_Capture = Reg_A000[0];

endmodule

`default_nettype wire
