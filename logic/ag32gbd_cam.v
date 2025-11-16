`default_nettype none
`timescale 1ps/1ps

// camera capture control
/*
 * ┌───────┐   phi up         ┌───────┐  phi up           ┌─────────────────────────────────────────────────────────────┐
 * │ Idle  ├─────────────────►│1:reset├──────────────────►│2:config regs│                                               │
 * └───────┘                  └───────┘                   │─────────────┘                                               │
 *                        reset=0 on phi down             │                                                             │
 *                        reset=1 on phi up               │                                                             │
 *                                                        │                                                             │
 *                                                        │                                                             │
 *                                                        │                                                             │
 *                                                        │                                                             │
 *                                                        │                                                             │
 *                                                        │                                                             │
 *                                                        │                                                             │
 *                                                        │                                                             │
 *                                                        │                                                             │
 *                                                        │                                                             │
 *                                                        │                                                             │
 *                                                        │                                                             │
 *                                                        │                                                             │
 *                                                        │                                                             │
 *                                                        │                                                             │
 *                                                        │                                                             │
 *                                                        │                                                             │
 *                                                        │                                                             │
 *                                                        │                                                             │
 *                                                        │                                                             │
 *                                                        │                                                             │
 *                                                        │                                                             │
 *                                                        │                                                             │
 *                                                        │                                                             │
 *                                                        │                                                             │
 *                                                        │                                                             │
 *                                                        │                                                             │
 *                                                        └─────────────────────────────────────────────────────────────┘
 */

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
    input sys_resetn,

    // to bram
    output reg          FlipBuffer,
    output reg  [7:0]   BufferWriteData,
    output reg  [9:0]   BufferWriteOffset,
    output reg          RequestWriteBuffer,
    // from sampler to bram
    output              RequestReadReg,
    output      [9:0]   RegReadAddr,
    input       [8:0]   RegReadOutput,
    input               RegReadDataReady,
    // to Ram writer
    output reg          BlockBufferDataReady,

    output Sens_XCK,
    output reg Cam_Capture_Finish
);

