// circuit in which data input passes to output at every clock edge
// approach 1
module top_module (
    input clk,
    input d,
    output q
);  
    reg qp, qn;
    always @ (posedge clk) qp <= d;
    always @ (negedge clk) qn <= d;
    assign q = clk ? qp : qn;
endmodule
