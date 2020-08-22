`timescale 1ns / 1ps

module SevenSegmentDecoder # (parameter REFRESH_RATE = 125)(
    input [27:0] disp,
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
    * Function to decode a 7-bit value representing a character
    * to light the correct LEDs on the 7-segment display
    */
    function [7:0] decode;
        input [6:0] value;
        begin
            case (value)
                0: decode = 8'b00000011;
                1: decode = 8'b10011111;
                2: decode = 8'b00100101;
                3: decode = 8'b00001101;
                4: decode = 8'b10011001;
                5: decode = 8'b01001001;
                6: decode = 8'b01000001;
                7: decode = 8'b00011111;
                8: decode = 8'b00000001;
                9: decode = 8'b00011001;
                10: decode = 8'b00010001;
                11: decode = 8'b11000001;
                12: decode = 8'b01100011;
                13: decode = 8'b10000101;
                14: decode = 8'b01100001;
                15: decode = 8'b01110001;
                default: decode = 8'b11111111;
            endcase
        end
    endfunction
    
    /*
    * Use sel to select which anode should turn on
    * so only a single display is lit at one time.
    * Light the correct LEDs according to which anode is on.
    */
    always_ff @(sel) begin
        if (sel == 2'b00) begin
            an <= 4'b0111;
            seg <= decode(disp[27:21]);
        end
        else if (sel == 2'b01) begin
            an <= 4'b1011;
            seg <= decode(disp[20:14]);
        end
        else if (sel == 2'b10) begin
            an <= 4'b1101;
            seg <= decode(disp[13:7]);
        end
        else if (sel == 2'b11) begin
            an <= 4'b1110;
            seg <= decode(disp[6:0]);
        end
    end
    
endmodule
