function [] = ModulatorBPSK(InputBits,No_of_sent_bits)
Tb=1; %bit duration
N=40;
Rb=1/Tb; % Bit Rate (I only have added it for modularity)
Ws=(N*2*pi)/Tb;
%now we need to generate Polar NRZ signal 
% Another function will Be used to generate The PolarNRZ Signal
[t,x] = PolarNRZ(InputBits,Rb,No_of_sent_bits,Ws);

OscillatorFunction

plot(t,x);
figure(1);

end

