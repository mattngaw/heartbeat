

`timescale 1ns/1ns

`include "./node.sv"

module Array
    #(parameter WIDTH   = 32,
      parameter DIM     = 4)
     (input logic clk, rst,
      input logic [WIDTH-1:0] A_in [DIM],
      input logic [WIDTH-1:0] B_in [DIM],
      output logic [WIDTH-1:0] C_out [DIM][DIM]);

    logic [WIDTH-1:0] a_net [DIM][DIM+1];
    logic [WIDTH-1:0] b_net [DIM+1][DIM];

    for (genvar k = 0; k < DIM; k++) begin
        assign a_net[k][0] = A_in[k];
        assign b_net[0][k] = B_in[k];
    end

    for (genvar i = 0; i < DIM; i++) begin
        for (genvar j = 0; j < DIM; j++) begin
            Node node (
                .clk, .rst,
                .a_in(a_net[i][j]), .b_in(b_net[i][j]),
                .a_out(a_net[i][j+1]), .b_out(b_net[i+1][j]),
                .c_out(C_out[i][j])
            );
        end
    end

endmodule: Array

