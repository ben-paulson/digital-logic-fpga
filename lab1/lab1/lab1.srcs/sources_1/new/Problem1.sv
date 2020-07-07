`timescale 1ns / 1ps

module Problem1(
    input P1,
    input P2,
    input A,
    input B,
    input C,
    input D,
    output F,
    output P
    );

    assign F = ((~A & B & ~C) | (A & ~B & C) | (~A & D) | (~A & ~B & C) |
                (A & C & ~D)) & (P1 & ~P2);
    
endmodule
