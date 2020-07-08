`timescale 1ns / 1ps

module Problem2_Simulation();

logic sA, sB, sC, sD, sE, sF, sG;
    
    Problem2 UUT (
        .A(sA), .B(sB), .C(sC),
        .D(sD), .E(sE), .F(sF), .G(sG));
        
    initial begin
        // Same technique as in problem 1
        for (byte a = 0; a < 2; a++) begin
            for (byte b = 0; b < 2; b++) begin
                for (byte c = 0; c < 2; c++) begin
                    for (byte d = 0; d < 2; d++) begin
                        for (byte e = 0; e < 2; e++) begin
                            sA = a; sB = b;
                            sC = c; sD = d; sE = e;
                            #10; // delay amount (ns)
                        end
                    end
                end
            end
        end
    end

endmodule
