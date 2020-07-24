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
    
    wire [4:0] sum;
    
    RippleCarryAdder rca(A, B, sum, 0);
    ValidityCheck vchk(A[4], B[4], sum[4], valid);
    
endmodule
