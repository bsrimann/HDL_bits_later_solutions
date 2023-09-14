module top_module (
	input [2:0] SW,      // R
	input [1:0] KEY,     // L and clk
	output [2:0] LEDR);  // Q
    
    
    reg q0, q1, q2;
    wire d0, d1, d2;
    wire l, clk;
    assign clk = KEY[0];
    assign l = KEY[1];
    assign {d0, d1, d2} = l ? {SW[0], SW[1], SW[2] } :{q2, q0, q1^q2};
    assign LEDR = {q2, q1, q0};
    //output is in reverse order
    //input s is in correct order i.e s[0], goes to r[0]
    always @ (posedge clk) begin
        q0<=d0;
        q1<=d1;
        q2<=d2;
    end
        


endmodule


