//12-hour clock
module top_module(
    input clk,
    input reset,
    input ena,
    output pm,
    output [7:0] hh,
    output [7:0] mm,
    output [7:0] ss);
    
    reg [3:0] ss2, ss1;
    assign ss = {ss2, ss1};
    
    reg [3:0] mm2, mm1;
    assign mm = {mm2, mm1};
    
    reg [3:0] hh2, hh1;
    assign hh = {hh2, hh1};
    
    always @ (posedge clk)begin
        if (reset)begin
            hh2 <= 4'd1;
        	hh1 <= 4'd2;
        	mm2 <= 4'b0000;
        	mm1 <= 4'b0000;
        	ss2 <= 4'b0000;
        	ss1 <= 4'b0000;
        	pm <= 1'b0;end
        else if ({hh2, hh1, mm2, mm1, ss2, ss1} == {4'd1, 4'd2, 4'd5, 4'd9, 4'd5, 4'd9})begin
            hh2 <= 4'd0;
            hh1 <= 4'd1;
            mm2 <= 4'b0000;
            mm1 <= 4'b0000;
            ss2 <= 4'b0000;
            ss1 <= 4'b0000;end
        else begin
            if(ena) 
                ss1 <= (ss1 + 1'b1) & {4{ss1 != 4'b1001}};
            if(ena & (ss1 == 4'b1001)) 
                ss2 <= (ss2 + 1'b1) & {4{ss2 != 4'b0101}};
            if(ena & (ss2==4'd5) & (ss1==4'd9)) 
                mm1 <= (mm1 + 1'b1) & {4{mm1 != 4'd9}};
            if(ena & (ss2==4'd5) & (ss1==4'd9) & (mm1==4'd9)) 
                mm2 <= (mm2 + 1'b1) & {4{mm2 != 4'd5}};
            if(ena & (ss2==4'd5) & (ss1==4'd9) & (mm2==4'd5) & (mm1==4'd9)) 
                hh1 <= (hh1 + 1'b1) & {4{hh1 != 4'd9}};
            if( ena & (ss2==4'd5) & (ss1==4'd9) & (mm2==4'd5) & (mm1==4'd9) & (hh1 == 4'd9) ) 
                hh2 <= (hh2 + 1'b1);
            if ({hh2, hh1, mm2, mm1, ss2, ss1} == {4'd1, 4'd1, 4'd5, 4'd9, 4'd5, 4'd9})
                pm <= ~pm;
        end
           
    end
    

endmodule
