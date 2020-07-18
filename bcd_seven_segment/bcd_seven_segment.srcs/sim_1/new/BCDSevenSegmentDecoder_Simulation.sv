`timescale 1ns / 1ps

module BCDSevenSegmentDecoder_Simulation();

    logic [3:0] sBcd, sEnable, sAn;
    logic [7:0] sSeg;
    
    BCDSevenSegmentDecoder UUT(
        .bcd(sBcd), .enable(sEnable),
        .seg(sSeg), .an(sAn));
        
    initial begin
        /*
        * Loop through all possible values and combinations
        * for bcd and enable inputs. Both are 4-bits so 0-15.
        */
        for (byte i = 0; i < 16; i++) begin
            for (byte j = 0; j < 16; j++) begin
                sBcd = i;
                sEnable = j;
                #10;
            end
        end
    end

endmodule
