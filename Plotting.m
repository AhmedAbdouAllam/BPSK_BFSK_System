
No_of_sent_bits=100;
SNRe=0;
Tb=40;
InputBits=round(rand(1,No_of_sent_bits));
[t,x] = PolarNRZ(InputBits,Tb,No_of_sent_bits);
% BER = BPSK(SNRe,No_of_sent_bits,InputBits);
% BER2 = BFSK(SNRe,No_of_sent_bits,InputBits);
BER_Pr_BPSK=0;
   for k=1:20
    RealizationError=BPSK(SNRe,No_of_sent_bits,InputBits);
    BER_Pr_BPSK=BER_Pr_BPSK+RealizationError;
   end
   BER_Pr_BPSK=BER_Pr_BPSK/20
   
   BER_Pr_BFSK=0;
     for k=1:20
    RealizationError=BFSK(SNRe,No_of_sent_bits,InputBits);
    BER_Pr_BFSK=BER_Pr_BFSK+RealizationError;
   end
   BER_Pr_BFSK=BER_Pr_BFSK/20