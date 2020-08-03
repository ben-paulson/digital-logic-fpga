`timescale 1ns / 1ps

/*
* Displays a number on the 7-segment displays.
*/
module SevenSegmentDecoder(
    input [3:0] disp,
    output reg [7:0] seg,
    output reg [3:0] an
    );
    
    // Don't have to use a scanning display
    // because only 1 digit is needed at any time
    always_ff @(disp) begin
        an <= 4'b1110;
        case (disp)
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
            10: seg <= 8'b00010001;
            11: seg <= 8'b11000001;
            12: seg <= 8'b01100011;
            13: seg <= 8'b10000101;
            14: seg <= 8'b01100001;
            15: seg <= 8'b01110001;
            default: seg <= 8'b11111111; // Default to turn it off
        endcase
    end
    
endmodule