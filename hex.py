import math

with open("sine_lut.hex", "w") as f:
    for i in range(256):
        angle = 2 * math.pi * i / 256
        value = int((math.sin(angle) + 1) * 511.5)  # Scale to 10-bit (0–1023)
        f.write(f"{value:03X}\n")
