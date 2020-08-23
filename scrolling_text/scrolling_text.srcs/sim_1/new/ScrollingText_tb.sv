`timescale 1ns / 1ps

module ScrollingText_tb();

    logic clk, reset = 0, start = 0, write = 0;
    logic [7:0] seg;
    logic [3:0] an;
    logic [6:0] code;
    
    ScrollingText UUT(.code(code), .clk(clk), .seg(seg), .an(an),
                      .reset(reset), .start(start), .write(write));
    
    initial clk = 0;
    always clk = #5 ~clk;
    
    initial begin
        code = 7'b0000010;
        #13;
        write = 1;
        #10;
        write = 0;
        #3;
        code = 7'b0001001;
        #25;
        write = 1;
        #17;
        write = 0;
        #17;
        start = 1;
        #46;
//        code = 6'b101111;
//        #27;
//        code = 6'b000110;
//        #36;
//        code = 6'b101010;
//        #10;
    end

endmodule
