`timescale 1ns / 1ps

module Problem1(
    input A,
    input B,
    input C,
    input D,
    output F
    );

    assign F = (~A & B & ~C) | (A & ~B & C) | (~A & D) | (~A & ~B & C) | (A & C & ~D);
    
endmodule
