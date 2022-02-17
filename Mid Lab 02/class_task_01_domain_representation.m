%ID: 19-41468-3
A = 1;
B = 9;
C = 4;
D = 1;
E = 4;
F = 6;
G = 8;
H = 3;

a1 = B+G+H; %a1 = 20
a2 = C+E+H; %a2 = 11
f1 = G+H+2; %f1 = 13
f2 = E+F+H; %f2 = 13

fs = 1000;
t = 0:1/fs:1;

signal_x = (a1*sin(2*pi*f1*t)) + (a2*cos(2*pi*f2*t));

subplot(2,1,1)
plot(t,signal_x)
axis([0 1 -30 30])
title('Time-Domain Representation of signal x')
xlabel('Time (s)')
ylabel('Amplitude')

fx = abs(fftshift(fft(signal_x)))/(length(signal_x)/2);
freq = linspace(-fs/2, fs/2, length(signal_x));
subplot(2,1,2)
bar(freq, fx,'linewidth',3)
axis([-20 20 0 30])
title('Frequency-Domain Representation of signal x')
xlabel('Frequency (Hz)')
ylabel('Amplitude')