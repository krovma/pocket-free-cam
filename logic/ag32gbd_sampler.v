`default_nettype none
`timescale 1ps/1ps

// sample a single pixel
module ag32gbd_sampler(
    input sys_clock,
    input adc_clock,
    input sys_resetn,
    
    input       SampleStart,
    input [6:0] PixelX,
    input [6:0] PixelY,

    output reg          RequestReadReg,
    output reg [9:0]    RegReadAddr,
    input      [7:0]    RegReadOutput,

    output              SampleDone,
    output reg [1:0]    SampledValue,

    input [7:0] FakeResultValue
);

reg adc_en;
//reg adc_stop;
wire [11:0] adc_db;
wire adc_eoc;
reg [7:0] AdcOutput;
reg [2:0] AdcEocEdge;

alta_adc adc_inst(
  .enb      (!adc_en    ),
  .sclk     (adc_clock  ),
  .insel    (5'b00011   ), // ADC_IN2  see docs--> 00011: in2
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
reg WaitingForData;
reg [6:0] HoldSampleDone;
reg [3:0] Wait4;
reg ReadyToSample;
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
        //Counter <= 0;
        State <= S_IDLE;
        WaitingForData <= 0;
        ReadyToSample <= 0;
        Wait4 <= 0;
        adc_en <= 1'b0;
        AdcOutput <= 0;
    end else begin
        case (State)
        S_IDLE: begin
            RequestReadReg <= 1'b0;
            adc_en <= 1'b0;
            if (regSampleDone) begin
                regSampleDone <= 0;
            end
            if (!Last_SampledStart[1] && Last_SampledStart[0]) begin
                // posedge, start sampling in 4 clocks
                ReadyToSample <= 1'b1;
                Wait4 <= 0;
            end
            if (ReadyToSample) begin
                adc_en <= 1'b1;
                if (Wait4 == 4'd4) begin
                //    Counter <= 5'b0;
                    regSampleDone <= 1'b0;
                    WaitingForData <= 0;
                    RegReadAddr <= PixelXYToBramAddr(PixelX, PixelY, 3'b100); // low
                    RequestReadReg <= 1'b1;
                    ReadyToSample <= 0;
                    Wait4 <=0;
                    State <= S_REQUEST_LOW;
                end else begin
                    Wait4 <= Wait4 + 2'd1;
                end
            end
        end
        S_REQUEST_LOW: begin
        //    Counter <= Counter + 5'b1;
            if (!WaitingForData) begin
                WaitingForData <= 1'b1;
                RequestReadReg <= 1'b0;
                RegLow <= RegReadOutput[7:0];
            end else begin
                State <= S_REQUEST_MID;
                RegReadAddr <= PixelXYToBramAddr(PixelX, PixelY, 3'b010); // mid
                WaitingForData <= 0;
                RequestReadReg <= 1'b1;
            end
        end
        S_REQUEST_MID: begin
        //    Counter <= Counter + 5'b1;
            if (!WaitingForData) begin
                WaitingForData <= 1'b1;
                RequestReadReg <= 1'b0;
                RegMid <= RegReadOutput[7:0];
            end else begin
                State <= S_REQUEST_HIGH;
                RegReadAddr <= PixelXYToBramAddr(PixelX, PixelY, 3'b001); // high
                WaitingForData <= 0;
                RequestReadReg <= 1'b1;
            end
        end
        S_REQUEST_HIGH: begin
        //    Counter <= Counter + 5'b1;
            if (!WaitingForData) begin
                WaitingForData <= 1'b1;
                RequestReadReg <= 1'b0;
                RegHigh <= RegReadOutput[7:0];
            end else begin
                State <= S_WAIT;
            end
        end
        S_WAIT: begin
            /*if (Counter >= 5'd12) begin
                // if adc output value.
                State <= S_OUTPUT;
                Counter <= 5'b0;
            end else begin
                Counter <= Counter + 5'b1;
            end*/
            if (AdcEocEdge[2] && !AdcEocEdge[1]) begin
                AdcOutput[7:0] <= adc_db[11:4];
                State <= S_OUTPUT;
                adc_en <= 1'b0;
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