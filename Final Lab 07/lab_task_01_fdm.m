%ID: 19-41468-3
A = 1;
B = 9;
C = 4;
D = 1;
E = 4;
F = 6;
G = 8;
H = 3;

fs = 4000;
t = 0:1/fs:(1-(1/fs));

am1 = (F+2); %8
am2 = (F+5); %11
am3 = (F+8); %14
am4 = (F+11); %17

fm1 = (G+1); %9
fm2 = (G+2); %10
fm3 = (G+3); %11
fm4 = (G+4); %12

fc1 = 75;
fc2 = 125;
fc3 = 175;
fc4 = 225;

mt1 = am1*cos(2*pi*fm1*t);
mt2 = am2*cos(2*pi*fm2*t);
mt3 = am3*cos(2*pi*fm3*t);
mt4 = am4*cos(2*pi*fm4*t);

c1 = cos(2*pi*fc1*t);
c2 = cos(2*pi*fc2*t);
c3 = cos(2*pi*fc3*t);
c4 = cos(2*pi*fc4*t);

x = mt1.*c1 + mt2.*c2 + mt3.*c3 + mt4.*c4;

MT1 = abs(fftshift(fft(mt1)))/(fs/2);
X = abs(fftshift(fft(x)))/(fs/2);
f = fs/2*linspace(-1,1,fs);

figure
subplot(2,1,1);
plot(t,mt1);
subplot(2,1,2);
stem(f,MT1);

figure
subplot(2,1,1);
plot(t,x);
subplot(2,1,2);
stem(f,X);

[num1, den1] = butter(5, [(fc1-fm1-6)/(fs/2) , (fc1+fm1+6)/(fs/2)]);
bpf1 = filter(num1,den1,x);
[num2, den2] = butter(5, [(fc2-fm2-6)/(fs/2) , (fc2+fm2+6)/(fs/2)]);
bpf2 = filter(num2,den2,x);
[num3, den3] = butter(5, [(fc3-fm3-6)/(fs/2) , (fc3+fm3+6)/(fs/2)]);
bpf3 = filter(num3,den3,x);
[num4, den4] = butter(5, [(fc4-fm4-6)/(fs/2) , (fc4+fm4+6)/(fs/2)]);
bpf4 = filter(num4,den4,x);

z1 = 2*bpf1.*c1;
z2 = 2*bpf2.*c2;
z3 = 2*bpf3.*c3;
z4 = 2*bpf4.*c4;

[num5, den5] = butter(5, (fm1+3)/(fs/2));
rec1 = filter(num5,den5,z1);
[num6, den6] = butter(5, (fm2+3)/(fs/2));
rec2 = filter(num6,den6,z2);
[num7, den7] = butter(5, (fm3+3)/(fs/2));
rec3 = filter(num7,den7,z3);
[num8, den8] = butter(5, (fm4+3)/(fs/2));
rec4 = filter(num8,den8,z4);

R1 = abs(fftshift(fft(rec1)))/(fs/2);

figure
subplot(2,1,1);
plot(t,rec1);
subplot(2,1,2);
stem(f,R1);