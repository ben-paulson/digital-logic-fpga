`timescale 1ns / 1ps

module Problem1_Simulation();

    logic sA, sB, sC, sD, sF;
    
    Problem1 UUT (
        .A(sA), .B(sB), .C(sC),
        .D(sD), .F(sF));
        
    initial begin
        // Use a for loop for each bit to generate each
        // possible combination instead of typing them manually
        //
        // Not sure if there's a better way to to this -
        // but it's better than typing every combination
        for (byte a = 0; a < 2; a++) begin
            for (byte b = 0; b < 2; b++) begin
                for (byte c = 0; c < 2; c++) begin
                    for (byte d = 0; d < 2; d++) begin
                        sA = a; sB = b;
                        sC = c; sD = d;
                        #10; // delay amount (ns)
                    end
                end
            end
        end
    end

endmodule
