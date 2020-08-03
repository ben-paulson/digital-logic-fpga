`timescale 1ns / 1ps

/*
* Displays a number on the 7-segment displays.
* Uses a scanning display controller to continuously
* switch between the 4 available displays so that each
* can be treated individually.
* The parameter REFRESH_RATE is the rate (in Hz) at which all
* 4 displays are updated. The Basys3 Board Reference Manual
* recommends a refresh rate between 60Hz and 1KHz.
*/
module SevenSegmentDecoder # (parameter REFRESH_RATE = 125)(
    input [4:0] disp,
    input clk,
    output reg [7:0] seg,
    output reg [3:0] an
    );
    
    // 2-bit number for selecting which display to turn on/off
    logic [1:0] sel;
    initial sel = 2'b00;
    
    /*
    * Make a clock with a slower frequency so that the
    * display is clear. The clock frequency will be 4 times
    * the refresh rate to account for all 4 displays
    */
    logic div_clk;
    ClockDivider #(REFRESH_RATE * 4) (.clk(clk), .div_clk(div_clk));
    
    // Increase selection every tick of the slow clock
    always @(posedge div_clk)
        sel <= sel + 1;
    
    /*
    * Use sel to select which anode should turn on
    * so only a single display is lit at one time.
    * Light the correct LEDs according to which anode is on.
    */
    always_ff @(sel) begin
        if (sel == 2'b00) begin
            // First segment, display nothing
            an <= 4'b0111;
            seg <= 8'b11111111;
        end
        else if (sel == 2'b01) begin
            // Second segment, display nothing
            an <= 4'b1011;
            seg <= 8'b11111111;
        end
        else if (sel == 2'b10) begin
            // Third segment, display nothing
            an <= 4'b1101;
            seg <= 8'b11111111;
        end
        else begin
            // Fourth segment, display sum
            an <= 4'b1110;
            case (disp)
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
                10: seg <= 8'b00010001;
                11: seg <= 8'b11000001;
                12: seg <= 8'b01100011;
                13: seg <= 8'b10000101;
                14: seg <= 8'b01100001;
                15: seg <= 8'b01110001;
                default: seg <= 8'b11111111; // Default to turn it off
            endcase
        end
    end
    
endmodule
