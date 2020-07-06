`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 06/26/2020 04:20:00 PM
// Design Name: 
// Module Name: Lab0_Simulation
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


module Lab0_Simulation();
    
    logic sA, sB, sC, sD, sX, sY, sZ;
    
    Lab0_Tutorial UUT (
        .A(sA), .B(sB), .C(sC),
        .D(sD), .X(sX), .Y(sY),
        .Z(sZ));
        
    initial begin
    
        sA = 0; sB = 0;
        sC = 0; sD = 0;
        #10; // A # indicates a delay, in nanoseconds
        
        sD = 1;
        #10; // Must delay between each change to represent all possible scenarios
        
        sC = 1; sD = 0;
        #10; // Otherwise only the final simulation will be run
        
        sA = 1; sB = 1;
        sC = 1; sD = 1;
    
    end
    
endmodule
