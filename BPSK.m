function [BER] = BPSK(SNRe,No_of_sent_bits)

Tb=40; 
No=2;
% No_of_sent_bits=100;%
% SNRe=2;
%first of all we will generate the random bits that will be used in the
%whole project [EquiProbable as given]
InputBits=round(rand(1,No_of_sent_bits));
%[t,x] = PolarNRZ(InputBits,Tb,No_of_sent_bits);
%going on with BPSK 
A=sqrt((10^(SNRe/10))*2*(No/Tb));
[ModulatedBPSK,t,Wc]=ModulatorBPSK(InputBits,A);

%now we have to deal with the channel the channel is ideal but it adds AWGN
%to the signal

Noise=wgn(1,length(ModulatedBPSK),10*log10(No/2));
RecivedSignal=Noise+ModulatedBPSK;
% plot(t,RecivedSignal);%
% hold off%
% figure(9);
% plot(t,Noise);%
% title("White Gaussuian Noise with Sp(f)=1");
% xlabel('time(sec)');
% ylabel('Noise (volts)');
% figure(10);
% plot(t,ModulatedBPSK);%
% title("The Modulated BPSK signal");
% xlabel('time(sec)');
% ylabel('SentSignal (volts)');
% 
% figure(11);
% plot(t,RecivedSignal);%
% title("The Recived BPSK signal");
% xlabel('time(sec)');
% ylabel('SentSignal (volts)');
 
%we will now Go on with the BPSK Demodulator and the matched filter
RecivedSampels=MatchedFilterBPSKAndSampler(RecivedSignal,Tb,Wc,No_of_sent_bits);
RecivedBits=DecisionMakingBPSK(RecivedSampels,InputBits);
BER=ErrorCaluculation(InputBits,RecivedBits);
end

