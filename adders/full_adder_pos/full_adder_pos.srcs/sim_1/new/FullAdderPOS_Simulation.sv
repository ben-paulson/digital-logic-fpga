`timescale 1ns / 1ps

module FullAdderPOS_Simulation();

    logic sOP_A, sOP_B, sCin, sSUM_SOP, sCO_SOP, sSUM_POS, sCO_POS;

    FullAdderPOS UUT (
        .OP_A(sOP_A), .OP_B(sOP_B), .Cin(sCin), .SUM_SOP(sSUM_SOP),
        .SUM_POS(sSUM_POS), .CO_SOP(sCO_SOP), .CO_POS(sCO_POS));

    initial begin
    
        // Loop through all combinations instead of writing one by one
        for (byte a = 0; a < 2; a++) begin
            for (byte b = 0; b < 2; b++) begin
                for (byte cin = 0; cin < 2; cin++) begin
                    sOP_A = a; sOP_B = b;
                    sCin = cin;
                    #10;
                end
            end
        end
    
    end

endmodule
