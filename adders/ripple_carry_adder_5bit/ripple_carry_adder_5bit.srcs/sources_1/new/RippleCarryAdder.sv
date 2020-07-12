`timescale 1ns / 1ps

module RippleCarryAdder(
    input [4:0] A,
    input [4:0] B,
    output [4:0] SUM,
    output CO
    );
    
    // Make a wire variable to connect the carry out
    // from one adder to the carry in of another
    wire [3:0] Cout;
    
    // Use the HA and FA modules to successively change the outputs
    HalfAdderSOP Bit0(A[0], B[0], SUM[0], Cout[0]);
    FullAdderSOP Bit1(A[1], B[1], Cout[0], SUM[1], Cout[1]);
    FullAdderSOP Bit2(A[2], B[2], Cout[1], SUM[2], Cout[2]);
    FullAdderSOP Bit3(A[3], B[3], Cout[2], SUM[3], Cout[3]);
    FullAdderSOP Bit4(A[4], B[4], Cout[3], SUM[4], CO);
    
endmodule
