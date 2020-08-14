`timescale 1ns / 1ps

module SequenceDetector_tb();

    logic [4:0] code, st_out;
    logic [2:0] blink;
    logic reset, clk;
    
    SequenceDetector UUT(.code(code), .reset(reset), .clk(clk),
                         .blink(blink), .st_out(st_out));
    // Start the clock                     
    initial clk = 0;
    always clk = #5 ~clk;
    
    initial begin
        reset = 0; // Give it an initial value
        code = 5'b00000;
        #17;
        code = 5'b00100;
        #11;
        code = 5'b10101; // Should transition here
        #23;
        code = 5'b11111; // Transition
        #7;
        code = 5'b00001;
        #6;
        reset = 1; // Go to zero
        #15;
        reset = 0;
        code = 5'b10101; // Transition
        #22;
        code = 5'b11111; // Transition
        #17;
        code = 5'b10001; // Transition
        #17;
        code = 5'b11110; // Go to state 4, start blinking once in st_4
        #30;
        code = 5'b00000;
        #11;
        code = 5'b10101;
        #12;
        reset = 1;
        #16;
    end

endmodule
