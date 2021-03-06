%ID: 19-41468-3
A = 1;
B = 9;
C = 4;
D = 1;
E = 4;
F = 6;
G = 8;
H = 3;

a1 = A+C+1; %a1 = 6
a2 = A+D+2; %a2 = 4
a3 = A+E+1; %a3 = 6
f1 = A+E+1; %f1 = 6
f2 = A+D+2; %f2 = 4
f3 = A+C+1; %f3 = 6

fs = 1000;
t = 0:1/fs:1;

x1 = a1*cos(2*pi*f1*t);
x2 = a2*sin(2*pi*f2*t);
x3 = a3*cos(2*pi*f3*t);

signal_x = x1+x2+x3;

p = linspace(-14,14,7);
c = linspace(-15.53,15.53,8);
[i,q] = quantiz(signal_x,p,c);
plot(t,signal_x,'x',t,q,'.')
axis([0 0.5 -16 16])
title('Quantization of signal x');
legend('Original signal','Quantized signal');
xlabel('Time (s)');
ylabel('Amplitude');