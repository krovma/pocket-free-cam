`default_nettype none
`timescale 1ps/1ps

// sample a single pixel
module ag32gbd_sampler(
    input sys_clock,  // 100MHz
    input adc_clock,  // 12.5MHz
    input sys_resetn,
    
    input       SampleStart,
    input [6:0] PixelX,
    input [6:0] PixelY,

    output reg          RequestReadReg,
    output reg [9:0]    RegReadAddr,
    input      [7:0]    RegReadOutput,
    input               RegReadDone,

    output              SampleDone,
    output reg [1:0]    SampledValue
);

reg adc_en;
wire [11:0] adc_db;
wire adc_eoc;
reg [7:0] AdcOutput;
reg [2:0] AdcEocEdge;

alta_adc adc_inst(
  .enb      (!adc_en    ),
  .sclk     (adc_clock  ),
  .insel    (5'b01011   ), // ADC_IN10  see docs--> 01011: in10
  .stop     (1'b0       ),
  .db       (adc_db     ),
  .eoc      (adc_eoc    )
);

always @(negedge sys_resetn or posedge sys_clock) begin
    if (!sys_resetn) begin
        AdcEocEdge <= 0;
    end else begin
        AdcEocEdge[2:0] <= {AdcEocEdge[1:0], adc_eoc};
    end
end

function [9:0] PixelXYToBramAddr;
    input [6:0] PixelX;
    input [6:0] PixelY;
    input [2:0] LMH;
    begin
        PixelXYToBramAddr[9:0] = 
            ({PixelY[1:0], PixelX[1:0]} * 10'd3 
                + (LMH[2] ? 10'd0 
                : (LMH[1] ? 10'd1 
                        : 10'd2)))
            | 10'h200;
    end
    //RegAddrToBramAddr = (RegAddr - 7'd6) | 10'h200;
endfunction

localparam S_IDLE           = 6'b000001;
localparam S_REQUEST_LOW    = 6'b000010;
localparam S_REQUEST_MID    = 6'b000100;
localparam S_REQUEST_HIGH   = 6'b001000;
localparam S_WAIT           = 6'b010000;
localparam S_OUTPUT         = 6'b100000;

reg [7:0] RegLow;
reg [7:0] RegMid;
reg [7:0] RegHigh;
//reg [4:0] Counter;
reg [5:0] State;
reg [6:0] HoldSampleDone;
reg ReadyToTransit;
reg ReadyToTransit2;
reg regSampleDone;


reg [1:0] Last_SampledStart;
always @(negedge sys_resetn or posedge sys_clock) begin
    if (!sys_resetn) begin
        Last_SampledStart <= 0;
    end else begin
        Last_SampledStart <= {Last_SampledStart[0], SampleStart};
    end
end



always @(negedge sys_resetn or posedge sys_clock) begin
    if (!sys_resetn) begin
        RequestReadReg <= 0;
        RegReadAddr <= 0;
        regSampleDone <= 0;
        SampledValue <= 0;
        State <= S_IDLE;
        adc_en <= 1'b0;
        ReadyToTransit <= 0;
        ReadyToTransit2 <= 0;
    end else begin
        case (State)
        S_IDLE: begin
            //RequestReadReg <= 1'b0;
            //adc_en <= 1'b0;
            if (regSampleDone) begin
                regSampleDone <= 0;
            end
            if (!Last_SampledStart[1] && Last_SampledStart[0] && !ReadyToTransit) begin
                // posedge, start sampling
                adc_en <= 1'b1;
                regSampleDone <= 1'b0;
                RegReadAddr <= PixelXYToBramAddr(PixelX, PixelY, 3'b100); // low
                RequestReadReg <= 1'b1;
                ReadyToTransit <= 1'b1;
            end
            if (ReadyToTransit && !RegReadDone) begin
                ReadyToTransit <= 0;
                ReadyToTransit2 <= 0;
                State <= S_REQUEST_LOW;
            end
        end
        S_REQUEST_LOW: begin
            if (RegReadDone && !ReadyToTransit) begin
                RequestReadReg <= 0;
                ReadyToTransit <= 1'b1;
                RegLow <= RegReadOutput[7:0];
            end 
            if (ReadyToTransit && !ReadyToTransit2) begin
                RegReadAddr <= PixelXYToBramAddr(PixelX, PixelY, 3'b010); // mid
                RequestReadReg <= 1'b1;
                ReadyToTransit2 <= 1'b1;
            end
            if (ReadyToTransit2 && !RegReadDone) begin
                ReadyToTransit <= 0;
                ReadyToTransit2 <= 0;
                State <= S_REQUEST_MID;
            end
        end
        S_REQUEST_MID: begin
            if (RegReadDone && !ReadyToTransit) begin
                RequestReadReg <= 0;
                ReadyToTransit <= 1'b1;
                RegMid <= RegReadOutput[7:0];
            end
            if (ReadyToTransit && !ReadyToTransit2) begin
                RegReadAddr <= PixelXYToBramAddr(PixelX, PixelY, 3'b001); // high
                RequestReadReg <= 1'b1;
                ReadyToTransit2 <= 1'b1;
            end
            if (ReadyToTransit2 && !RegReadDone) begin
                ReadyToTransit <= 0;
                ReadyToTransit2 <= 0;
                State <= S_REQUEST_HIGH;
            end
        end
        S_REQUEST_HIGH: begin
            if (RegReadDone && !ReadyToTransit) begin
                RequestReadReg <= 1'b0;
                ReadyToTransit <= 1'b1;
                RegHigh <= RegReadOutput[7:0];
            end
            if (ReadyToTransit) begin
                ReadyToTransit <= 0;
                State <= S_WAIT;
            end
        end
        S_WAIT: begin
            if (AdcEocEdge[1] && !AdcEocEdge[0]) begin
                AdcOutput[7:0] <= adc_db[11:4];
                adc_en <= 1'b0;
                State <= S_OUTPUT;
            end
        end
        S_OUTPUT: begin
            if (AdcOutput < RegLow) begin
                SampledValue <= 2'b11;
            end else if (AdcOutput < RegMid) begin
                SampledValue <= 2'b10;
            end else if (AdcOutput < RegHigh) begin
                SampledValue <= 2'b01;
            end else begin
                SampledValue <= 2'b00;
            end
            regSampleDone <= 1'b1;
            ReadyToTransit <= 0;
            ReadyToTransit2 <= 0;
            adc_en <= 0;
            RequestReadReg <= 0;
            State <= S_IDLE;
        end
        endcase
    end
end

always @(negedge sys_resetn or posedge sys_clock) begin
    if (!sys_resetn) begin
        HoldSampleDone <= 0;
    end else begin
        HoldSampleDone[6:0] <= {HoldSampleDone[5:0], regSampleDone}; 
    end
end

assign SampleDone = | HoldSampleDone[6:0];

endmodule