# Beat-detection
## Matlab program to detect beats
### Main approach
1. Take the envelope from the input signal
2. Differentiate this signal to accentuate the differences in sound
3. Take the fft and search for which frequency has the highest amplitude
4. Calculate the bpm from this frequency
