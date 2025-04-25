`timescale 1ns / 1ps

module sine_wave_generator( 
    input clock,               // clock @ 1 MHz
    input reset,               // reset signal
    output [9:0] phase,        // phase value (10 bits)
    output [9:0] data_sin      // output sine wave values
);    
    
    // Phase Accumulator instance
    phase_accumulator accumulator_inst (
        .clock(clock), 
        .reset(reset), 
        .phase(phase)
    );
    
    // Phase to Amplitude Converter instance
    phase_to_amplitude_converter converter_inst (
        .reset(reset), 
        .phase(phase), 
        .data_sin(data_sin)
    );
    
endmodule
