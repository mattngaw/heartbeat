module Node
    #(parameter WIDTH   = 32)
     (input logic               clk, rst,
      input logic [WIDTH-1:0]   a_in, b_in,
      output logic [WIDTH-1:0]  a_out, b_out, c_out);

    logic [WIDTH-1:0] a_curr, b_curr, c_curr;
    logic [WIDTH-1:0] a_next, b_next, c_next;

    assign a_out = a_curr;
    assign b_out = b_curr;
    assign c_out = c_curr;

    assign a_next = a_in;
    assign b_next = b_in;
    assign c_next = c_curr + a_next * b_next;

    always_ff @(posedge clk, posedge rst) begin
        if (rst) begin
            a_curr <= 'd0;
            b_curr <= 'd0;
            c_curr <= 'd0;
        end
        else begin
            a_curr <= a_next;
            b_curr <= b_next;
            c_curr <= c_next;
        end
    end

endmodule: Node
