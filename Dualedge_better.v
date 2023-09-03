// we need to avoid clock in datapath so a possible solution to dual edge triggered Flipflop circuit is
//a short video explaining ralf's circuit :https://www.youtube.com/watch?v=8FgTD1q88_E

module top_module (
    input clk,
    input d,
    output q
);  
    reg qp, qn;
    always @ (posedge clk) qp <= d ^ qn;
    always @ (negedge clk) qn <= d ^ qp;
    assign q = qp ^ qn;
endmodule
