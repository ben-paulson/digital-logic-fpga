`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 07/10/2020 09:50:43 AM
// Design Name: 
// Module Name: RippleCarryAdder_Simulation
// Project Name: 
// Target Devices: 
// Tool Versions: 
// Description: 
// 
// Dependencies: 
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
//////////////////////////////////////////////////////////////////////////////////


module RippleCarryAdder_Simulation();

    reg [4:0] sA, sB, sSUM;
    logic sCO;
    
    RippleCarryAdder UUT(
        .A(sA), .B(sB), .SUM(sSUM), .CO(sCO));
        
    initial begin
        // Use 10 for loops:
        // 5 for 5 bits of input A
        // 5 for 5 bits of input B
        // Total simulation time will be 2^10 * 10ns
        //
        // With this many loops it starts to look messy
        // Maybe there is a better way?
        for (byte a4 = 0; a4 < 2; a4++) begin
            for (byte a3 = 0; a3 < 2; a3++) begin
                for (byte a2 = 0; a2 < 2; a2++) begin
                    for (byte a1 = 0; a1 < 2; a1++) begin
                        for (byte a0 = 0; a0 < 2; a0++) begin
                            for (byte b4 = 0; b4 < 2; b4++) begin
                                for (byte b3 = 0; b3 < 2; b3++) begin
                                    for (byte b2 = 0; b2 < 2; b2++) begin
                                        for (byte b1 = 0; b1 < 2; b1++) begin
                                            for (byte b0 = 0; b0 < 2; b0++) begin
                                                // Set all variables
                                                sA[0] = a0; sA[1] = a1; sA[2] = a2; sA[3] = a3; sA[4] = a4;
                                                sB[0] = b0; sB[1] = b1; sB[2] = b2; sB[3] = b3; sB[4] = b4;
                                                #10; // delay
                                            end
                                        end
                                    end
                                end
                            end
                        end
                    end
                end
            end
        end
    
    end

endmodule