// input params
wire [18:0] exposure_steps_xck = {Reg_A002[7:0], Reg_A003[7:0], 3'b000}; // (A002 << 8 + A003) * 8
wire Nbit = Reg_A001[7];
//wire [15:0] reading_xck = Nbit ? 15'd16128 : 15'd16384;

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
localparam  S_CONFIG_BIT_A2 = 11'b1_00000_00000;
////////////////////////////////////////////

// divide clk into xck
reg Sens_XCK_Reg;
always @(negedge sys_resetn or posedge Cart_CLK) begin
    if (!sys_resetn) begin
        Sens_XCK_Reg <= 1'b0;
    end else begin
        Sens_XCK_Reg <= ~Sens_XCK_Reg;
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

reg [1:0] Last_CLK_Reg;
always @(negedge sys_resetn or posedge sys_clock) begin
    if (!sys_resetn) begin
        Last_CLK_Reg <= 2'b0;
    end else begin
        Last_CLK_Reg[1:0] <= {Last_CLK_Reg[0], Cart_CLK};
    end
end

reg [6:0] PixelX;
reg [6:0] PixelY;
reg SampleStart;
wire SampleDone;
wire [2:0] SampledValue;
reg [7:0] fake_data_source;

ag32gbd_sampler sampler_inst (
    .PixelX(PixelX),
    .PixelY(PixelY),
    .SampleStart(SampleStart),
    .RegReadOutput(RegReadOutput),
    .RegReadDataReady(RegReadDataReady),
    .RequestReadReg(RequestReadReg),
    .RegReadAddr(RegReadAddr),
    .SampleDone(SampleDone),
    .SampledValue(SampledValue),
    .sys_resetn(sys_resetn),
    .sys_clock(sys_clock),
    .FakeResultValue(fake_data_source)
);

reg [7:0] ByteDataBuffer;

// camera state machine do nothing if cam_capture is 0
reg [10:0] main_state;
reg [2:0] config_state;
reg [10:0] config_bit_state;
reg [23:0] counter0;
reg [1:0] small_counter;
reg reset_pulse_send;

reg [18:0] exposure_counter;

always @(negedge sys_resetn or posedge sys_clock) begin
    if (!sys_resetn) begin
        // internal states
        counter0 <= 0;
        exposure_counter <= 0;
        main_state <= S_IDLE;
        config_state <= S_CONFIG_R1;
        reset_pulse_send <= 0;

        //sampler
        fake_data_source <= 0;
        PixelX <= 0;
        PixelY <= 0;
        SampleStart <= 0;
        ByteDataBuffer <= 0;
        // outputs
        FlipBuffer <= 0;
        BufferWriteData <= 0;
        BufferWriteOffset <= 0;
        RequestWriteBuffer <= 0;
        BlockBufferDataReady <= 0;
        Cam_Capture_Finish <= 0;

    end else if (Cam_Capture) begin
        case(main_state)
        S_IDLE: begin
            if (!Last_XCK_Reg[1] && Last_XCK_Reg[0]) begin // sync at posedge of xck
                main_state <= S_RESET0;
                Cam_Capture_Finish <= 1'b0;
            end
        end
        S_RESET0: begin
            // pseudo wait 1clk
            if (Last_XCK_Reg[1] && !Last_XCK_Reg[0]) begin // set at negedge, reset signal is read at posedge of xck
                if (!reset_pulse_send) begin
                    // sens_reset <= 0;
                    reset_pulse_send <= 1;
                end else begin
                    // sens_reset <= 1;
                    main_state <= S_CONFIG;
                    config_state <= S_CONFIG_R1;
                    config_bit_state <= S_CONFIG_BIT_A1;
                    // also prepare first bit to configure (A2 of reg1), this also happens in later configure operations
                    // sens_sin <= a2;
                    counter0 <= 0;//for debug
                end
            end
        end
        S_CONFIG: begin
            // data latch at posedge of xck, load latch at negedge of xck
            // load should be high for at least 0.8us, which is half of xck
            // we need clk signal to handle this behavior, also recall that xck and clk sync at clk posedge
            // xck negedge : prepare next bit per config_bit_state, if load pulse set, prepare to reset it at next negedge of clk.
            // xck posedge : if current bit_state is d0, prepare for load signal at next negedge of clk. Advance bit_state, if S_CONFIG_R0 now, prepare to next main_state.
            // clk negedge : if load signal need to be set, set it; if load signal was set, reset it. check if need to advance to next main_state.
            if (!Last_XCK_Reg[1] && Last_XCK_Reg[0]) begin
                if (counter0 == 24'd88) begin
                    main_state <= S_WAIT0;
                end else begin
                    counter0 <= counter0 + 24'd1;
                end
            end
        end
        S_WAIT0: begin
            if (!Last_XCK_Reg[1] && Last_XCK_Reg[0]) begin
                main_state <= S_START;
            end
        end
        S_START: begin
            if (!Last_XCK_Reg[1] && Last_XCK_Reg[0]) begin
                main_state <= S_EXPOSURE;
                exposure_counter <= 0;
            end
        end
        S_EXPOSURE: begin
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
                    main_state <= S_READ;
                    PixelX <= 0;
                    PixelY <= 0;
                    SampleStart <= 1'b1;
                    //debug
                    counter0 <= 0;
                    fake_data_source <= 0;
                    
                end else begin
                    small_counter <= 2'd1;
                end
            end
        end
        S_READ: begin
            if (!Last_XCK_Reg[1] && Last_XCK_Reg[0]) begin
                if (counter0[14:0] == (Nbit ? 15'd16128 : 15'd16384)) begin
                    main_state <= S_WAIT2;
                    small_counter <= 0;
                end else begin
                    // assume this is the end of one pixel read
                    if (PixelX[1:0] == 2'b11) begin
                        // 4 pixels done, write to bram
                        BufferWriteData <= ByteDataBuffer;
                        BufferWriteOffset[9:0] <= {2'b00, counter0[9:2]}; // divide by 4
                        RequestWriteBuffer <= 1'b1;
                    end else begin
                        RequestWriteBuffer <= 1'b0;
                    end
                    if (PixelY[2:0] == 3'b000) begin
                        // 8 rows done, swap buffer
                        // flip buffer is delayed 10 clocks in bram ctrl, sop we can set it now
                        FlipBuffer <= ~FlipBuffer;
                    end

                    counter0[14:0] <= counter0[14:0] + 15'd1;
                    if (PixelX == 7'd127) begin
                        PixelX <= 7'd0;
                        PixelY <= PixelY + 7'b1;
                    end else begin
                        PixelX <= PixelX + 7'b1;
                    end
                    if (PixelY <= 7'd127) begin
                        SampleStart <= 1'b1;
                    end
                    fake_data_source <= fake_data_source + 8'b1;
                end
            end
            // normal clock domain
            if (SampleDone) begin
                SampleStart <= 1'b0;
                ByteDataBuffer[7:0] <= {ByteDataBuffer[5:0], SampledValue[1:0]}; // Shift to left
            end
        end
        S_WAIT2: begin
            if (!Last_XCK_Reg[1] && Last_XCK_Reg[0]) begin
                if (small_counter == 2'd3) begin
                    main_state <= S_RESET1;
                    reset_pulse_send <= 0;
                end else begin
                    small_counter <= small_counter + 2'd1;
                end
            end
        end
        S_RESET1: begin
            if (Last_XCK_Reg[1] && !Last_XCK_Reg[0]) begin
                if (!reset_pulse_send) begin
                    // sens_reset <= 0;
                    reset_pulse_send <= 1;
                end else begin
                    // sens_reset <= 1;
                    main_state <= S_FINISH;
                    small_counter <= 0;
                    Cam_Capture_Finish <= 1'b1;
                end
            end
        end
        S_FINISH: begin
            if (Last_XCK_Reg[1] && !Last_XCK_Reg[0]) begin
                main_state <= S_IDLE;
            end
        end
        default: begin
            counter0 <= 0;
            exposure_counter <= 0; 
            main_state <= S_IDLE;
            config_state <= S_CONFIG_R1;
            Cam_Capture_Finish <= 1'b0;
        end
        endcase
    end
end


// always @(negedge sys_resetn or posedge sys_clock) begin
//     if (!sys_resetn) begin
//         counter0 <= 0;
//     end else if (Cam_Capture) begin
//         if (main_state == S_IDLE) begin
//             if (!Last_XCK_Reg[1] && Last_XCK_Reg[0]) begin
//                 counter0 <= 24'd0;
//             end
//         end else if (main_state == S_WAIT0) begin
//             if (!Last_XCK_Reg[1] && Last_XCK_Reg[0] && counter0 < 24'd32767) begin
//                 counter0 <= counter0 + 24'd1;
//             end
//         end
//     end
// end

// always @(negedge sys_resetn or posedge sys_clock) begin
//     if (!sys_resetn) begin
//         main_state <= S_IDLE;
//         config_state <= S_CONFIG_R1;
//     end else if (Cam_Capture) begin
//         case (main_state)
//             S_IDLE: begin
//                 if (!Last_XCK_Reg[1] && Last_XCK_Reg[0]) begin
//                     main_state <= S_WAIT0;
//                 end else begin
//                     main_state <= S_IDLE;
//                 end
//             end
//             S_WAIT0: begin
//                 if (!Last_XCK_Reg[1] && Last_XCK_Reg[0]) begin
//                     if (counter0 == 24'd32767) begin
//                         main_state <= S_IDLE;
//                     end
//                 end else begin
//                     main_state <= S_WAIT0;
//                 end
//             end
//             default: main_state <= S_IDLE;
//         endcase
//     end
// end

// always @(negedge sys_resetn or posedge sys_clock) begin
//     if (!sys_resetn) begin
//         Cam_Capture_Finish <= 1'b0;
//     end else begin
//         if (main_state == S_IDLE && counter0 == 24'd32767) begin
//             Cam_Capture_Finish <= 1'b1;
//         end else begin
//             Cam_Capture_Finish <= 1'b0;
//         end
//     end
// end

endmodule
`default_nettype wire
