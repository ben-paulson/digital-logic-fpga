`timescale 1ns / 1ps

module HalfAdderPOS(
    input OP_A,
    input OP_B,
    output SUM_SOP,
    output CO_SOP,
    output SUM_POS,
    output CO_POS
    );
    
    // SOP equations
    assign SUM_SOP = (~OP_A & OP_B) | (OP_A & ~OP_B);
    assign CO_SOP = OP_A & OP_B;
    
    // POS equations
    assign SUM_POS = (OP_A | OP_B) & (~OP_A | ~OP_B);
    assign CO_POS = (OP_A | OP_B) & (OP_A | ~OP_B) & (~OP_A | OP_B);
    
endmodule
