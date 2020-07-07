`timescale 1ns / 1ps

module Problem2(
    input A,
    input B,
    input C,
    input D,
    input E,
    output F
    );
    
    assign F = (A & B & C) | (A & D & E) | (~A & B & C & E) | (~A & C & D & E) |
                (~A & B & C & D) | (~A & B & D & E) | (A & ~B & C & E) |
                (A & B & ~C & D) | (A & B & ~C & E);
    
endmodule
