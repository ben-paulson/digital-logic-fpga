`timescale 1ns / 1ps

module prime_number_generator_tb();

    reg btn, clk;
    wire [7:0] seg;
    wire [3:0] an;
    
    initial clk = 0;
    always clk = #5 ~clk;
    
    prime_number_generator UUT (
        .btn  (btn),
        .clk  (clk),
        .test (1'b1),
        .seg  (seg),
        .an   (an)
        );
        
    initial begin
        btn = 0;
        #52;
        btn = 1;
        #50;
        btn = 0;
    end

endmodule
