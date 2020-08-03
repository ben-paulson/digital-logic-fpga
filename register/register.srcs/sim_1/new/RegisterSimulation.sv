`timescale 1ns / 1ps

module RegisterSimulation();

    logic [7:0] seg;
    logic [3:0] data, an;
    logic clk, set, reset;
    
    Register UUT(.clk(clk), .data(data), .set(set),
                 .reset(reset), .seg(seg), .an(an));
    
    // Start the clock, 5ns between switching states             
    initial clk = 0;
    always clk = #5 ~clk;
    
    // Go through a few combinations             
    initial begin
        // Use delay times that don't go along with the clock
        // So it's easy to see that changes only happen
        // on the clock's rising edge
        data = 4'b0111;
        set = 0; reset = 1;
        #7;
        reset = 0;
        #2;
        set = 1;
        #37;
        data = 4'b1010;
        #17;
        set = 0;
    end

endmodule
