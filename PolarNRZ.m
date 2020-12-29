function [t,x] = PolarNRZ(InputBits,Tb,No_of_sent_bits)

T = No_of_sent_bits*Tb;
N=40;
Ws=(N*2*pi)/Tb;
n =40;
t = 0:(2*pi)/Ws:T;

x = zeros(1,length(t)); % output signal

for i = 0:length(InputBits)-1
  if InputBits(i+1) == 1
    x(i*n+1:(i+1)*n) = 1;
  else
    x(i*n+1:(i+1)*n) = -1;
  end
end
% figure(1);
%  plot(t,x);
% title(['Polar NRZ line Code ',num2str(No_of_sent_bits),' bits']);
% xlabel('time(sec)');
% ylabel('Polar NRZ signal (volts)');
% 
%  [PSD,F] = periodogram(x,[],[],1);
%   figure;
%   plot(F,PSD);
%   title("PSD of PolarNRZ Line Code");
%   xlabel('Freq(HZ)');
% ylabel('PSD (volts/HZ)');
end
