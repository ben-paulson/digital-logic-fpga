`timescale 1ns / 1ps

module ValidityCheck(
    input sign_a,
    input sign_b,
    input sign_result,
    output valid
    );
    
    /* Output is not valid if input signs are the 
    * same while the sum sign is different
    */
    assign valid = ~((~sign_a & ~sign_b & sign_result) |
                   (sign_a & sign_b & ~sign_result));
    
endmodule