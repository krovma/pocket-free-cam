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

    input sys_clock,
    input sys_resetn,

    output Sens_XCK,
    output reg Cam_Capture_Finish
);

//states
localparam  S_IDLE      = 10'b10000_00000;
localparam  S_RESET0    = 10'b00000_00001;
localparam  S_CONFIG    = 10'b00000_00010;
localparam  S_WAIT0     = 10'b00000_00100;

localparam  S_START     = 10'b00000_01000;
localparam  S_EXPOSURE  = 10'b00000_10000;
localparam  S_WAIT1     = 10'b00001_00000;

localparam  S_READ      = 10'b00010_00000;
localparam  S_WAIT2     = 10'b00100_00000;
localparam  S_RESET1    = 10'b01000_00000;

localparam  S_CONFIG_R1 = 3'b001;
localparam  S_CONFIG_R2 = 3'b010;
localparam  S_CONFIG_R3 = 3'b011;
localparam  S_CONFIG_R4 = 3'b100;
localparam  S_CONFIG_R5 = 3'b101;
localparam  S_CONFIG_R6 = 3'b110;
localparam  S_CONFIG_R7 = 3'b111;
localparam  S_CONFIG_R0 = 3'b000;
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
        Last_XCK_Reg[1] <= Last_XCK_Reg[0];
        Last_XCK_Reg[0] <= Sens_XCK_Reg;
    end
end

// camera state machine do nothing if cam_capture is 0
reg [9:0] main_state;
reg [2:0] config_state;
reg [23:0] counter0;

always @(negedge sys_resetn or posedge sys_clock) begin
    if (!sys_resetn) begin
        counter0 <= 0;
    end else if (Cam_Capture) begin
        if (main_state == S_IDLE) begin
            if (!Last_XCK_Reg[1] && Last_XCK_Reg[0]) begin
                counter0 <= 24'd0;
            end
        end else if (main_state == S_WAIT0) begin
            if (!Last_XCK_Reg[1] && Last_XCK_Reg[0] && counter0 < 24'd32767) begin
                counter0 <= counter0 + 24'd1;
            end
        end
    end
end

always @(negedge sys_resetn or posedge sys_clock) begin
    if (!sys_resetn) begin
        main_state <= S_IDLE;
        config_state <= S_CONFIG_R1;
    end else if (Cam_Capture) begin
        case (main_state)
            S_IDLE: begin
                if (!Last_XCK_Reg[1] && Last_XCK_Reg[0]) begin
                    main_state <= S_WAIT0;
                end else begin
                    main_state <= S_IDLE;
                end
            end
            S_WAIT0: begin
                if (!Last_XCK_Reg[1] && Last_XCK_Reg[0]) begin
                    if (counter0 == 24'd32767) begin
                        main_state <= S_IDLE;
                    end
                end else begin
                    main_state <= S_WAIT0;
                end
            end
            default: main_state <= S_IDLE;
        endcase
    end
end

always @(negedge sys_resetn or posedge sys_clock) begin
    if (!sys_resetn) begin
        Cam_Capture_Finish <= 1'b0;
    end else begin
        if (main_state == S_IDLE && counter0 == 24'd32767) begin
            Cam_Capture_Finish <= 1'b1;
        end else begin
            Cam_Capture_Finish <= 1'b0;
        end
    end
end

endmodule
`default_nettype wire
