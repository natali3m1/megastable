module puck_physics #(
    parameter int WIDTH = 640,
    parameter int HEIGHT = 480,
    parameter int RADIUS = 8
)(
    input logic clk,
    input logic reset,
    input logic physics_tick,

    output logic [9:0] puck_x,
    output logic [9:0] puck_y
);


endmodule