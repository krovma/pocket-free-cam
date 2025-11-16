`default_nettype none
`timescale 1ps/1ps

// sample a single pixel
module ag32gbd_sampler(
    input sys_clock,
    input sys_resetn,
    
    input       SampleStart,
    input [6:0] PixelX,
    input [6:0] PixelY,

    output reg          RequestReadReg,
    output reg [9:0]    RegReadAddr,
    input      [8:0]    RegReadOutput,
    input               RegReadDataReady,

    output reg          SampleDone,
    output reg [1:0]    SampledValue,

    input [7:0] FakeResultValue
);

// alta_adc adc_inst(
//   .enb  (!adc_en ),
//   .sclk (sclk    ),
//   .insel(chnl_sel),
//   .stop (stop    ),
//   .db   (adc_db  ),
//   .eoc  (adc_eoc )
// );


function [9:0] PixelXYToBramAddr;
    input [6:0] PixelX;
    input [6:0] PixelY;
    input [2:0] LMH;
    begin
        PixelXYToBramAddr[9:0] = ({PixelY[1:0], PixelX[1:0]} * 10'd3 + (LMH[2] ? 10'd0 : (LMH[1] ? 10'd1 : 10'd2))) | 10'h200;
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
reg [4:0] Counter;
reg [5:0] State;
reg [2:0] WaitingForData;

wire [7:0] AdcOutput;
assign AdcOutput[7:0] = FakeResultValue[7:0];

reg [1:0] Last_SampledStart;
always @(negedge sys_resetn or posedge sys_clock) begin
    if (!sys_resetn) begin
        Last_SampledStart <= 2'b00;
    end else begin
        Last_SampledStart <= {Last_SampledStart[0], SampleStart};
    end
end

always @(negedge sys_resetn or posedge sys_clock) begin
    if (!sys_resetn) begin
        RequestReadReg <= 1'b0;
        RegReadAddr <= 10'b0;
        SampleDone <= 1'b0;
        SampledValue <= 2'b0;
        Counter <= 5'b0;
        State <= S_IDLE;
        WaitingForData <= 3'b0;
    end else begin
        case (State)
        S_IDLE: begin
            SampleDone <= 1'b0;
            if (!Last_SampledStart[1] && Last_SampledStart[0]) begin
                // posedge, start sampling
                Counter <= 5'b0;
                State <= S_REQUEST_LOW;
                WaitingForData <= 3'b0;
                RegReadAddr <= PixelXYToBramAddr(PixelX, PixelY, 3'b100); // low
                RequestReadReg <= 1'b1;
            end
        end
        S_REQUEST_LOW: begin
            Counter <= Counter + 5'b1;
            if (WaitingForData != 3'b111) begin
                WaitingForData <= {WaitingForData[1:0], 1'b1};
            end else begin
                RequestReadReg <= 1'b0;
                if (RegReadDataReady) begin
                    RegLow <= RegReadOutput[7:0];
                    State <= S_REQUEST_MID;
                    RegReadAddr <= PixelXYToBramAddr(PixelX, PixelY, 3'b010); // mid
                    WaitingForData <= 3'b0;
                    RequestReadReg <= 1'b1;
                end
            end
        end
        S_REQUEST_MID: begin
            Counter <= Counter + 5'b1;
            if (WaitingForData != 3'b111) begin
                WaitingForData <= {WaitingForData[1:0], 1'b1};
            end else begin
                RequestReadReg <= 1'b0;
                if (RegReadDataReady) begin
                    RegMid <= RegReadOutput[7:0];
                    State <= S_REQUEST_HIGH;
                    RegReadAddr <= PixelXYToBramAddr(PixelX, PixelY, 3'b001); // high
                    WaitingForData <= 3'b0;
                    RequestReadReg <= 1'b1;
                end
            end
        end
        S_REQUEST_HIGH: begin
            Counter <= Counter + 5'b1;
            if (WaitingForData != 3'b111) begin
                WaitingForData <= {WaitingForData[1:0], 1'b1};
            end else begin
                RequestReadReg <= 1'b0;
                if (RegReadDataReady) begin
                    RegHigh <= RegReadOutput[7:0];
                    State <= S_WAIT;
                end
            end
        end
        S_WAIT: begin
            if (Counter == 5'd12) begin
                // if adc output value.
                State <= S_OUTPUT;
                Counter <= 5'b0;
            end else begin
                Counter <= Counter + 5'b1;
            end
        end
        S_OUTPUT:begin
            if (AdcOutput[7:0] >= RegHigh) begin
                SampledValue <= 2'b11;
            end else if (AdcOutput[7:0] >= RegMid) begin
                SampledValue <= 2'b10;
            end else if (AdcOutput[7:0] >= RegLow) begin
                SampledValue <= 2'b01;
            end else begin
                SampledValue <= 2'b00;
            end
            SampleDone <= 1'b1;
            State <= S_IDLE;
        end
        endcase
    end
end

endmodule