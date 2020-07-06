`timescale 1ns / 1ps

module Problem1_Simulation();

    logic sA, sB, sC, sD, sF;
    
    Problem1 UUT (
        .A(sA), .B(sB), .C(sC),
        .D(sD), .F(sF));
        
    initial begin
    
        // Use for loop to set A to 0 and 1 when the
        // sequence for B, C, D repeats itself
        for (int i = 0; i < 2; i++) begin
            // A000
            sA = i; sB = 0;
            sC = 0; sD = 0;
            #10;
            
            // A001
            sD = 1;
            #10;
           
            // A010
            sD = 0; sC = 1;
            #10;
            
            // A011
            sD = 1;
            #10;
            
            // A100
            sD = 0; sC = 0; sB = 1;
            #10;
            
            // A101
            sD = 1;
            #10;
            
            // A110
            sD = 0; sC = 1;
            #10;
            
            // A111
            sD = 1;
            #10;
        end
         
    end

endmodule
