`default_nettype none
`timescale 1ps/1ps

module ag32gbd_cam (
    input Cam_Capture,
    input Cart_CLK,

    input [7:0] Reg_A000,
    input [7:0] Reg_A001,
    input [7:0] Reg_A002,
    input [7:0] Reg_A003,
    input [7:0] Reg_A004,
    input [7:0] Reg_A005,

    input sys_clock,
    input adc_clock,
    input sys_resetn,

    // to bram
    output reg          FlipBuffer,
    output wire [7:0]   BufferWriteData,
    output reg  [9:0]   BufferWriteOffset,
    output reg          RequestWriteBuffer,
    input               BufferWriteDataDone,
    // from sampler to bram
    output              RequestReadReg,
    output      [9:0]   RegReadAddr,
    input       [7:0]   RegReadOutput,
    input               RegReadDataReady,
    // to Ram writer
    input               isGbdWritingRam,
    output reg          RamNewRun,
    output reg          BlockBufferDataReady,

    output reg Sens_START,
    output reg Sens_SIN,
    output reg Sens_LOAD,
    output reg Sens_RESET,
    output Sens_XCK,
    output reg Sens_READ,
    output reg Cam_Capture_Finish
);

// input params
wire [18:0] exposure_steps_xck = {Reg_A002[7:0], Reg_A003[7:0], 3'b000}; // (A002 << 8 + A003) * 8
wire Nbit = Reg_A001[7];
wire [14:0] reading_xck = Nbit ? 15'd16128 : 15'd16384;

function [7:0] Reg4;
    input [2:0] theA000;
    begin
        case(theA000)
        3'b001: Reg4 = 8'h00;
        3'b011: Reg4 = 8'h01;
        3'b101: Reg4 = 8'h01;
        3'b111: Reg4 = 8'h01;
        default:Reg4 = 8'h00;
        endcase
    end
endfunction

function [7:0] Reg5;
    input [2:0] theA000;
    begin
        case(theA000)
        3'b001: Reg5 = 8'h01;
        3'b011: Reg5 = 8'h00;
        3'b101: Reg5 = 8'h02;
        3'b111: Reg5 = 8'h02;
        default:Reg5 = 8'h01;
        endcase
    end
endfunction

wire [10:0] DataReg1 = {3'b001, Reg_A001[7:0]};
wire [10:0] DataReg2 = {3'b010, Reg_A002[7:0]};
wire [10:0] DataReg3 = {3'b011, Reg_A003[7:0]};
wire [10:0] DataReg4 = {3'b100, Reg4(Reg_A000)}; //P
wire [10:0] DataReg5 = {3'b101, Reg5(Reg_A000)}; //M
wire [10:0] DataReg6 = {3'b110, 8'h01}; //X
wire [10:0] DataReg7 = {3'b111, Reg_A004[7:0]};
wire [10:0] DataReg0 = {3'b000, Reg_A005[7:0]};


//states
localparam  S_IDLE      = 11'b1_00000_00000;
localparam  S_RESET0    = 11'b0_00000_00001;
localparam  S_CONFIG    = 11'b0_00000_00010;
localparam  S_WAIT0     = 11'b0_00000_00100;
localparam  S_START     = 11'b0_00000_01000;
localparam  S_EXPOSURE  = 11'b0_00000_10000;
localparam  S_WAIT1     = 11'b0_00001_00000;
localparam  S_READ      = 11'b0_00010_00000;
localparam  S_WAIT2     = 11'b0_00100_00000;
localparam  S_RESET1    = 11'b0_01000_00000;
localparam  S_FINISH    = 11'b0_10000_00000; // wait a few clocks to fully reset

localparam  S_CONFIG_R1 = 3'b001;
localparam  S_CONFIG_R2 = 3'b010;
localparam  S_CONFIG_R3 = 3'b011;
localparam  S_CONFIG_R4 = 3'b100;
localparam  S_CONFIG_R5 = 3'b101;
localparam  S_CONFIG_R6 = 3'b110;
localparam  S_CONFIG_R7 = 3'b111;
localparam  S_CONFIG_R0 = 3'b000;

localparam  S_CONFIG_BIT_A2 = 11'b1_00000_00000;
localparam  S_CONFIG_BIT_A1 = 11'b0_10000_00000;
localparam  S_CONFIG_BIT_A0 = 11'b0_01000_00000;
localparam  S_CONFIG_BIT_D7 = 11'b0_00100_00000;
localparam  S_CONFIG_BIT_D6 = 11'b0_00010_00000;
localparam  S_CONFIG_BIT_D5 = 11'b0_00001_00000;
localparam  S_CONFIG_BIT_D4 = 11'b0_00000_10000;
localparam  S_CONFIG_BIT_D3 = 11'b0_00000_01000;
localparam  S_CONFIG_BIT_D2 = 11'b0_00000_00100;
localparam  S_CONFIG_BIT_D1 = 11'b0_00000_00010;
localparam  S_CONFIG_BIT_D0 = 11'b0_00000_00001;
////////////////////////////////////////////

// divide clk into xck (sync at sys_clk)
reg [1:0] Last_CLK_Reg;
always @(negedge sys_resetn or posedge sys_clock) begin
    if (!sys_resetn) begin
        Last_CLK_Reg <= 2'b0;
    end else begin
        Last_CLK_Reg[1:0] <= {Last_CLK_Reg[0], Cart_CLK};
    end
end

reg Sens_XCK_Reg;
always @(negedge sys_resetn or posedge sys_clock) begin
    if (!sys_resetn) begin
        Sens_XCK_Reg <= 1'b0;
    end else begin
        if (!Last_CLK_Reg[1] && Last_CLK_Reg[0]) begin
            Sens_XCK_Reg <= ~Sens_XCK_Reg;
        end
    end
end
assign Sens_XCK = Sens_XCK_Reg;

// edge detection for high speed
reg [1:0] Last_XCK_Reg;
always @(negedge sys_resetn or posedge sys_clock) begin
    if (!sys_resetn) begin
        Last_XCK_Reg <= 2'b0;
    end else begin
        Last_XCK_Reg[1:0] <= {Last_XCK_Reg[0], Sens_XCK_Reg};
    end
end

reg [6:0] PixelX;
reg [6:0] PixelY;
reg SampleStart;
reg RequestSampleStart;
reg [6:0] SampleWaitCnt;
wire SampleDone;
wire [1:0] SampledValue;

ag32gbd_sampler sampler_inst (
    .sys_resetn(sys_resetn),
    .sys_clock(sys_clock),
    .adc_clock(adc_clock),

    .SampleStart(SampleStart),
    .SampleDone(SampleDone),
    .PixelX(PixelX),
    .PixelY(PixelY),
    .SampledValue(SampledValue),

    .RegReadOutput(RegReadOutput),
    .RequestReadReg(RequestReadReg),
    .RegReadAddr(RegReadAddr),
    .RegReadDone(RegReadDataReady)
    
    //.FakeResultValue(fake_data_source)
);

reg [7:0] ByteDataBuffer;
assign BufferWriteData[7:0] = ByteDataBuffer[7:0];
//reg [7:0] DebugDataBuffer;
//assign BufferWriteData[7:0] = DebugDataBuffer[7:0];

// camera state machine do nothing if cam_capture is 0
reg reset_pulse_send;
reg [10:0] main_state;
reg [2:0] config_state;
reg [10:0] config_bit_state;
reg need_load_sig;
reg [23:0] counter_read;
reg [1:0] small_counter;
reg [18:0] exposure_counter;

always @(negedge sys_resetn or posedge sys_clock) begin
    if (!sys_resetn) begin
        // internal states
        counter_read <= 0;
        exposure_counter <= 0;
        main_state <= S_IDLE;
        config_state <= S_CONFIG_R1;
        reset_pulse_send <= 0;
        need_load_sig <= 0;
        //sampler
        PixelX <= 0;
        PixelY <= 0;
        RequestSampleStart <= 0;
        SampleStart <= 0;
        SampleWaitCnt <= 0;
        ByteDataBuffer <= 0;
        // outputs
        FlipBuffer <= 0;
        //BufferWriteData <= 0;
        BufferWriteOffset <= 0;
        RequestWriteBuffer <= 0;
        BlockBufferDataReady <= 0;
        Cam_Capture_Finish <= 0;
        RamNewRun <= 0;

        // sensor
        Sens_START <= 0;
        Sens_SIN <= 0;
        Sens_LOAD <= 0;
        Sens_RESET <= 1'b1;
        Sens_READ <= 0;

    end else if (Cam_Capture) begin
        case(main_state)
        S_IDLE: begin
            if (!Last_XCK_Reg[1] && Last_XCK_Reg[0]) begin // sync at posedge of xck
                Cam_Capture_Finish <= 1'b0;
                Sens_START <= 0;
                Sens_SIN <= 0;
                Sens_LOAD <= 0;
                Sens_RESET <= 1'b1;
                Sens_READ <= 0;
                BlockBufferDataReady <= 0;
                main_state <= S_RESET0;
            end
        end
        
        S_RESET0: begin
            RamNewRun <= 1'b1;
            FlipBuffer <= 0;
            if (Last_XCK_Reg[1] && !Last_XCK_Reg[0]) begin // set at negedge, reset signal is read at posedge of xck
                if (!reset_pulse_send) begin
                    Sens_RESET <= 0;
                    reset_pulse_send <= 1'b1;
                end else begin
                    Sens_RESET <= 1'b1;
                    counter_read <= 0;
                    Sens_LOAD <= 0;
                    need_load_sig <= 0;
                    main_state <= S_CONFIG;
                    config_state <= S_CONFIG_R1;
                    config_bit_state <= S_CONFIG_BIT_A2;
                end
            end
        end

        S_CONFIG: begin
            RamNewRun <= 1'b0;
            // data latch at posedge of xck, load latch at negedge of xck
            // load should be high for at least 0.8us, which is half of xck
            // we need clk signal to handle this behavior, also as a remind here that xck and clk sync at clk posedge
            // xck negedge : prepare next bit per config_bit_state, if load pulse set, prepare to reset it at next negedge of clk.
            // xck posedge : if current bit_state is d0, prepare for load signal at next negedge of clk. Advance bit_state, if S_CONFIG_R0 now, prepare to next main_state.
            // clk negedge : if load signal need to be set, set it; if load signal was set, reset it. check if need to advance to next main_state.
            if (Last_XCK_Reg[1] && !Last_XCK_Reg[0]) begin // xck neg
                case(config_state)
                    S_CONFIG_R1: Sens_SIN <= | (DataReg1[10:0] & config_bit_state[10:0]);
                    S_CONFIG_R2: Sens_SIN <= | (DataReg2[10:0] & config_bit_state[10:0]);
                    S_CONFIG_R3: Sens_SIN <= | (DataReg3[10:0] & config_bit_state[10:0]);
                    S_CONFIG_R4: Sens_SIN <= | (DataReg4[10:0] & config_bit_state[10:0]);
                    S_CONFIG_R5: Sens_SIN <= | (DataReg5[10:0] & config_bit_state[10:0]);
                    S_CONFIG_R6: Sens_SIN <= | (DataReg6[10:0] & config_bit_state[10:0]);
                    S_CONFIG_R7: Sens_SIN <= | (DataReg7[10:0] & config_bit_state[10:0]);
                    S_CONFIG_R0: Sens_SIN <= | (DataReg0[10:0] & config_bit_state[10:0]);
                    default: Sens_SIN <= 0;
                endcase
            end else if (!Last_XCK_Reg[1] && Last_XCK_Reg[0]) begin // xck pos
                if (config_bit_state == S_CONFIG_BIT_D0) begin
                    if (config_state != S_CONFIG_R0) begin
                        config_bit_state <= S_CONFIG_BIT_A2;
                    end
                    case(config_state)
                        S_CONFIG_R1: config_state <= S_CONFIG_R2;
                        S_CONFIG_R2: config_state <= S_CONFIG_R3;
                        S_CONFIG_R3: config_state <= S_CONFIG_R4;
                        S_CONFIG_R4: config_state <= S_CONFIG_R5;
                        S_CONFIG_R5: config_state <= S_CONFIG_R6;
                        S_CONFIG_R6: config_state <= S_CONFIG_R7;
                        S_CONFIG_R7: config_state <= S_CONFIG_R0;
                        S_CONFIG_R0: config_state <= S_CONFIG_R0;
                        default: config_state <= S_CONFIG_R0;
                    endcase
                    need_load_sig <= 1'b1;
                end else begin
                    config_bit_state  <= config_bit_state >> 1;
                end
            end
            if (Last_CLK_Reg[1] && !Last_CLK_Reg[0]) begin //clk neg
                if (need_load_sig) begin
                    Sens_LOAD <= 1'b1;
                    need_load_sig <= 0;
                end
                if (Sens_LOAD) begin
                    Sens_LOAD <= 0;
                    if (config_bit_state == S_CONFIG_BIT_D0 && config_state == S_CONFIG_R0) begin
                        main_state <= S_WAIT0;
                    end
                end
            end
        end

        S_WAIT0: begin
            if (!Last_XCK_Reg[1] && Last_XCK_Reg[0]) begin
                main_state <= S_START;
                exposure_counter <= 0;
                Sens_START <= 0;
            end
        end
        // set start at negedge of clk, reset and advance at next negedge
        S_START: begin
            if (!Last_CLK_Reg[1] && Last_CLK_Reg[0]) begin
                if (!Sens_START) begin
                    Sens_START <= 1'b1;
                    exposure_counter <= 0;
                end else begin
                    Sens_START <= 0;
                    exposure_counter = exposure_counter + 19'b1;
                    main_state <= S_EXPOSURE;
                end
            end
        end

        S_EXPOSURE: begin
            Sens_READ <= 0;
            if (!Last_XCK_Reg[1] && Last_XCK_Reg[0]) begin
                if (exposure_counter == exposure_steps_xck) begin
                    main_state <= S_WAIT1;
                    small_counter <= 0;
                end else begin
                    exposure_counter = exposure_counter + 19'b1;
                end
            end
        end

        S_WAIT1: begin
            if (!Last_XCK_Reg[1] && Last_XCK_Reg[0]) begin
                if (small_counter == 2'd1) begin
                    PixelX <= 0;
                    PixelY <= Nbit ? 7'd1 : 7'd0;
                    //PixelY <= 0;
                    FlipBuffer <= 0;

                    SampleStart <= 0;
                    RequestSampleStart <= 1'b1;
                    SampleWaitCnt <= 0;
                    
                    counter_read <= 0;
                    RequestWriteBuffer <= 0;
                    Sens_READ <= 1'b1;
                    // transition
                    //debug_write_offset <= 0;
                    main_state <= S_READ;             
                end else begin
                    small_counter <= 2'd1;
                end
            end
        end

        S_READ: begin
            if (!Last_XCK_Reg[1] && Last_XCK_Reg[0]) begin
                if (counter_read[14:0] == reading_xck[14:0]) begin
                    small_counter <= 0;
                    BlockBufferDataReady <= 1'b0;
                    Sens_READ <= 0;
                    main_state <= S_WAIT2;
                end else begin
                    // count finished pixels
                    counter_read[14:0] <= counter_read[14:0] + 15'd1;
                    // start next sample
                    SampleStart <= 0;
                    RequestSampleStart <= 1'b1;
                    SampleWaitCnt <= 0;

                    if (PixelX == 7'd127) begin
                        // Line finish
                        if (PixelY[2:0] == 3'b111) begin
                            // 8 lines finish
                            FlipBuffer <= ~FlipBuffer;
                            BlockBufferDataReady <= 1'b1;
                        end
                        PixelX <= 7'd0;
                        PixelY <= PixelY + 7'd1;
                    end else begin
                        PixelX <= PixelX + 7'd1;
                        BlockBufferDataReady <= 0;
                    end
                end
            end

            // normal clock domain
            if (!SampleStart && RequestSampleStart) begin
                if (SampleWaitCnt == 7'd24) begin
                    SampleStart <= 1'b1;
                    RequestSampleStart <= 0;
                    SampleWaitCnt <= 0;
                end else begin
                    SampleWaitCnt <= SampleWaitCnt + 7'd1;
                end
            end

            if (SampleDone && SampleStart) begin
                SampleStart <= 0;
                ByteDataBuffer[7:0] <= {ByteDataBuffer[5:0], SampledValue[1:0]}; // Shift to left
                if (PixelX[1:0] == 2'b11) begin
                    BufferWriteOffset[9:0] <= {2'b00, PixelY[2:0], PixelX[6:2]};
                    // BufferWriteData[7:0] is assign to ByteDataBuffer[7:0]
                    RequestWriteBuffer <= 1'b1;
                end
            end
            
            if (RequestWriteBuffer && BufferWriteDataDone) begin
                RequestWriteBuffer <= 0;
                BufferWriteOffset <= 0;
            end
        end

        S_WAIT2: begin
            if (!Last_XCK_Reg[1] && Last_XCK_Reg[0]) begin
                if (small_counter == 2'd1) begin
                    //FlipBuffer <= ~FlipBuffer;
                end else if (small_counter == 2'd2) begin
                    //BlockBufferDataReady <= 1'b1; // finish last block
                end else if (small_counter == 2'd3) begin
                    main_state <= S_RESET1;
                    reset_pulse_send <= 0;
                end
                small_counter <= small_counter + 2'd1;
            end
            if (RequestWriteBuffer && BufferWriteDataDone) begin
                    RequestWriteBuffer <= 0;
                    BufferWriteOffset <= 0;
            end
        end

        S_RESET1: begin
            BlockBufferDataReady <= 1'b0; // finish last block
            if (Last_XCK_Reg[1] && !Last_XCK_Reg[0]) begin
                if (!reset_pulse_send) begin
                    Sens_RESET <= 0;
                    reset_pulse_send <= 1'b1;
                end else begin
                    Sens_RESET <= 1'b1;
                    main_state <= S_FINISH;
                    small_counter <= 0;
                end
            end
        end
        S_FINISH: begin
            if (!isGbdWritingRam) begin
                main_state <= S_IDLE;
                Cam_Capture_Finish <= 1'b1;
            end
        end
        default: begin
            counter_read <= 0;
            exposure_counter <= 0; 
            main_state <= S_IDLE;
            config_state <= S_CONFIG_R1;
            config_bit_state <= S_CONFIG_BIT_A2;
            Cam_Capture_Finish <= 1'b0;
        end
        endcase
    end
end

endmodule
`default_nettype wire
