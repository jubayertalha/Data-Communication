%ID: 19-41468-3
A = 1;
B = 9;
C = 4;
D = 1;
E = 4;
F = 6;
G = 8;
H = 3;

fs = 4000; %sampling frequency
t = 0:1/fs:(1-(1/fs)); %time axis

am1 = (F+2); %amplitude for first message = (F+2) = (6+2) = 8
am2 = (F+5); %amplitude for second message = (F+5) = (6+5) = 11
am3 = (F+8); %amplitude for third message = (F+8) = (6+8) = 14
am4 = (F+11); %amplitude for fourth message = (F+11) = (6+11) = 17

fm1 = (G+1); %frequency for first message = (G+1) = (8+1) = 9
fm2 = (G+2); %frequency for second message = (G+2) = (8+2) = 10
fm3 = (G+3); %frequency for third message = (G+3) = (8+3) = 11
fm4 = (G+4); %frequency for fourth message = (G+4) = (8+4) = 12

fc1 = 75; %frequency for first carrier signal
fc2 = 125; %frequency for second carrier signal
fc3 = 175; %frequency for third carrier signal
fc4 = 225; %frequency for fourth carrier signal

mt1 = am1*cos(2*pi*fm1*t); %first message signal
mt2 = am2*cos(2*pi*fm2*t); %second message signal
mt3 = am3*cos(2*pi*fm3*t); %third message signal
mt4 = am4*cos(2*pi*fm4*t); %fourth message signal

c1 = cos(2*pi*fc1*t); %first carrier signal
c2 = cos(2*pi*fc2*t); %second carrier signal
c3 = cos(2*pi*fc3*t); %third carrier signal
c4 = cos(2*pi*fc4*t); %fourth carrier signal

x = mt1.*c1 + mt2.*c2 + mt3.*c3 + mt4.*c4; %compositet signal between 50 to 250 Hz frequency range

%Passing the Composite Signal Through Bandpass Filter
[num1, den1] = butter(5, [(fc1-fm1-12)/(fs/2) , (fc1+fm1+12)/(fs/2)]); %Butterworth Filter Window Determining for Bandpass Filter
bpf1 = filter(num1,den1,x); %Filtering is done here
[num2, den2] = butter(5, [(fc2-fm2-12)/(fs/2) , (fc2+fm2+12)/(fs/2)]);
bpf2 = filter(num2,den2,x);
[num3, den3] = butter(5, [(fc3-fm3-12)/(fs/2) , (fc3+fm3+12)/(fs/2)]);
bpf3 = filter(num3,den3,x);
[num4, den4] = butter(5, [(fc4-fm4-12)/(fs/2) , (fc4+fm4+12)/(fs/2)]);
bpf4 = filter(num4,den4,x);

%Mixing
z1 = 2*bpf1.*c1;
z2 = 2*bpf2.*c2;
z3 = 2*bpf3.*c3;
z4 = 2*bpf4.*c4;

%Passing the Mixed Signals Through Lowpass Filter
[num5, den5] = butter(5, (fm1+6)/(fs/2)); %Low pass filter is made here
rec1 = filter(num5,den5,z1); %Filtering is done here
[num6, den6] = butter(5, (fm2+6)/(fs/2));
rec2 = filter(num6,den6,z2);
[num7, den7] = butter(5, (fm3+6)/(fs/2));
rec3 = filter(num7,den7,z3);
[num8, den8] = butter(5, (fm4+6)/(fs/2));
rec4 = filter(num8,den8,z4);

MT1 = abs(fftshift(fft(mt1)))/(fs/2); %Fourier Transformation of m1
MT2 = abs(fftshift(fft(mt2)))/(fs/2); %Fourier Transformation of m2
MT3 = abs(fftshift(fft(mt3)))/(fs/2); %Fourier Transformation of m3
MT4 = abs(fftshift(fft(mt4)))/(fs/2); %Fourier Transformation of m4

R1 = abs(fftshift(fft(rec1)))/(fs/2); %Fourier Transformation of rec1
R2 = abs(fftshift(fft(rec2)))/(fs/2); %Fourier Transformation of rec2
R3 = abs(fftshift(fft(rec3)))/(fs/2); %Fourier Transformation of rec3
R4 = abs(fftshift(fft(rec4)))/(fs/2); %Fourier Transformation of rec4

