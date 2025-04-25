`timescale 1ns / 1ps

module phase_accumulator (
    input clock,               // clock
    input reset,               // reset
    output reg [9:0] phase     // phase value (10 bits)
);
    
    // Phase increment value (for generating the sine wave)
    parameter PHASE_INCREMENT = 10'd64;

    always @(posedge clock or posedge reset) begin
        if (reset) 
            phase <= 10'b0;
        else
            phase <= phase + PHASE_INCREMENT;
    end

endmodule
