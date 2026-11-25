module collision_detection #(
    parameter int SCREEN_WIDTH = 640,
    parameter int SCREEN_HEIGHT = 480,

    parameter int PUCK_RADIUS = 8,
    parameter int PADDLE_RADIUS = 24,

    parameter int GOAL_HEIGHT_NORMAL = 160,
    parameter int GOAL_HEIGHT_SMALL = 100,

    parameter int NUM_REGIONS = 32,
    parameter int FRAC_BITS = 8,
    parameter int COEFF_FRAC_BITS = 8,

    parameter int POS_WIDTH = 10,
    parameter int VEL_WIDTH = 10
)(
    // Player 1 position and velocity
    input logic [POS_WIDTH-1:0] p1_x,
    input logic [POS_WIDTH-1:0] p1_y,
    input logic signed [VEL_WIDTH-1:0] p1_vx,
    input logic signed [VEL_WIDTH-1:0] p1_vy,

    // Player 2 position and velocity
    input logic [POS_WIDTH-1:0] p2_x,
    input logic [POS_WIDTH-1:0] p2_y,
    input logic signed [VEL_WIDTH-1:0] p2_vx,
    input logic signed [VEL_WIDTH-1:0] p2_vy,

    // Puck position and velocity
    input logic signed [POS_WIDTH:0] puck_x,
    input logic signed [POS_WIDTH:0] puck_y,
    input logic signed [VEL_WIDTH-1:0] puck_vx,
    input logic signed [VEL_WIDTH-1:0] puck_vy,

    // Game state
    input logic [1:0] level,
    input logic play_en,

    // Collision response
    output logic collision_valid,
    output logic signed [VEL_WIDTH-1:0] new_vx,
    output logic signed [VEL_WIDTH-1:0] new_vy,

    // Goal detection
    output logic [1:0] goal_event
);

logic signed [11:0] dx1;
logic signed [11:0] dy1;
logic signed [11:0] dx2;
logic signed [11:0] dy2;

assign dx1 = puck_x - $signed({1'b0,p1_x});
assign dy1 = puck_y - $signed({1'b0,p1_y});
assign dx2 = puck_x - $signed({1'b0,p2_x});
assign dy2 = puck_y - $signed({1'b0,p2_y});

logic [24:0] dist_sq1;
logic [24:0] dist_sq2;

assign dist_sq1 = dx1*dx1 + dy1*dy1;
assign dist_sq2 = dx2*dx2 + dy2*dy2;

logic p1_contact;
logic p2_contact;
localparam SQ_SUM = (PADDLE_RADIUS + PUCK_RADIUS)*(PADDLE_RADIUS + PUCK_RADIUS);

assign p1_contact = (dist_sq1 <= SQ_SUM);
assign p2_contact = (dist_sq2 <= SQ_SUM);
    

endmodule