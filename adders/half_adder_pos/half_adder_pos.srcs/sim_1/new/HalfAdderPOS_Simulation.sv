`timescale 1ns / 1ps

module HalfAdderPOS_Simulation();

    logic sOP_A, sOP_B, sSUM_SOP, sCO_SOP, sSUM_POS, sCO_POS;

    HalfAdderPOS UUT (
        .OP_A(sOP_A), .OP_B(sOP_B), .SUM_SOP(sSUM_SOP),
        .SUM_POS(sSUM_POS), .CO_SOP(sCO_SOP), .CO_POS(sCO_POS));

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
