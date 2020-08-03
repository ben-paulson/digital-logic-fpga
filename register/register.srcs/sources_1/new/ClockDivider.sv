`timescale 1ns / 1ps

/*
* This module is used to divide the 100MHz clock
* to a slower frequency set by the FREQ parameter.
*/
module ClockDivider # (parameter FREQ = 100000000)(
    input clk,
    output reg div_clk
    );
    
    // frequency of internal 100mhz clock in hz
    localparam CLK_HZ = 100000000;
    // Variables for dividing the clk frequency
    localparam counter_limit = CLK_HZ / FREQ;
    int counter = 0;
    initial div_clk = 0;
    /*
    * Increases the value of counter by 1 every clock tick (100MHz).
    * After it hits the limit, div_clock goes high or low and the counter is reset.
    */
    always @(posedge clk)
    begin
        if (counter == counter_limit) begin
            counter <= 0;
            div_clk <= ~div_clk;
        end
        else 
            counter <= counter + 1;
    end
    
endmodule