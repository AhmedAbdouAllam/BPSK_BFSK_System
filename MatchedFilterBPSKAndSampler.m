function [SampledOutputOffilter] = MatchedFilterBPSKAndSampler(ReceivedSignal,Tb,Wc,NO_Of_bits)

%We have found it Hard to use correlator so we have decided to use matched
%filter
%We know that we only need to deal with amplitude So one Matched filter is
%ok

t=0:1:Tb-1; %Tb times
t_Filter=Tb-t;
MatchedFilter= cos(Wc * t_Filter);
OutputOFFilter=conv(ReceivedSignal,MatchedFilter);



% figure(17);
% plot(OutputOFFilter);%
% title("OutputOfFilterBPSK");
% xlabel('time(sec)');
% ylabel('OutputOfFilterBPSK (volts)');
 
SampledOutputOffilter=zeros(1,NO_Of_bits);
for i=1:NO_Of_bits
    SampledOutputOffilter(i)=OutputOFFilter(i*(Tb));
end
% 
% figure(12);
% stem(SampledOutputOffilter);%
% title("Sampled Output OfFilter BPSK");
% xlabel('time(sec)');
% ylabel('SampledOutputOfFilter (volts)');



end

