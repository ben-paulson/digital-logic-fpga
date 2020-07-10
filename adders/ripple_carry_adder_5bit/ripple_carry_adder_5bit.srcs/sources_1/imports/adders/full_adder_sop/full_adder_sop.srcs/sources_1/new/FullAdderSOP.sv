`timescale 1ns / 1ps

module FullAdderSOP(
    input OP_A,
    input OP_B,
    input Cin,
    output SUM,
    output CO
    );
    
    assign SUM = (~OP_A & ~OP_B & Cin) | (~OP_A & OP_B & ~Cin) |
                 (OP_A & ~OP_B & ~Cin) | (OP_A & OP_B & Cin);
    assign CO = (~OP_A & OP_B & Cin) | (OP_A & ~OP_B & Cin) |
                (OP_A & OP_B & ~Cin) | (OP_A & OP_B & Cin);
    
endmodule
