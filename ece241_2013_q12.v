module top_module (
    input clk,
    input enable,
    input S,
    input A, B, C,
    output Z ); 
    
    reg [0:7] Q;
    always @ (posedge clk)begin
        if(enable) Q <= {S, Q[0:6]};
    end
    
    always @ (*)begin
        case({A, B, C})
            0 : Z = Q[0];
            1 : Z = Q[1];
            2 : Z = Q[2];
            3 : Z = Q[3];
            4 : Z = Q[4];
            5 : Z = Q[5];
            6 : Z = Q[6];
            7 : Z = Q[7];
        endcase
    end

endmodule
