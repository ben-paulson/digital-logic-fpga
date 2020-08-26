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
        // Do the whole cycle 10 times, to test reset, scroll, and wait
        for (int i = 0; i < 10; i++) begin
            /*
            * Write 'hello' 3 times to test overflow of characters
            * Since the max is 10, the first hello will be cut off
            */
            for (int j = 0; j < 3; j++) begin
                code = 7'b1001000; // H
                #5;
                write = 1;
                #20;
                write = 0;
                #2;
                code = 7'b1000101; // E
                #20;
                write = 1;
                #20;
                write = 0;
                #20;
                code = 7'b1001100; // L
                #20;
                write = 1;
                #20;
                write = 0;
                code = 7'b1001100; // L
                #20;
                write = 1;
                #20;
                code = 7'b1001111; // O
                write = 0;
                #20;
                write = 1;
                #20;
                write = 0;
                #20;
            end
            start = 1;
            #200;
            reset = 1;
            start = 0;
            #20;
            reset = 0;
        end
    end

endmodule
