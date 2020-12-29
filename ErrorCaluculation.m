function [BER] = ErrorCaluculation(SentBits,RecivedBits)
%Here we see how many bits are wrong
OutOfOrderBits=0;
for i=1:length(SentBits)
    if(SentBits(i)~=RecivedBits(i))
        OutOfOrderBits=OutOfOrderBits+1;
    end
end
%So bit error is the ratio how many bits are wrong and total bits
BER=OutOfOrderBits/length(SentBits);
end

