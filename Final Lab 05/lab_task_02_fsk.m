%ID: 19-41468-3
%E = 4 = (ASCII) 52 = (BIN) 00110100
%F = 6 = (ASCII) 54 = (BIN) 00110110
%G = 8 = (ASCII) 56 = (BIN) 00111000

x = [0 0 1 1 0 1 0 0 0 0 1 1 0 1 1 0 0 0 1 1 1 0 0 0]; %input signal
fs = 1:0.5:4.5; %frequensies
nx = size(x,2); %number of bits in input signal

i=1; %first index of every three bits
j=0; %time index of a signal element

while i<nx-1 %until first index of last three bits
    t = j:0.001:j+2; %time of a signal element in duration of 2 seconds
    if x(i)==0 && x(i+1)==0 && x(i+2)==0 %when three bits are 000
        fsk = sin(2*pi*fs(1)*t); %changes the frequescies, amplitued 1, phase 0
    elseif x(i)==0 && x(i+1)==0 && x(i+2)==1 %when three bits are 001
        fsk = sin(2*pi*fs(2)*t);
    elseif x(i)==0 && x(i+1)==1 && x(i+2)==0 %when three bits are 010
        fsk = sin(2*pi*fs(3)*t);
    elseif x(i)==0 && x(i+1)==1 && x(i+2)==1 %when three bits are 011
        fsk = sin(2*pi*fs(4)*t);
    elseif x(i)==1 && x(i+1)==0 && x(i+2)==0 %when three bits are 100
        fsk = sin(2*pi*fs(5)*t);
    elseif x(i)==1 && x(i+1)==0 && x(i+2)==1 %when three bits are 101
        fsk = sin(2*pi*fs(6)*t);
    elseif x(i)==1 && x(i+1)==1 && x(i+2)==0 %when three bits are 110
        fsk = sin(2*pi*fs(7)*t);
    else %when three bits are 111
        fsk = sin(2*pi*fs(8)*t);
    end
    
    i=i+3; %index of next three bits
    j=j+2; %time index of next signal element

    plot(t,fsk);
    hold on;
    grid on;
    axis([0 16 -1 1]);
    title('Frequency Shift Key');
    xlabel('Time (s)');
    ylabel('Amplitude');
end