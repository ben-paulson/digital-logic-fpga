`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 06/26/2020 02:55:08 PM
// Design Name: 
// Module Name: Lab0_Tutorial
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


module Lab0_Tutorial(
    input A,
    input B,
    input C,
    input D,
    output X,
    output Y,
    output Z
    );
    
    assign X = (A & B) | (C & D);
    assign Y = (A | B) & (C | D);
    assign Z = A ^ B ^ C ^ D;
    
endmodule
