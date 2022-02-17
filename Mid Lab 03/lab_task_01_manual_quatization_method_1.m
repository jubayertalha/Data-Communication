%ID: 19-41468-3
A = 1;
B = 9;
C = 4;
D = 1;
E = 4;
F = 6;
G = 8;
H = 3;

a1 = H+5; %a1 = 8
a2 = H+7; %a2 = 10
f1 = (D+E+5)*10; %f1 = 100
f2 = (E+F+10)*10; %f2 = 200

fs = 10000;
t = 0:1/fs:1;

x = (a1*cos(2*pi*f1*t)) + (a2*sin(2*pi*f2*t));

L = 2^H + 2; %L = 10
delta=(max(x)-min(x))/(L-1);
xq = min(x)+(round((x-min(x))/delta)).*delta;

plot(t,x,'r-.', 'linewidth',1.5);
hold on;
plot(t,xq,'k-.', 'linewidth',1.5);
axis([0 0.02 -20 20]);

title('Manual Quantization of Signal Using Method 1');
legend('Original signal','Quantized signal');
xlabel('Time (s)');
ylabel('Amplitude');