`timescale 1ns / 1ps

module HalfAdderSOP_Simulation();

    logic sOP_A, sOP_B, sSUM, sCO;

    HalfAdderSOP UUT (
        .OP_A(sOP_A), .OP_B(sOP_B),
        .SUM(sSUM), .CO(sCO));

    initial begin
    
        sOP_A = 0; sOP_B = 0;
        #10;
        
        sOP_B = 1;
        #10;
        
        sOP_A = 1; sOP_B = 0;
        #10;
        
        sOP_B = 1;
        #10;
    
    end

endmodule
