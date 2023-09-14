module top_module(
    input clk,
    input reset,    // Active-high synchronous reset to 32'h1
    output [31:0] q
); 
    wire q31;
    reg [31:0] qr;
    assign q = qr;
    assign q31 = qr[31]^qr[21]^qr[1]^qr[0];
    always @ (posedge clk) begin
        if (reset) qr<=32'h1;
        else qr<={q[0], q[31:23], q[22]^q[0], q[21:3], q[2]^q[0], q[1]^q[0]};
    end
    

endmodule
