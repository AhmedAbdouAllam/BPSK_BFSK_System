function RecivedBits=DecisionMakingBFSK(SampledOutputFilter1,SampledOutputFilter2,GeneratedBits)

%Here we see According to which is Greater the Sample of the first matched
%filter or the second and accordingly we "Predict" if 1 or 0 was sent

RecivedBits=zeros(1,length(GeneratedBits));
for i=1:length(GeneratedBits)
        if (SampledOutputFilter1(i)>SampledOutputFilter2(i))
            RecivedBits(i)=1;
             %the critical value if they are equal is choosen to be zero   
        end
end
% figure(19);
% stem(RecivedBits);%
% title("RecivedBitsofBFSK");
% xlabel('time(sec)');
% ylabel('RecivedBitsofBFSK(volts)');


end