X = abs(fftshift(fft(x)))/(fs/2); %Fourier Transformation of x
f = fs/2*linspace(-1,1,fs);

figure %Plotting the Message and Received Signal 1 in Time-Domain and Frequency-Domain
subplot(4,1,1)
plot(t,mt1);
xlabel('Time (s)');
ylabel('Amplitude');
title('Message Signal 1 in Time Domain');
axis([0 0.5 -20 20]);
subplot(4,1,2)
plot(t,rec1);
xlabel('Time (s)');
ylabel('Amplitude');
title('Received Message Signal 1 in Time Domain');
axis([0 0.5 -20 20]);
subplot(4,1,3)
stem(f,MT1);
xlabel('Frequency');
ylabel('Amplitude');
title('Message Signal 1 in Frequency Domain');
axis([-15 15 0 20]);
subplot(4,1,4)
stem(f,R1);
xlabel('Frequency');
ylabel('Amplitude');
title('Received Message Signal 1 in Frequency Domain');
axis([-15 15 0 20]);

figure %Plotting the Message and Received Signal 2 in Time-Domain and Frequency-Domain
subplot(4,1,1)
plot(t,mt2);
xlabel('Time (s)');
ylabel('Amplitude');
title('Message Signal 2 in Time Domain');
axis([0 0.5 -20 20]);
subplot(4,1,2)
plot(t,rec2);
xlabel('Time (s)');
ylabel('Amplitude');
title('Received Message Signal 2 in Time Domain');
axis([0 0.5 -20 20]);
subplot(4,1,3)
stem(f,MT2);
xlabel('Frequency');
ylabel('Amplitude');
title('Message Signal 2 in Frequency Domain');
axis([-15 15 0 20]);
subplot(4,1,4)
stem(f,R2);
xlabel('Frequency');
ylabel('Amplitude');
title('Received Message Signal 2 in Frequency Domain');
axis([-15 15 0 20]);

figure %Plotting the Message and Received Signal 3 in Time-Domain and Frequency-Domain
subplot(4,1,1)
plot(t,mt3);
xlabel('Time (s)');
ylabel('Amplitude');
title('Message Signal 3 in Time Domain');
axis([0 0.5 -20 20]);
subplot(4,1,2)
plot(t,rec3);
xlabel('Time (s)');
ylabel('Amplitude');
title('Received Message Signal 3 in Time Domain');
axis([0 0.5 -20 20]);
subplot(4,1,3)
stem(f,MT3);
xlabel('Frequency');
ylabel('Amplitude');
title('Message Signal 3 in Frequency Domain');
axis([-15 15 0 20]);
subplot(4,1,4)
stem(f,R3);
xlabel('Frequency');
ylabel('Amplitude');
title('Received Message Signal 3 in Frequency Domain');
axis([-15 15 0 20]);

figure %Plotting the Message and Received Signal 4 in Time-Domain and Frequency-Domain
subplot(4,1,1)
plot(t,mt4);
xlabel('Time (s)');
ylabel('Amplitude');
title('Message Signal 4 in Time Domain');
axis([0 0.5 -20 20]);
subplot(4,1,2)
plot(t,rec4);
xlabel('Time (s)');
ylabel('Amplitude');
title('Received Message Signal 4 in Time Domain');
axis([0 0.5 -20 20]);
subplot(4,1,3)
stem(f,MT4);
xlabel('Frequency');
ylabel('Amplitude');
title('Message Signal 4 in Frequency Domain');
axis([-15 15 0 20]);
subplot(4,1,4)
stem(f,R4);
xlabel('Frequency');
ylabel('Amplitude');
title('Received Message Signal 4 in Frequency Domain');
axis([-15 15 0 20]);
 
figure %Plotting the Composite Signal in Time-Domain and Frequency-Domain
subplot(2,1,1)
plot(t,x);
xlabel('Time (s)');
ylabel('Amplitude');
title('Composite Signal in Time Domain');
axis([0 0.5 -50 50]);
subplot(2,1,2)
stem(f,X);
xlabel('Frequency');
ylabel('Amplitude');
title('Composite Signal in Frequency Domain');
axis([-250 250 0 10]);