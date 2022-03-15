%ID: 19-41468-3
A = 1;
B = 9;
C = 4;
D = 1;
E = 4;
F = 6;
G = 8;
H = 3;

a1 = G+2; %a1 = 8+2 = 10
a2 = G+1; %a2 = 8+1 = 09
f1 = G+4; %f1 = 8+4 = 12
f2 = G+6; %f2 = 8+6 = 14

fs = 8000;
t = 0:1/fs:1;

sig_ct = a1*sin(2*pi*f1*t) + a2*cos(2*pi*f2*t);

level = 4;
Am = (max(sig_ct)-min(sig_ct))/2;
Nsamples = length(sig_ct);
quantised_out = zeros(1,Nsamples);
del = (2*Am)/level;
Llow = -Am+del/2;
Lhigh = Am-del/2;

for i=Llow:del:Lhigh
    for j=1:Nsamples
        if(((i-del/2)<=sig_ct(j))&&(sig_ct(j)<=(i+del/2)))
            quantised_out(j)=i;
        end
    end
end

plot(t,sig_ct,'*',t,quantised_out,'x');
axis([0 0.5 -20 20]);
title('Quantization Using Manual Method');
legend('Original signal','Quantized signal');
xlabel('Time (s)');
ylabel('Amplitude');