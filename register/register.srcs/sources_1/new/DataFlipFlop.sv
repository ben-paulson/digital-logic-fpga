`timescale 1ns / 1ps

module DataFlipFlop(
    input clk,
    input new_data,
    input set,
    input reset,
    output reg latched_data
    );
    
    // Either set, reset, or latch data on rising edge of clock
    always_ff @(posedge clk) begin
        if (!set && reset) // Reset
            latched_data <= 4'b0000;
        else if (set && !reset) // Set
            latched_data <= 4'b1111;
        else if (!set && !reset) // Latch
            latched_data <= new_data;
    end
    
endmodule
