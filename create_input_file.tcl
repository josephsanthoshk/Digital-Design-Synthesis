# Create the input file for frequency
set filename "frequency.txt"
set file [open $filename "r"]
set freq [read $file]
close $file
puts "Frequency read from file: $freq"
