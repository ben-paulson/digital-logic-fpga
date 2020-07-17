`timescale 1ns / 1ps

/*
* bcd is the 4-bit BCD input
* seg is each LED in the 7-segment display
* where the MSB is segment A and LSB is
* segment G
*/
module BCDSevenSegmentDecoder(
    input [3:0] enable,
    input [3:0] bcd,
    output [6:0] seg,
    output [3:0] an
    );
    
    // Anodes - which segment sections to use
    assign an = ~enable;
    // Segment A
    assign seg[6] = (~bcd[3] & bcd[1]) | (bcd[3] & ~bcd[2] & ~bcd[1]) |
                    (~bcd[2] & ~bcd[1] & ~bcd[0]) | (~bcd[3] & bcd[2] & bcd[0]);
    // Segment B
    assign seg[5] = (~bcd[3] & ~bcd[2]) | (~bcd[2] & ~bcd[1]) |
                    (~bcd[3] & ~(bcd[1] ^ bcd[0]));
    // Segment C
    assign seg[4] = (~bcd[2] & ~bcd[1]) | (~bcd[3] & bcd[2]) | (~bcd[3] & bcd[0]);
    // Segment D
    assign seg[3] = (~bcd[2] & ~bcd[1] & ~bcd[0]) | (~bcd[3] & ~bcd[2] & bcd[1]) |
                    (~bcd[3] & bcd[1] & ~bcd[0]) | (~bcd[3] & bcd[2] & ~bcd[1] & bcd[0]);
    // Segment E
    assign seg[2] = (~bcd[2] & ~bcd[1] & ~bcd[0]) | (~bcd[3] & bcd[1] & ~bcd[0]);
    // Segment F
    assign seg[1] = (~bcd[1] & (bcd[3] ^ bcd[2])) | (~bcd[3] & ~bcd[1] & ~bcd[0]) |
                    (~bcd[3] & bcd[2] & ~bcd[0]);
    // Segment G
    assign seg[0] = (~bcd[1] & (bcd[3] ^ bcd[2])) | (~bcd[3] & ~bcd[2] & bcd[1]) |
                    (~bcd[3] & bcd[1] & ~bcd[0]);
    
endmodule
