`timescale 1ns / 1ps

module FullAdderPOS(
    input Cin,
    input OP_A,
    input OP_B,
    output CO_SOP,
    output SUM_SOP,
    output CO_POS,
    output SUM_POS
    );
    
    // SOP Equations
    assign SUM_SOP = (~OP_A & ~OP_B & Cin) | (~OP_A & OP_B & ~Cin) |
                 (OP_A & ~OP_B & ~Cin) | (OP_A & OP_B & Cin);
    assign CO_SOP = (~OP_A & OP_B & Cin) | (OP_A & ~OP_B & Cin) |
                (OP_A & OP_B & ~Cin) | (OP_A & OP_B & Cin);
                
    // POS equations
    assign SUM_POS = (OP_A | OP_B | Cin) & (OP_A | ~OP_B | ~Cin) &
                     (~OP_A | OP_B | ~Cin) & (~OP_A | ~OP_B | Cin);
    assign CO_POS = (OP_A | OP_B | Cin) & (OP_A | OP_B | ~Cin) &
                    (OP_A | ~OP_B | Cin) & (~OP_A | OP_B | Cin);
    
endmodule
