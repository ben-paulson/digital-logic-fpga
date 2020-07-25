`timescale 1ns / 1ps

/*
* A 2:1 Mux used to choose whether or not to change the sign
* of a number. If the original sign is positive, it chooses
* the original number. If negative, it uses two's complement
* of the input.
*/
module Mux(
    input sign,
    input [4:0] pos,
    output reg [4:0] out
    );
    
    // The negative verion of pos input
    logic [4:0] neg;
    // Calculate the two's complement of 'pos', assign to 'neg'
    RippleCarryAdder twoc(.A(~pos), .B(1), .SUM(neg));
    
    // Choose output based on whether the original sign was positive/negative
    always_comb
        case (sign)
            0: out <= pos;
            1: out <= neg;
        endcase
    
endmodule
