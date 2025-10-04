README: Frequency and Pole-Zero Analysis of Moving Average Filters
==================================================================

Purpose
-------
This MATLAB script analyzes two Finite Impulse Response (FIR) filters:
- A 5-point moving average filter
- A 9-point moving average filter

It computes their frequency responses, normalizes the coefficients, and visualizes their pole-zero structures. This helps understand the smoothing behavior and spectral characteristics of simple averaging filters.

Filter Definitions
------------------
The filters are defined by their numerator coefficients:

    b1 = [1 1 1 1 1];       % 5-point MA
    b2 = [1 1 1 1 1 1 1 1 1]; % 9-point MA
    a1 = 1;                 % Denominator (FIR filters)
    a2 = 1;

Normalization ensures unity gain at DC:

    b1n = b1 / sum(b1);
    b2n = b2 / sum(b2);

Frequency Response
------------------
The script uses MATLAB’s freqz to compute the frequency response:

    [h1, w1] = freqz(b1n, a1, 1024);
    [h2, w2] = freqz(b2n, a2, 1024);

It then plots the magnitude response to show how each filter attenuates different frequencies.

Zero-Pole Analysis
------------------
Using tf2zpk, the script converts the filters to zero-pole-gain form:

    [z1, p1, k1] = tf2zpk(b1n, a1);
    [z2, p2, k2] = tf2zpk(b2n, a2);

Then it visualizes the zeros and poles using zplane, which helps interpret the filter’s behavior in the z-domain.

Output
------
The script generates two figures:
1. Magnitude Response Plots for both filters
2. Pole-Zero Diagrams showing the location of zeros (and poles, which are at the origin for FIR filters)

Interpretation
--------------
- The 5-point filter has fewer zeros, resulting in a gentler roll-off.
- The 9-point filter has more zeros, offering stronger attenuation of high frequencies.
- Both filters are FIR and have all poles at the origin.

Requirements
------------
- MATLAB (any recent version)
- No additional toolboxes required
