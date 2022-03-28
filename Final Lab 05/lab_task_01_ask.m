%ID: 19-41468-3
%E = 4 = (ASCII) 52 = (BIN) 00110100
%F = 6 = (ASCII) 54 = (BIN) 00110110
%G = 8 = (ASCII) 56 = (BIN) 00111000

x = [0 0 1 1 0 1 0 0 0 0 1 1 0 1 1 0 0 0 1 1 1 0 0 0]; %input signal
am = 1:0.5:4.5; %amplitudes
nx = size(x,2); %number of bits in input signal

i=1; %first index of every three bits
j=0; %time index of a signal element

while i<nx-1 %until first index of last three bits
    t = j:0.001:j+2; %time of a signal element in duration of 2 seconds
    if x(i)==0 && x(i+1)==0 && x(i+2)==0 %when three bits are 000
        ask = as(1)*sin(2*pi*t); %changes the amplitudes, phase 0, frequency 1
    elseif x(i)==0 && x(i+1)==0 && x(i+2)==1 %when three bits are 001
        ask = as(2)*sin(2*pi*t);
    elseif x(i)==0 && x(i+1)==1 && x(i+2)==0 %when three bits are 010
        ask = as(3)*sin(2*pi*t);
    elseif x(i)==0 && x(i+1)==1 && x(i+2)==1 %when three bits are 011
        ask = as(4)*sin(2*pi*t);
    elseif x(i)==1 && x(i+1)==0 && x(i+2)==0 %when three bits are 100
        ask = as(5)*sin(2*pi*t);
    elseif x(i)==1 && x(i+1)==0 && x(i+2)==1 %when three bits are 101
        ask = as(6)*sin(2*pi*t);
    elseif x(i)==1 && x(i+1)==1 && x(i+2)==0 %when three bits are 110
        ask = as(7)*sin(2*pi*t);
    else %when three bits are 111
        ask = as(8)*sin(2*pi*t);
    end
    
    i=i+3; %index of next three bits
    j=j+2; %time index of next signal element
    
    plot(t,ask);
    hold on;
    grid on;
    axis([0 16 -4.5 4.5]);
    title('Amplitude Shift Key');
    xlabel('Time (s)');
    ylabel('Amplitude');
end