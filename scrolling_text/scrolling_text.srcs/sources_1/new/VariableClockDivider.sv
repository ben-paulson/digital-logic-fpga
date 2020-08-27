`timescale 1ns / 1ps

/*
* This module is used to divide the 100MHz clock
* to a slower frequency chosen by the speed input
*/
module VariableClockDivider # (parameter BASE_FREQ = 1)(
    input [5:0] speed,
    input clk,
    output reg div_clk
    );
    
    // Create increasingly larger frequencies based on the parameter
    logic base_clk;                 // Declare clock signals
    localparam SLOW = BASE_FREQ * 2; logic slow_clk;
    localparam MID = SLOW * 2; logic mid_clk;
    localparam FAST = MID * 2; logic fast_clk;
    localparam FASTER = FAST * 2; logic faster_clk;
    localparam FASTEST = FASTER * 2; logic fastest_clk;
    
    always @(posedge clk)
    begin
        // Choose the right clock as output based on the input speed
        case (speed)
            3: div_clk = slow_clk;       // 2 switches up
            7: div_clk = mid_clk;        // 3 switches up
            15: div_clk = fast_clk;      // 4 switches up
            31: div_clk = faster_clk;    // 5 switches up
            63: div_clk = fastest_clk;   // 6 switches up
            default: div_clk = base_clk; // 1 switch up, or anything else
        endcase
    end
    
    // Assign each possible speed to a different clock
    ClockDivider #(BASE_FREQ) (.clk(clk), .div_clk(base_clk));
    ClockDivider #(SLOW) (.clk(clk), .div_clk(slow_clk));
    ClockDivider #(MID) (.clk(clk), .div_clk(mid_clk));
    ClockDivider #(FAST) (.clk(clk), .div_clk(fast_clk));
    ClockDivider #(FASTER) (.clk(clk), .div_clk(faster_clk));
    ClockDivider #(FASTEST) (.clk(clk), .div_clk(fastest_clk));
    
endmodule