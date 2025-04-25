import matplotlib.pyplot as plt
import numpy as np

# Read the frequency.txt or other simulation output file
with open('frequency.txt', 'r') as file:
    frequency = int(file.read().strip())

# Generate some waveform data for the plot (for example, a sine wave based on the frequency)
time = np.linspace(0, 1, 1000)  # 1 second of data
amplitude = np.sin(2 * np.pi * frequency * time)  # Sine wave formula

# Plot the waveform
plt.plot(time, amplitude)
plt.title(f"Sine Wave with Frequency {frequency} Hz")
plt.xlabel('Time [s]')
plt.ylabel('Amplitude')
plt.grid(True)
plt.show()
