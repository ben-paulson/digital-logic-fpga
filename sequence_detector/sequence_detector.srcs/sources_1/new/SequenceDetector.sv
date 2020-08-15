`timescale 1ns / 1ps

/*
* Sequence detector using a finite state machine.
* Total of 5 states, with specific 5-bit binary codes
* required to move to the next state. Cannot move back
* states, but can be reset to state 0 through asynchronous
* reset input. 5-bit st_out represents the current state,
* and 3-bit blink will blink at half the frequency of clk
* if in the final state, which can only be exited by use of reset.
*/
module SequenceDetector(
    input [4:0] code,
    input reset,
    input clk,
    output reg [4:0] st_out,
    output reg [2:0] blink
    );
    
    // Divide the clock to make it visible on the board
    logic div_clk;
    ClockDivider #(10) divider(.clk(clk), .div_clk(div_clk));
    
    // next state & present state
    reg [2:0] ns, ps;
    // state values
    parameter [2:0] st_0=3'b000, st_1=3'b001, st_2=3'b010, 
                    st_3=3'b011, st_4=3'b100;
    
    always @ (posedge div_clk)
        // Blink LEDs if in st_4 (using div_clk to make it visible)
        if (ps == st_4) blink = ~blink;
        else blink = 3'b000;
    
    // Always check for reset and update state
    always @ (posedge reset, posedge clk)
        // Blink output can also be updated here instead,
        // but it is a fast blink
        if (reset == 1) ps = st_0;
        else ps = ns; // Assign the new state
        
    /* Update any time state changes. Also need to
    * include code in the sensitivity list so that
    * the block will actually run. It would not run otherwise
    * since ps would never have the opportunity to change.
    * The state will not be updated until the clock RET above.
    */
    always @ (code, ps) begin
        st_out = 5'b00000; // Always reset outputs
        case (ps)
            st_0:
            begin
                st_out = 5'b00001;
                // Go to next state if code input is correct
                if (code == 5'b10101) ns = st_1; 
                else ns = st_0; // Stay here otherwise
            end
            st_1:
            begin
                st_out = 5'b00010;
                // Go to next state if code input is correct
                if (code == 5'b11111) ns = st_2;
                else ns = st_1; // Stay here otherwise
            end
            st_2:
            begin
                st_out = 5'b00100;
                // Go to next state if code input is correct
                if (code == 5'b10001) ns = st_3; 
                else ns = st_2; // Stay here otherwise
            end
            st_3:
            begin
                st_out = 5'b01000;
                // Go to next state if code input is correct
                if (code == 5'b11110) ns = st_4;
                else ns = st_3; // Stay here otherwise
            end
            st_4:
            begin
                // Always stay in this state (until reset)
                st_out = 5'b10000;
                ns = st_4;
            end
            default: ns = st_0; // Self correcting in case of unused state
        endcase
    end
    
endmodule
