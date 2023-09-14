module top_module(
    input clk,
    input load,
    input [511:0] data,
    output [511:0] q
);  
    reg [511:0] c;
    assign q = c;
    wire [511:0] right_elements, left_elements;
    assign right_elements = {{c[510:0]}, 1'b0};
    assign left_elements  = {1'b0, {c[511:1]}};
    
    always @ (posedge clk)begin
        if (load) c<=data;
        //build the function with K-map
        else c<= ~left_elements&c | (c ^ right_elements);
    
    end

endmodule
