module top_module (
    input [3:0] SW,
    input [3:0] KEY,
    output [3:0] LEDR
); //
    
    //SW is r inputs
    wire clk, e, l, w;
    assign {w, l, e, clk} = KEY;
    MUXDFF  md3 (w, SW[3], e, l, clk, LEDR[3]);
    MUXDFF  md2 (LEDR[3], SW[2], e, l, clk, LEDR[2]);
    MUXDFF  md1 (LEDR[2], SW[1], e, l, clk, LEDR[1]);
    MUXDFF  md0 (LEDR[1], SW[0], e, l, clk, LEDR[0]);

endmodule

module MUXDFF (input w, input r, input e, input l, input clk, output q);
    reg q1;
    assign q = q1;
    wire d, i;
    assign i = e ? w : q;
    assign d = l ? r : i;
    
    always @(posedge clk) begin
    	q1 <= d;
    end

endmodule
