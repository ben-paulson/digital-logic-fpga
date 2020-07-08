`timescale 1ns / 1ps

module Problem3(
    input A,
    input B,
    input C,
    input D,
    input E,
    output F
    );
    
    assign F = (~B & D & E) | (~A & C & ~D & E) | (~A & ~B & ~C & D) |
                (~A & ~C & D & E) | (A & ~B & ~C & E) | (A & B & C & E);
    
endmodule
