%ID: 19-41468-3
%E = 4 = (ASCII) 52 = (BIN) 00110100
%F = 6 = (ASCII) 54 = (BIN) 00110110
%G = 8 = (ASCII) 56 = (BIN) 00111000

x = [0 0 1 1 0 1 0 0 0 0 1 1 0 1 1 0 0 0 1 1 1 0 0 0]; %input signal
ps = 0:pi/4:7*(pi/4); %phases
nx = size(x,2); %number of bits in input signal

i=1; %first index of every three bits
j=0; %time index of a signal element

while i<nx-1 %until first index of last three bits
    t = j:0.001:j+2; %time of a signal element in duration of 2 seconds
    if x(i)==0 && x(i+1)==0 && x(i+2)==0 %when three bits are 000
        psk = sin(2*pi*t+ps(1)); %changes the phases, amplitued 1, frequency 1
    elseif x(i)==0 && x(i+1)==0 && x(i+2)==1 %when three bits are 001
        psk = sin(2*pi*t+ps(2));
    elseif x(i)==0 && x(i+1)==1 && x(i+2)==0 %when three bits are 010
        psk = sin(2*pi*t+ps(3));
    elseif x(i)==0 && x(i+1)==1 && x(i+2)==1 %when three bits are 011
        psk = sin(2*pi*t+ps(4));
    elseif x(i)==1 && x(i+1)==0 && x(i+2)==0 %when three bits are 100
        psk = sin(2*pi*t+ps(5));
    elseif x(i)==1 && x(i+1)==0 && x(i+2)==1 %when three bits are 101
        psk = sin(2*pi*t+ps(6));
    elseif x(i)==1 && x(i+1)==1 && x(i+2)==0 %when three bits are 110
        psk = sin(2*pi*t+ps(7));
    else %when three bits are 111
        psk = sin(2*pi*t+ps(8));
    end
    
    i=i+3; %index of next three bits
    j=j+2; %time index of next signal element
    
    plot(t,psk);
    hold on;
    grid on;
    axis([0 16 -1 1]);
    title('Phase Shift Key');
    xlabel('Time (s)');
    ylabel('Amplitude');
end