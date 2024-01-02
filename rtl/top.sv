`include "./node.sv"

module Array
    #(parameter WIDTH   = 32,
      parameter DIM     = 4)
     (input logic clk, rst);

    logic [WIDTH-1:0] a_net [DIM][DIM+1];
    logic [WIDTH-1:0] b_net [DIM][DIM+1];
    logic [WIDTH-1:0] c_net [DIM][DIM];

    for (genvar i = 0; i < DIM; i++) begin
        for (genvar j = 0; j < DIM; j++) begin
            Node node(
                .clk, .rst,
                .a_in(a_net[i][j]), .b_in(b_net[i][j]),
                .a_out(a_net[i][j+1]), .b_out(b_net[i][j+1]),
                .c_out(c_net[i][j])
            );
        end
    end

endmodule: Array
    
