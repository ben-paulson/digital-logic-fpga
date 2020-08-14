`timescale 1ns / 1ps

module SequenceDetector(
    input [4:0] code,
    input reset,
    input clk,
    output reg [4:0] st_out,
    output reg [2:0] blink
    );
    
    // next state & present state
    reg [2:0] ns, ps;
    // state values
    parameter [2:0] st_0=3'b000, st_1=3'b001, st_2=3'b010, 
                    st_3=3'b011, st_4=3'b100, st_5=3'b101;
                    
    // Always check for reset and update state
    always @ (posedge reset, posedge clk)
        if (reset == 1) ps <= st_0;
        else begin
            ps <= ns;
            if (ps == st_4) blink <= ~blink;
        end
        
    always @ (code) begin
        st_out = 5'b00000; blink = 3'b000;
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
                if (code == 5'b11111) ns = st_2;
                else ns = st_1;
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
                if (code == 5'b11110) ns = st_4;
                else ns = st_3;
            end
            st_4:
            begin
                st_out = 5'b10000;
                ns = st_4;
            end
            default: ns = st_0; // Self correcting in case of unused state
        endcase
    end
    
endmodule
