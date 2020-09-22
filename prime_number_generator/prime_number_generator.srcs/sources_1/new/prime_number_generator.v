`timescale 1ns / 1ps

/*
 This module finds and stores the first 32 prime
 numbers in RAM at the press of a button. The
 primes will be displayed continually until
 the button is pressed again.
*/
module prime_number_generator(
    input btn,
    input clk,
    input test,
    output [7:0] seg,
    output [3:0] an
    );
    
    // Counter module bit sizes (also RAM sizes)
    parameter num_width = 10;
    parameter addr_width = 5;
    
    // Number counter wires
    wire clr; // Also used for address counter
    wire num_up;
    wire [num_width-1:0] num_count;
    
    // Address counter wires
    wire addr_up;
    wire [addr_width-1:0] addr_count;
    wire addr_rco;
    
    // Prime check module wires
    wire start;
    wire done;
    wire prime;
    
    // Ram wires
    wire we;
    wire [num_width-1:0] ram_out;
    
    // sseg display wire
    wire [13:0] disp;
    
    // Divided clock, not for testing use
    wire div_clk;
    // The actual clock that will be used
    wire s_clk;
    
    // Output of the state machine, to determine correct bits to display on sseg
    wire disp_ram;
    
    // Divided clock module
    clk_2n_div_test #(.n(23)) clock_divider (
        .clockin (clk), 
        .fclk_only (test),          
        .clockout (div_clk)   
        );
        
    // Choose which clock to use based on testing input
    mux_2t1_nb  #(.n(1)) clk_mux  (
        .SEL   (test), 
        .D0    (div_clk),
        .D1    (clk),
        .D_OUT (s_clk) 
        );
    
    // Number counter
    cntr_up_clr_nb #(.n(num_width)) num_cntr (
        .clk   (s_clk), 
        .clr   (clr), 
        .up    (num_up), 
        .ld    (0), 
        .D     (0), 
        .count (num_count), 
        .rco   ()
        );
    
    // Address counter
    cntr_up_clr_nb #(.n(addr_width)) addr_cntr (
        .clk   (s_clk), 
        .clr   (clr), 
        .up    (addr_up), 
        .ld    (0), 
        .D     (0), 
        .count (addr_count), 
        .rco   (addr_rco)
        );
     
    // Prime check module   
    prime_num_check  prime_check (
        .start (start),
        .test  (test),
        .clk   (clk), // Always gets the fast clock
        .num   (num_count),
        .DONE  (done),
        .PRIME (prime)     
        );
    
    // Ram module. 32x10 for this module
    ram_single_port #(.n(addr_width),.m(num_width)) ram (
        .data_in  (num_count),  // m spec
        .addr     (addr_count), // n spec 
        .we       (we),
        .clk      (s_clk),
        .data_out (ram_out)
        );
        
    mux_2t1_nb  #(.n(14)) display_mux  (
        .SEL   (disp_ram), 
        .D0    ({4'b0, num_count}), // Make it the correct 14-bit width
        .D1    ({4'b0, ram_out}), // Make it the correct 14-bit width
        .D_OUT (disp) 
        );
    
    // Seven segment module    
    univ_sseg sseg (
        .cnt1    (disp), 
        .cnt2    (7'b0), // Constants are unused inputs
        .valid   (1'b1), 
        .dp_en   (1'b0), 
        .dp_sel  (2'b00), 
        .mod_sel (2'b10), 
        .sign    (1'b0), 
        .clk     (clk), 
        .ssegs   (seg), 
        .disp_en (an)
        ); 
    
    // State machine to control the circuit        
    fsm prime_generator (
        .clk           (s_clk),
        .btn           (btn),
        .done_writing  (addr_rco),
        .done_checking (done),
        .prime         (prime),
        .start         (start),
        .we            (we),
        .clr           (clr),
        .addr_up       (addr_up),
        .num_up        (num_up),
        .disp_ram      (disp_ram)
        );
            
endmodule
