clc;
clear all;
close all;
M=16; %M=input(' enter the value of M array for QAM modulation : ');
fprintf('\n\n\n'); % input checking loop
Ld=log2(M);
ds=ceil(Ld);
dif=ds-Ld;
if(dif~=0)
error('the value of M is only acceptable if log2(M)is an integer');
end
% binary Information Generation
nbit=64; %number of information bits
msg=round(rand(nbit,1)); % information generation as binary form
disp(' binary information at transmitter '); %binary information at transmitter
disp(msg);
fprintf('\n\n'); % representation of transmitting binary information as digital signal
x=msg;
bp=.000001; % bit period
bit=[];
for n=1:1:length(x)
if x(n)==1;
se=ones(1,100);
else x(n)==0;
se=zeros(1,100);
end
bit=[bit se];
end
t1=bp/100:bp/100:100*length(x)*(bp/100);
figure(1)
subplot(3,1,1);
plot(t1,bit,'lineWidth',2.5);grid on;
axis([ 0 bp*length(x) -.5 1.5]);
ylabel('amplitude(volt)');
xlabel(' time(sec)');
title('transmitting information as digital signal'); % binary information convert into symbolic form for M-ary QAM modulation
M=M; % order of QAM modulation
msg_reshape=reshape(msg,log2(M),nbit/log2(M))';
disp(' information are reshaped for convert symbolic form');
disp(msg_reshape);
