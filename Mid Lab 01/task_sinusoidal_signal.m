%ID: 19-41468-3
A = 1;
B = 9;
C = 4;
D = 1;
E = 4;
F = 6;
G = 8;
H = 3;

K1 = A+B;
K2 = G+H+2;
J1 = deg2rad(D+G+20);
J2 = deg2rad(30);

t = 0:0.001:0.25;
x1 = K1*cos(2*pi*(E+F+5)*t+J1);
x2 = K2*cos(2*pi*(C+D+5)*t+J2);

%solution of (a)
figure
plot(t,x1) %output in figure 1
figure
plot(t,x2) %output in figure 2

%solution of (b)
x3 = x1+x2;
figure
plot(t,x3) %output in figure 3

%solution of (c)
figure
subplot(3,1,1),plot(t,x1) %output in figure 4
subplot(3,1,2),plot(t,x2) %output in figure 4
subplot(3,1,3),plot(t,x3) %output in figure 4