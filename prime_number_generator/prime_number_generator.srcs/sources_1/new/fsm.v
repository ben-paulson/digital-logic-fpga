`timescale 1ns / 1ps

/*
 State machine to control the prime number
 generator module.
*/
module fsm(
    input clk,
    input btn,
    input done_writing,
    input done_checking,
    input prime,
    output reg start,
    output reg addr_up,
    output reg num_up,
    output reg clr,
    output reg we,
    output reg disp_ram
    );
    
    // Next state and present state
    reg [1:0] ns, ps;
    // State representation variables
    parameter [1:0] st_display_ram=2'b00, st_start=2'b01, st_check=2'b10;
    
    // Switch to next state every clock cycle
    always @ (posedge clk)
        ps = ns;
        
    // Decoder
    always @ (*) begin // removed done_writing, btn, done_checking, prime, ps
        // Clear all outputs
        start = 0; we = 0; clr = 0;
        num_up = 0; addr_up = 0; disp_ram = 0;
        case (ps)
            st_display_ram:
            begin
                // Always count up to continually show primes
                addr_up = 1;
                disp_ram = 1;
                if (btn == 1) begin
                    clr = 1; // Clear both counters
                    ns = st_start;
                end
                else ns = st_display_ram;
            end
            
            st_start:
            begin // Unconditional move to next state
                start = 1;
                ns = st_check;
            end
            
            st_check:
            begin // Wait for prime number check module to finish checking
                // Found the last prime number
                if (done_checking == 1 && prime == 1 && done_writing == 1) begin
                    we = 1;
                    ns = st_display_ram;
                end
                // Found a prime, but still need more
                else if (done_checking == 1 && prime == 1) begin
                    we = 1;
                    num_up = 1;
                    addr_up = 1;
                    ns = st_start;
                end
                // Finished checking, not a prime
                else if (done_checking == 1 && prime == 0) begin
                    num_up = 1;
                    ns = st_start;
                end
                // Still checking
                else begin
                    ns = st_check;
                end
            end
            default: ns = st_display_ram;
        endcase
    end
    
endmodule
