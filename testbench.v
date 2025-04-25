`timescale 1ns / 1ps

module testbench();
    reg clock, reset;
    wire [9:0] phase;     
    wire [9:0] data_sin;

    // Instantiate the sine_wave_generator
    sine_wave_generator UUT (
        .clock(clock), 
        .reset(reset), 
        .phase(phase), 
        .data_sin(data_sin)
    );

    integer log_file; // Variable to hold the file handle for logging

    initial begin
        clock = 1'b0;
        reset = 1'b1;
        
        // Open the file for writing data
        log_file = $fopen("simulation_data.txt", "w");
        
        // Write headers or any initial info to the file
        $fdisplay(log_file, "Time, Phase, Data_sin");
        
        #1000;  // Wait for reset to finish
        reset = 1'b0;  // Deassert reset and start the simulation
    end
    
    always #500 clock = ~clock;  // Toggle clock every 500ns
    
    always @(posedge clock) begin
        // Write time, phase, and data_sin to the file
        $fdisplay(log_file, "%t, %d, %d", $time, phase, data_sin);
    end
    
    // End the simulation after a certain period of time
    initial begin
        #10000;  // End simulation after 10000 time units (adjust as needed)
        $fclose(log_file);  // Close the file after simulation
        $finish;
    end
endmodule
