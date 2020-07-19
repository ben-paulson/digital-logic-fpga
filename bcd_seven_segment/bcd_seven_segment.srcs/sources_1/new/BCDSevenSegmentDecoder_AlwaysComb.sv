// An example of how the BCD-7-segment decoder works
// using a different type of procedural block
`timescale 1ns / 1ps

/*
* bcd is the 4-bit BCD input
* seg is each LED in the 7-segment display
* where the MSB is segment A and LSB is
* the decimal point
*/
module BCDSevenSegmentDecoder_AlwaysComb(
    input [3:0] enable,
    input [3:0] bcd,
    output reg [7:0] seg,
    output [3:0] an
    );
    
    // 0 will turn it on, 1 off
    assign an = ~enable;
    
    /* 
     * Using always_comb instead of always_ff allows 
     * for continuous assignment without a changing bcd condition
     * (which always_ff required)
    */
    always_comb
        case (bcd)
            0: seg <= 8'b00000011;
            1: seg <= 8'b10011111;
            2: seg <= 8'b00100101;
            3: seg <= 8'b00001101;
            4: seg <= 8'b10011001;
            5: seg <= 8'b01001001;
            6: seg <= 8'b01000001;
            7: seg <= 8'b00011111;
            8: seg <= 8'b00000001;
            9: seg <= 8'b00011001;
            default: seg <= 8'b11111111; // Default to turn it off
        endcase
    
endmodule
