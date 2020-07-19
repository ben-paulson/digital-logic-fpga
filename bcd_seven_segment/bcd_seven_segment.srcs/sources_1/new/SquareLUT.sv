// This module is separate from the BCD-7-segment.
// It is an exercise for look up tables
`timescale 1ns / 1ps

/*
* Takes a 4-bit input and outputs
* the square of it using a lookup table.
* Output must be 8 bits to account for all possibilities
*/
module SquareLUT(
    input [3:0] in,
    output reg [7:0] out
    );
    
    always_ff @(in)
        case (in)
            0: out <= 8'b00000000; // 0
            1: out <= 8'b00000001; // 1
            2: out <= 8'b00000100; // 4
            3: out <= 8'b00001001; // 9
            4: out <= 8'b00010000; // 16
            5: out <= 8'b00011001; // 25
            6: out <= 8'b00100100; // 36
            7: out <= 8'b00110001; // 49
            8: out <= 8'b01000000; // 64
            9: out <= 8'b01010001; // 81
            10: out <= 8'b01100100; // 100
            11: out <= 8'b01111001; // 121
            12: out <= 8'b10010000; // 144
            13: out <= 8'b10101001; // 169
            14: out <= 8'b11000100; // 196
            15: out <= 8'b11100001; // 225
        endcase
    
endmodule
