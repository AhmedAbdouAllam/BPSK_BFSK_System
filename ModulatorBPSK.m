function [ModulatedBPSK,t,Wc] = ModulatorBPSK(InputBits,A)
Tb=40; %bit duration
N=40;
Ts=Tb/N;
 Wc = (4*2*pi)/Tb;
% Ws=(N*2*pi)/Tb;
% %now we need to generate Polar NRZ signal 
% % Another function will Be used to generate The PolarNRZ Signal

% ModulatedBPSK=A*x.*cos(Wc*t);
% figure (1);
% plot(t,ModulatedBPSK);
% hold on
%We will use another Approach that the commented;as it takes a Shorter time
InterPoint=0;
for i=1:length(InputBits)
    t_Sample=Ts:Ts:Tb;
    InterPoint=InterPoint+1;
    if (InputBits(i)==1)
        ModulatedBPSK(1,InterPoint:InterPoint+(Tb/Ts)-1)=A*cos(Wc*t_Sample);
    else
        ModulatedBPSK(1,InterPoint:InterPoint+(Tb/Ts)-1)=-A*cos(Wc*t_Sample);
    end
InterPoint=InterPoint+(Tb/Ts)-1;
end
t=0:1:length(ModulatedBPSK)-1;

end

