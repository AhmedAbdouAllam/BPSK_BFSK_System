clc;
clear;
%Author:Ahmed A.Allam 27/11/2019
%We Will divide the Project into functions for Modularity
%This functions are of basic blocks mentioned in the Project Document
Tb=40; 
No=2;

SNRe=-4:1:4;
BER_Pr_BPSK=zeros(1,length(SNRe));
BER_Pr_BFSK=zeros(1,length(SNRe));
BER_Th_BPSK=zeros(1,length(SNRe));
BER_Th_BFSK=zeros(1,length(SNRe));
No_of_sent_bits=1000000;
for i=1:length(SNRe)
   for k=1:20
    RealizationError=BPSK(SNRe(i),No_of_sent_bits);
    BER_Pr_BPSK(i)=BER_Pr_BPSK(i)+RealizationError;
   end
   BER_Pr_BPSK(i)=BER_Pr_BPSK(i)/20;
    
   for k=1:20
    RealizationError=BFSK(SNRe(i),No_of_sent_bits);
    BER_Pr_BFSK(i)=BER_Pr_BFSK(i)+RealizationError;
   end
   BER_Pr_BFSK(i)=BER_Pr_BFSK(i)/20;
   A=sqrt((10^(SNRe(i)/10))*2*(No/Tb));
   %We have made all of Our Calculations based on Effective SNR
   %So here in "Thoritical BER" we will use Effective SNR 
   BER_Th_BPSK(i)=0.5*erfc(sqrt(((A^2*Tb)/2)/No));
   BER_Th_BFSK(i)=0.5*erfc(sqrt(((A^2*Tb)/2)/(No*2)));
   %I have Knew that when it didn't go well 
   
end

figure(1);
semilogy(SNRe,BER_Pr_BPSK,'b');
hold on;
semilogy(SNRe,BER_Th_BPSK,'r');
title(['BPSK Perfomance graph with ',num2str(No_of_sent_bits),' bits']);
xlabel('SNR(dB)');
ylabel('Log(BER)');
legend('Practical BER','Theoretical BER');
hold off;
figure(2);
semilogy(SNRe,BER_Pr_BFSK,'b');
hold on;
semilogy(SNRe,BER_Th_BFSK,'r');
title(['BFSK Perfomance graph with ',num2str(No_of_sent_bits),' bits']);
xlabel('SNR(dB)');
ylabel('Log(BER)');
legend('Practical BER','Theoretical BER');
hold off;
figure(3)
semilogy(SNRe,BER_Pr_BFSK,'b');
hold on;
semilogy(SNRe,BER_Th_BFSK,'r');
hold on;
semilogy(SNRe,BER_Pr_BPSK,'y');
hold on;
semilogy(SNRe,BER_Th_BPSK,'g');

title(['BFSK & BFSK on the same graph with ',num2str(No_of_sent_bits),' bits']);
xlabel('SNR(dB)');
ylabel('Log(BER)');
legend('Practical BER BFSK','Theoretical BER BFSK','Practical BER BPSK','Theoretical BER BPSK');
