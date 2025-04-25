`timescale 1ns / 1ps

module phase_to_amplitude_converter(
    input reset,             // Reset signal
    input [9:0] phase,      // 10-bit phase input (from the phase accumulator)
    output [9:0] data_sin   // 10-bit sine wave output
);

    // 256-point sine LUT (initialized with the sine wave values)
    reg [9:0] sine_lut [0:255];

    // Initialize the LUT with sine values from a hex file
    initial begin
        $readmemh("sine_lut.hex", sine_lut);  // Load the LUT values from the hex file
    end
    
    // Output the sine wave value based on the current phase
    assign data_sin = sine_lut[phase[9:2]]; // Use the 8 MSBs of the 10-bit phase to index into the LUT

endmodule
