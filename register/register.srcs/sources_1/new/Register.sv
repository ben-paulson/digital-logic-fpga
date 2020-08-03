`timescale 1ns / 1ps

module Register(
    input [3:0] data,
    input clk,
    input set,
    input reset,
    output reg [3:0] contents,
    output [7:0] seg,
    output [3:0] an
    );
    
    initial contents = 4'b0000;
    always_ff @(posedge clk) begin
        if (set == 0 && reset == 1)
            contents <= 4'b0000;
        else if (set == 1 && reset == 0)
            contents <= 4'b1111;
        else if (set == 0 && reset == 0)
            contents <= data;
        SevenSegmentDecoder(.disp(contents), .seg(seg), .an(an));
    end
    
endmodule
