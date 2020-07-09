`timescale 1ns / 1ps

module HalfAdderSOP(
    input OP_A,
    input OP_B,
    output SUM,
    output CO
    );
    
    assign SUM = (~OP_A & OP_B) | (OP_A & ~OP_B);
    assign CO = OP_A & OP_B;
    
endmodule
