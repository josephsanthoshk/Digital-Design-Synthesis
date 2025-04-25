# sine_wave_gui_flow.tcl - Enhanced GUI Mode for Sine Frequency Input

package require Tk

# Hide the default root window
wm withdraw .

# Create GUI window
set win .win
toplevel $win
wm title $win "Sine Frequency Input"
wm resizable $win 0 0

# Styling: Set font and colors
set font "TkDefaultFont 10"
option add *Label.Font $font
option add *Entry.Font $font
option add *Button.Font $font

# Frame for layout
frame $win.frame -padx 20 -pady 20
pack $win.frame -fill both -expand true

# Label
label $win.frame.l -text "Enter Frequency (0–1023):"
pack $win.frame.l -anchor w -pady {0 5}

# Entry field
entry $win.frame.e -width 30
pack $win.frame.e -fill x -pady {0 10}

# Run Simulation button
button $win.frame.b -text "Run Simulation" -command {
    set frequency [string trim [$win.frame.e get]]

    # Validate integer
    if {![string is integer -strict $frequency]} {
        tk_messageBox -icon warning -type ok -title "Invalid Input" \
            -message "Please enter a valid integer"
        return
    }

    set frequency [expr {$frequency}]
    if { $frequency < 0 || $frequency > 1023 } {
        tk_messageBox -icon warning -type ok -title "Out of Range" \
            -message "Frequency must be between 0 and 1023"
        return
    }

    # Write frequency to file
    set f [open "frequency.txt" "w"]
    puts $f $frequency
    close $f

    # Run ModelSim in batch mode
    if {[catch {exec vsim -c -do full_process.tcl} result]} {
        tk_messageBox -icon error -type ok -title "Simulation Error" \
            -message "Simulation failed:\n$result"
        return
    }

    # Plot waveform using Python
    if {[catch {exec python plot_waveform.py} result]} {
        tk_messageBox -icon error -type ok -title "Plotting Error" \
            -message "Plotting failed:\n$result"
        return
    }
}
pack $win.frame.b -pady 10
