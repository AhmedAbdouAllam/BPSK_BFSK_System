function [BER] = BFSK(SNRe,No_of_sent_bits)


Tb=40; 
No=2;
% No_of_sent_bits=100;%
% SNRe=2;%
%first of all we will generate the random bits that will be used in the
%whole project [EquiProbable as given]
InputBits=round(rand(1,No_of_sent_bits));
%going on with BFSK 
A=sqrt((10^(SNRe/10))*2*(No/Tb));
%As we see the Previous part of the code is the same of BPSK
[ModulatedBFSK,t,Wc1,Wc2]=ModulatorBFSK(InputBits,A);
%now we have to deal with the channel the channel is ideal but it adds AWGN
%to the signal

Noise=wgn(1,length(ModulatedBFSK),10*log10(No/2));
RecivedSignal=Noise+ModulatedBFSK;
% figure(7);
% plot(t,ModulatedBFSK);%
% title("The Modulated BFSK signal");
% xlabel('time(sec)');
% ylabel('SentSignal (volts)');
% 
% figure(8);
% plot(t,RecivedSignal);%
% title("The Recieved BFSK signal");
% xlabel('time(sec)');
% ylabel('SentSignal (volts)');


%we will now Go on with the BFSK Demodulator and the matched filter
[SampledOutputFilter1,SampledOutputFilter2]=MatchedFilterBFSKAndSampler(RecivedSignal,Tb,Wc1,Wc2,No_of_sent_bits);
RecivedBits=DecisionMakingBFSK(SampledOutputFilter1,SampledOutputFilter2,InputBits);
BER=ErrorCaluculation(InputBits,RecivedBits);



end

