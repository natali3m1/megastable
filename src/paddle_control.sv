module paddle_control #(
    parameter SCREEN_WIDTH  = 640,
    parameter SCREEN_HEIGHT = 480,
    parameter PADDLE_RADIUS = 15,
    parameter PADDLE_SPEED  = 3
) (
        // Clock and reset
    input logic clk,
    input logic reset,
    input logic frame_tick, //when to update paddle positions

    // Player 1 controller
    input logic p1_up,
    input logic p1_down,
    input logic p1_left,
    input logic p1_right,

    // Player 2 controller
    input logic p2_up,
    input logic p2_down,
    input logic p2_left,
    input logic p2_right,

    // Player 1 paddle position
    output logic [9:0] p1_x,
    output logic [9:0] p1_y,

    // Player 2 paddle position
    output logic [9:0] p2_x,
    output logic [9:0] p2_y
);

always_ff @(posedge clk) begin
    if (reset) begin //puts paddles in start position
        p1_x <= SCREEN_WIDTH / 4; //160
        p1_y <= SCREEN_HEIGHT / 2; //240

        p2_x <= 3 * SCREEN_WIDTH / 4; //480
        p2_y <= SCREEN_HEIGHT / 2; //240
    end
    else if (frame_tick) begin // update paddle positions
        if (p1_right && !p1_left) begin
            p1_x <= p1_x + PADDLE_SPEED;
        end
        else if (p1_left && !p1_right) begin
            p1_x <= p1_x - PADDLE_SPEEDß;
        end
    end
end