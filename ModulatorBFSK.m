function [ModulatedBFSK,t,W1,W2] = ModulatorBFSK(InputBits,A)

Tb=40; %bit duration
N=40;
n0=4;
n1=1;
Ts=Tb/N;
W1=(2*pi*(n0+n1))/Tb;
W2=(2*pi*(n0-n1))/Tb;

%We will do it same as the Document but in one shoot
InterPoint=0;
for i=1:length(InputBits)
%It's used for evrey sample to generate Cosine
    t_Sample=Ts:Ts:Tb;
    InterPoint=InterPoint+1;
    if (InputBits(i)==1)
        ModulatedBFSK(1,InterPoint:InterPoint+(Tb/Ts)-1)=A*cos(W1*t_Sample);
    else
        ModulatedBFSK(1,InterPoint:InterPoint+(Tb/Ts)-1)=A*cos(W2*t_Sample);
    end
    InterPoint=InterPoint+(Tb/Ts)-1;
end
t=0:1:length(ModulatedBFSK)-1;
% figure (1);
% plot(t,ModulatedBFSK);
% hold on

end

