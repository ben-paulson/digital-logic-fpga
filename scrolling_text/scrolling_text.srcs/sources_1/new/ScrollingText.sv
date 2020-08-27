`timescale 1ns / 1ps

/*
This module is a FSM that controls a stream of scrolling text
across the four 7-segment displays on the Basys3 board. The text
can be added to by the 7-bit code input, which represents ASCII
characters A-Z. After the full text is written (indicated by start),
the text will begin continuously scrolling across the screen, with a
waiting period after it has fully passed. The text has a maximum length
of 10 characters, or 70 bits, since the ASCII codes for A-Z do not require
the MSB of the normally-8-bit codes (it is always zero). The text can be
rewritten using the reset input, which will reset the text, stop
scrolling, and wait for more to be written.
*/
module ScrollingText(
    input [6:0] code,
    input [5:0] speed,
    input clk,
    input reset,
    input start,
    input write,
    output [7:0] seg,
    output [3:0] an
    );
    
    // Initial values of text and display, all zeros
    reg [97:0] disp = 98'b0;
    reg [69:0] text = 70'b0;
    /* Variable to keep the value of the display immediately after starting
       to scroll so that it can be reset after exiting the wait state */
    reg [97:0] text_hold;
    /* Keep track of how many characters are written and how many scrolls
       have happened to know when to switch states */
    reg [3:0] num_chars = 4'b0, num_scrolls = 4'b0;
    // Keep track of the number of waits to know when to exit the wait state
    reg [1:0] num_waits = 2'b00;
    // The last state of the clock controlling the speed of scrolling (scroll_clk)
    logic scroll = 0;
    
    // Wait state should last 3 scroll_clk ticks
    localparam MAX_WAITS = 2'b11;
    // Allow no more than 10 characters at one time
    localparam MAX_CHARS = 10;
    // Size of an encoded character, 7 bits in this case
    localparam CHAR_SIZE = 7;
    
    // Give the states values
    parameter [2:0] st_write=2'b00, st_write_disabled=2'b01,
                    st_scroll=2'b10, st_wait=2'b11;
    // Present state and next state variables, start in st_write
    reg [2:0] ps, ns = st_write;
    // Clock that determines speed of scrolling and wait states
    logic scroll_clk;
    VariableClockDivider #(1) slow(.speed(speed), .clk(clk), .div_clk(scroll_clk));
    // Clock that ticks slow enough to account for bouncing switches
    logic debounce_clk;
    ClockDivider #(1000) debounce(.clk(clk), .div_clk(debounce_clk));
    
    // Called right before entering the scroll state
    function void set_scroll_values();
        /* Shift 28 bits of 0s to the MSBs of disp so the display appears empty
           to begin the scrolling. Or it with the text shifted to the appropriate
           value based on the number of characters so that the text begins
           immediately to the right of the rightmost 7-segment display */
        disp = (28'b0 << (CHAR_SIZE * MAX_CHARS)) | 
               (text << ((CHAR_SIZE * MAX_CHARS) - (CHAR_SIZE * num_chars)));
        /* Hold the starting display value so it can be reassigned when
           scrolling repeats */
        text_hold = disp;
        num_scrolls = 4'b0;
    endfunction 

    // Go to next state at rising edge of clk
    always @(posedge clk)
        ps = ns;
    
    // Choose state, handle reset, update variables
    always @(posedge debounce_clk, posedge reset) begin
        // Reset takes precedence
        if (reset == 1) begin
            num_chars = 4'b0;
            text = 70'b0;
            disp = 98'b0;
            ns = st_write;
        end
        else begin
            case (ps)
                st_write:
                begin
                    if (start == 1) begin
                        // Prepare for scrolling
                        set_scroll_values();
                        ns = st_scroll;
                    end
                    else if (write == 1) begin // New char entered
                        // Write new char to LSBs of text
                        text = (text << CHAR_SIZE) | code;
                        /* Write new char to bits [76:70] of disp so it shows up on the
                           display as new characters are written*/
                        disp = (disp << CHAR_SIZE) | (code << (CHAR_SIZE * MAX_CHARS));
                        /* Hold num_chars if at max so it doesn't
                        *  count up when characters are overridden
                        */
                        num_chars = (num_chars == MAX_CHARS) ? MAX_CHARS : num_chars + 1;
                        ns = st_write_disabled;
                    end
                end
                st_write_disabled:
                begin
                    if (start == 1) begin
                        // Prepare for scrolling
                        set_scroll_values();
                        ns = st_scroll;
                    end
                    // Make sure write goes low before allowing to write again
                    else if (write == 0) ns = st_write;
                end
                st_scroll:
                begin
                    // Only scroll if scroll_clk has gone from low to high
                    if (scroll == 0 && scroll_clk == 1) begin
                        // Add 4 to so the text goes completely off the displays
                        if (num_scrolls == num_chars + 4) begin // Shifting is complete
                            num_waits = 2'b0;
                            ns = st_wait;
                        end
                        else begin // Shifting is not complete
                            // Shifting left 7 bits will shift over 1 character
                            disp = (disp << CHAR_SIZE);
                            num_scrolls++;
                            ns = st_scroll;
                        end
                    end
                end
                st_wait:
                begin
                    // Only wait if scroll_clk has gone from low to high
                    if (scroll == 0 & scroll_clk == 1) begin
                        if (num_waits == MAX_WAITS) begin // Waiting is complete
                            num_scrolls = 4'b0;
                            disp = text_hold;
                            ns = st_scroll;
                        end
                        else begin // Keep waiting
                            num_waits++;
                            ns = st_wait;
                        end
                    end
                end
            endcase
            // Keep track of last scroll_clk state (high or low)
            scroll = scroll_clk;
        end
    end
    
    // Display MSBs of the disp variable (4 segments)
    SevenSegmentDecoder # (100) ssd(.disp(disp[97:70]), .clk(clk), .seg(seg), .an(an));
    
endmodule
