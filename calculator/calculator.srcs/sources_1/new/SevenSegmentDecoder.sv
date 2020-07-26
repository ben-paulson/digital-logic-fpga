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
    input [4:0] sum,
    input clk,
    output reg [6:0] seg,
    output reg [3:0] an
    );
    
    // The positive version of sum
    logic [4:0] disp;
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
    * Choose which version of the sum to use for displaying.
    * Since we want the magnitude in hex, the number has to be
    * positive, so if it is negative, use two's complement
    * of the sum to display on the 7-segment
    */             
    Mux choose_disp(.sign(sum[4]), .pos(sum), .out(disp));
    
    /*
    * Use sel to select which anode should turn on
    * so only a single display is lit at one time.
    * Light the correct LEDs according to which anode is on.
    */
    always_ff @(sel) begin
        if (sel == 2'b00) begin
            // First segment, display nothing
            an <= 4'b0111;
            seg <= 7'b1111111;
        end
        else if (sel == 2'b01) begin
            // Second segment, display nothing
            an <= 4'b1011;
            seg <= 7'b1111111;
        end
        else if (sel == 2'b10) begin
            // Third segment, display negative sign if negative, else nothing
            an <= 4'b1101;
            if (sum[4] == 0) seg <= 7'b1111111;
            else seg <= 7'b1111110;
        end
        else begin
            // Fourth segment, display sum
            an <= 4'b1110;
            case (disp) // Make sure it is the positive form
                0: seg <= 7'b0000001;
                1: seg <= 7'b1001111;
                2: seg <= 7'b0010010;
                3: seg <= 7'b0000110;
                4: seg <= 7'b1001100;
                5: seg <= 7'b0100100;
                6: seg <= 7'b0100000;
                7: seg <= 7'b0001111;
                8: seg <= 7'b0000000;
                9: seg <= 7'b0001100;
                10: seg <= 7'b0001000;
                11: seg <= 7'b1100000;
                12: seg <= 7'b0110001;
                13: seg <= 7'b1000010;
                14: seg <= 7'b0110000;
                15: seg <= 7'b0111000;
                default: seg <= 7'b1111111; // Default to turn it off
            endcase
        end
    end
    
endmodule
