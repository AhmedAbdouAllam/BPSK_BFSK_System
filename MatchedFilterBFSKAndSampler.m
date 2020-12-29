function [SampledOutputOfFilter1,SampledOutputOfFilter2]=MatchedFilterBFSKAndSampler(ReceivedSignal,Tb,Wc1,Wc2,No_of_sent_bits)
%We have found it Hard to use correlator so we have decided to use matched
%filter
%We know that we only need to deal with Two Basis Functions So Tw Matched
%filters is needed

t=0:1:Tb-1; %Tb times
t_Filter=Tb-t;
MatchedFilter1= cos(Wc1 * t_Filter);
MatchedFilter2= cos(Wc2 * t_Filter);
%We are going to deal with evrey matched Filter on its own
%Now we are going to get the Output of Matched Filter
OutputOFFilter1=conv(ReceivedSignal,MatchedFilter1);
OutputOFFilter2=conv(ReceivedSignal,MatchedFilter2);
%Now we are sampling both Output Signals
% 
% figure(13);
% plot(OutputOFFilter1);%
% title("OutputOfFilter1BFSK");
% xlabel('time(sec)');
% ylabel('MatchedFilter1Output (volts)');
% figure(14);
% plot(OutputOFFilter2);%
% title("OutputOfFilter2BPFK");
% xlabel('time(sec)');
% ylabel('MatchedFilter2Output (volts)');
SampledOutputOfFilter1=zeros(1,No_of_sent_bits);
for i=1:No_of_sent_bits
    SampledOutputOfFilter1(i)=OutputOFFilter1(i*(Tb));
end


SampledOutputOfFilter2=zeros(1,No_of_sent_bits);
for i=1:No_of_sent_bits
    SampledOutputOfFilter2(i)=OutputOFFilter2(i*(Tb));
end

% figure(15);
% stem(SampledOutputOfFilter1);%
% title("SampledOutputOfFilter1BFSK");
% xlabel('time(sec)');
% ylabel('MatchedFilter1OutputSampeld (volts)');
% figure(16);
% stem(SampledOutputOfFilter2);%
% title("SampledOutputOfFilter2BPFK");
% xlabel('time(sec)');
% ylabel('SampledOutputOfFilter2BPFK(volts)');


end

