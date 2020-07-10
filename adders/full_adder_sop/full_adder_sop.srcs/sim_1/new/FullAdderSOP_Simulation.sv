`timescale 1ns / 1ps

module FullAdderSOP_Simulation();

    logic sOP_A, sOP_B, sCin, sSUM, sCO;
    
    FullAdderSOP UUT (
        .OP_A(sOP_A), .OP_B(sOP_B),
        .Cin(sCin), .SUM(sSUM), .CO(sCO));
        
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
