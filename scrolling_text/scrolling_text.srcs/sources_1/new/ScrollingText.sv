`timescale 1ns / 1ps

module ScrollingText(
    input clk,
    output [7:0] seg,
    output [3:0] an
    );
    
    reg [27:0] text = 28'b0001010000111100000010001001;
    
    SevenSegmentDecoder # (100) ssd(.disp(text), .clk(clk), .seg(seg), .an(an));
    
endmodule
