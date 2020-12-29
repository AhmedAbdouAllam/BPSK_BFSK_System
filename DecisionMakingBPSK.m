function [RecivedBits] = DecisionMakingBPSK(FilterSamples,GeneratedBits)

%Here we see According to zero Theresold if the Filterd sample is postive
%or negative and accordingly we "Predict" if 1 or 0 was sent
RecivedBits=zeros(1,length(GeneratedBits));
for i=1:length(GeneratedBits)
        if (FilterSamples(i)>0)
            RecivedBits(i)=1;
             %the critical value zero is choosen to be zero   
        end
end

% figure(18);
% stem(RecivedBits);%
% title("RecivedBitsofBPSK");
% xlabel('time(sec)');
% ylabel('RecivedBitsofBPSK(volts)');

end

