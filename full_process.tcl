# full_process.tcl - Simulation logic called from GUI

# Read frequency from file
set f [open "frequency.txt" r]
set frequency [gets $f]
close $f

# Print for debugging
puts ">> Frequency read: $frequency"

# Clean up old work library
file delete -force work
vlib work
vmap work work

# Compile Verilog source files
puts ">> Compiling Verilog files..."
vlog sine_wave_generator.v
vlog phase_accumulator.v
vlog phase_to_amplitude_converter.v
vlog testbench.v

# Run the simulation in batch mode
puts ">> Starting simulation..."
vsim -c work.testbench -do {
    run -all
    quit
}
