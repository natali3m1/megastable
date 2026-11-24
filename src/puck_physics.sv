
module puck_physics #(

    // Board dimensions
    parameter int BOARD_WIDTH  = 640,
    parameter int BOARD_HEIGHT = 480,

    // Object dimensions
    parameter int PUCK_RADIUS   = 8,
    parameter int PADDLE_RADIUS = 16,

    // Puck speeds
    parameter int NORMAL_SPEED = 3,
    parameter int FAST_SPEED   = 5,

    // Goal dimensions
    parameter int NORMAL_GOAL_HEIGHT = 120,
    parameter int SMALL_GOAL_HEIGHT  = 80,

    // Coordinate widths
    parameter int X_BITS = $clog2(BOARD_WIDTH + 1),
    parameter int Y_BITS = $clog2(BOARD_HEIGHT + 1)

)(
    input logic clk,
    input logic reset,
    input logic physics_tick,
    input logic game_enable,

    input logic [1:0] level,

    // Left paddle position
    input logic [X_BITS-1:0] left_paddle_x,
    input logic [Y_BITS-1:0] left_paddle_y,

    // Right paddle position
    input logic [X_BITS-1:0] right_paddle_x,
    input logic [Y_BITS-1:0] right_paddle_y,

    // Puck position
    output logic [X_BITS-1:0] puck_x,
    output logic [Y_BITS-1:0] puck_y,

    // Scoring signals
    output logic goal_scored,
    output logic goal_side
);



endmodule
