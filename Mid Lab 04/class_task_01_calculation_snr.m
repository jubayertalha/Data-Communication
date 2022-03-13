fs = 8000; % Sampling frequency
%Define signal
t = 0:1/fs:1-1/fs;
signal = 1.5*sin(2*pi*2*t)+0.9*cos(2*pi*10*t)+1.1*sin(2*pi*20*t) + 0.13*randn(size(t));
%snr
SNR = snr(signal)