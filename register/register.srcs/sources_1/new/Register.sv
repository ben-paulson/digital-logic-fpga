`timescale 1ns / 1ps

/*
* A 4-bit register with synchronous
* set, reset, and latch operations
*/
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
    
    // Use a D flip flop for each bit in the register
    DataFlipFlop bit0(.clk(clk), .new_data(data[0]), .set(set),
                      .reset(reset), .latched_data(contents[0]));
    DataFlipFlop bit1(.clk(clk), .new_data(data[1]), .set(set),
                      .reset(reset), .latched_data(contents[1]));
    DataFlipFlop bit2(.clk(clk), .new_data(data[2]), .set(set),
                      .reset(reset), .latched_data(contents[2]));
    DataFlipFlop bit3(.clk(clk), .new_data(data[3]), .set(set),
                      .reset(reset), .latched_data(contents[3]));
   
    // Display the contents of the register on the 7-segment display
    SevenSegmentDecoder display(.disp(contents), .seg(seg), .an(an));
    
endmodule