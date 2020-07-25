`timescale 1ns / 1ps

/*
* Removed carry out (CO) output
* as it is not needed for the Calculator module
*/
module RippleCarryAdder(
    input [4:0] A,
    input [4:0] B,
    output [4:0] SUM
    );
    
    wire [3:0] Cout;
    
    // Use the FA modules to successively change the outputs
    FullAdderSOP Bit0(.OP_A(A[0]), .OP_B(B[0]), .Cin(0), .SUM(SUM[0]), .CO(Cout[0]));
    FullAdderSOP Bit1(.OP_A(A[1]), .OP_B(B[1]), .Cin(Cout[0]), .SUM(SUM[1]), .CO(Cout[1]));
    FullAdderSOP Bit2(.OP_A(A[2]), .OP_B(B[2]), .Cin(Cout[1]), .SUM(SUM[2]), .CO(Cout[2]));
    FullAdderSOP Bit3(.OP_A(A[3]), .OP_B(B[3]), .Cin(Cout[2]), .SUM(SUM[3]), .CO(Cout[3]));
    FullAdderSOP Bit4(.OP_A(A[4]), .OP_B(B[4]), .Cin(Cout[3]), .SUM(SUM[4]), .CO(Cout[4]));
    
endmodule
