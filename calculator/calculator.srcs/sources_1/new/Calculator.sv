`timescale 1ns / 1ps

module Calculator(
    input [4:0] A,
    input [4:0] B,
    input sub,
    output neg,
    output valid,
    output [4:0] twoc,
    output [6:0] seg,
    output [3:0] an
    );
    
    logic [4:0] sum;
    logic [4:0] B_INV;
    logic [4:0] B_use;
    
    // Add 1 to the inverse of B to get 2's comp of B
    RippleCarryAdder(~B, 1, B_INV, 0);
    
    always_ff @(sub)
        case (sub)
            0: B_use <= B;
            1: B_use <= B_INV;
        endcase
    
    RippleCarryAdder rca(A, B_use, sum, 0);
    ValidityCheck vchk(A[4], B_use[4], sum[4], valid);
    SevenSegmentDecoder ssd(sum, seg, an);
    
    assign twoc = B_INV;
    assign neg = B_use[4];
    
endmodule
