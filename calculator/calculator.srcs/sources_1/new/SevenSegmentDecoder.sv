`timescale 1ns / 1ps

module SevenSegmentDecoder(
    input [4:0] sum,
    output reg [7:0] seg,
    output [3:0] an
    );
    
    always_ff @(sum)
        case (sum)
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
