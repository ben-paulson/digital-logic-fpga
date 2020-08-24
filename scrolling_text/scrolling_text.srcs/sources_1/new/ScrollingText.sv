`timescale 1ns / 1ps

module ScrollingText(
    input [6:0] code,
    input clk,
    input reset,
    input start,
    input write,
    output [7:0] seg,
    output [3:0] an,
    output reg scrolling
    );
    
    reg [97:0] disp = 98'b11111111111111111111111111110000000000000000000000000000000000000000000000000000000000000000000000;
    reg [69:0] text = 70'b1111111111111111111111111111111111111111111111111111111111111111111111;
    reg [97:0] text_hold;
    reg [3:0] num_chars = 4'b0, num_scrolls = 4'b0;
    logic can_write = 1, scroll = 0;
    reg [1:0] num_waits = 2'b00;
    localparam MAX_WAITS = 2'b11;
    initial scrolling = 0;
    
    parameter [2:0] st_write=2'b00, st_scroll=2'b01,
                    st_wait=2'b10, st_write_high=2'b11;
    reg [2:0] ps, ns = st_write;
    
    logic div_clk;
    ClockDivider #(10) slow(.clk(clk), .div_clk(div_clk));
    
    always @(posedge reset, posedge clk)
        if (reset == 1) begin
//            text = 28'b1;
//            num_chars = 4'b0;
            ps = st_write;
        end
        else ps = ns;
        
    always @(posedge clk) begin // @ code, ps
//        $display("State: %b", ps);
        case (ps)
            st_write:
            begin
//                $display("Write: %b", write);
                $display("Text: %b", text);
                if (~start & write & can_write) begin
                    can_write = 0;
                    text = (text << 7) | code;
                    disp = (disp << 7) | (code << 70);
                    /* Hold num_chars if at max so it doesn't
                    *  count up when characters are overridden
                    */
                    num_chars = (num_chars == 4'b1111) ? 4'b1111 : num_chars + 1;
//                    $display("num_chars: %b", num_chars);
                    ns = st_write;
                end
                else if (~start & ~write) begin
                    can_write = 1;
                    ns = st_write;
                end
                else if (start == 1) begin
                    disp = (28'b1111111111111111111111111111 << 70) | (text << (70 - (7 * (num_chars))));
                    $display("Display at start: %b", disp);
                    text_hold = disp;
                    num_scrolls = 4'b0;
                    ns = st_scroll;
                end
            end
            st_scroll:
            begin
                if (~scroll & div_clk) begin
                    scrolling = 1;
                    //text = 28'b0;
//                    $display("num_scrolls: %b", num_scrolls);
//                    $display("num_chars: %b", num_chars);
                    $display("Display: %b", disp);
                    if (num_scrolls == num_chars + 4) begin
                        num_waits = 2'b0;
                        ns = st_wait;
                    end
                    else begin
                        disp = (disp << 7);
                        num_scrolls++;
                        ns = st_scroll;
                    end
                end
            end
            st_wait:
            begin
                if (~scroll & div_clk) begin
                    if (num_waits < MAX_WAITS) begin
                        num_waits++;
                        ns = st_wait;
                    end
                    else if (num_waits == MAX_WAITS) begin
                        num_scrolls = 4'b0;
                        disp = text_hold;
                        ns = st_scroll;
                    end
                end
            end
        endcase
        scroll = div_clk;
    end
    
//    always_ff @(posedge clk) begin
//        temp = text[27:21];
//        $display("%b", text);
//        text = (text << 7) | temp;
//    end
    
    SevenSegmentDecoder # (100) ssd(.disp(disp[97:70]), .clk(clk), .seg(seg), .an(an));
    
endmodule
