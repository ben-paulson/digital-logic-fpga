`timescale 1ns / 1ps

/*
* INPUTS:
* A - The first input to the calculator
* B - The second input to the calculator
* sub - Whether the operation should be subtraction
*       or not (Addition by default).
* 
* OUTPUTS:
* neg - Whether the result is negative or not (1 if neg, 0 if not)
* valid - Whether the result is valid (1 if valid, 0 if not)
* twoc - The two's complement of the result, displayed on LEDs
* seg - The 7 segment display cathodes
* an - The 7-segment display anodes
*/
module Calculator(
    input [4:0] A,
    input [4:0] B,
    input sub,
    input clk,
    output neg,
    output valid,
    output [4:0] twoc,
    output [7:0] seg,
    output [3:0] an
    );
    
    /*
    * B_use - The version of B that is used -
    *         B if adding, 2's comp if subtracting
    */          
    logic [4:0] B_use;
    /*
    * Choose which version of B to use for the calculation
    * Use B if adding (B is positive)
    * Use two's complement of B if subtracting
    */
    Mux choose_b(.sign(sub), .pos(B), .out(B_use));
    
    // Perform the operation
    RippleCarryAdder rca(.A(A), .B(B_use), .SUM(twoc));
    
    /* 
    * Check for validity by sending sign bits of inputs and output
    * to ValidityCheck module
    */
    ValidityCheck vchk(.sign_a(A[4]), .sign_b(B_use[4]),
                       .sign_result(twoc[4]), .valid(valid));                       
    // Display the result on the 7-segment display w/ 100Hz refresh rate
    SevenSegmentDecoder # (100) ssd(.sum(twoc), .clk(clk), .seg(seg), .an(an));
    
    // Light an LED if the result is negative
    assign neg = twoc[4];
    
endmodule
