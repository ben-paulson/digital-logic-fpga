`timescale 1ns / 1ps

module Register(
    input [3:0] data,
    input clk,
    input set,
    input reset,
    output [7:0] seg,
    output [3:0] an
    );
    
    logic [3:0] contents;
    initial contents = 4'b0000;
    
    // Either set, reset, or latch data on rising edge of clock
    always_ff @(posedge clk) begin
        if (set == 0 && reset == 1)
            contents <= 4'b0000;
        else if (set == 1 && reset == 0)
            contents <= 4'b1111;
        else if (set == 0 && reset == 0)
            contents <= data;
    end
    // Display the contents of the register on the 7-segment display
    SevenSegmentDecoder display(.disp(contents), .seg(seg), .an(an));
    
endmodule