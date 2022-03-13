%ID: 19-41468-3
A = 1;
B = 9;
C = 4;
D = 1;
E = 4;
F = 6;
G = 8;
H = 3;

A1 = (A+B+H); %A1 = 13
A2 = (B+C+H); %A2 = 16
s =(C+D+H)/30; %s = 0.2667

fs = 8000; % Sampling frequency
%Define signal
t = 0:1/fs:1-1/fs;
x = A1*sin(2*pi*((C+D+H)*100)*t) + A2*cos(2*pi*((D+E+H)*100)*t) + s*randn(size(t));
%snr
SNR = snr(x)