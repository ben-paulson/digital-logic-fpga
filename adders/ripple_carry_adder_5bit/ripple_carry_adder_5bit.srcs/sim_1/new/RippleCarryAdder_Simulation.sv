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

    // 5-bit inputs and output (include [4:0])
    logic [4:0] sA, sB, sSUM;
    // 1-bit output
    logic sCO;
    
    RippleCarryAdder UUT(
        .A(sA), .B(sB), .SUM(sSUM), .CO(sCO));
        
    // The number of bits in the adder
    localparam bits = 5;
    // Delay time - total runtime will be ((2 ** (2 * bits)) * delay) time units.
    // 10240 ns in this case.
    localparam delay = 10;
        
    initial begin
        
        // Use only 2 for loops instead of 10 (1 for each bit of A and B)
        // by assigning the entire variable at one time in this way.
        // It works the same as 10 loops but is much more readable
        // and less messy
        for (byte a = 0; a < 2 ** bits; a++) begin
            for (byte b = 0; b < 2 ** bits; b++) begin
                sA = a[4:0];
                sB = b[4:0];
                #delay;
            end
        end
    
    end

endmodule
