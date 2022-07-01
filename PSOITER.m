clc
close
clear all

load('data2\PID2');

input=data;

[m,n]=size(input);
label=input(:,n);
input(:,n)=[];
[m,n]=size(input);

%---------data Normalization-------------
input = normalize(input,'range');

N = 10; 
c1= 2; 
c2= 2;
d=6;
noi=40;
iter=50;
hamp=zeros(iter,noi);
hamap=zeros(iter,noi);
payp=zeros(1,iter);
for i=1:iter
   [bestfp,hampso,hamapso] = jBPSO(input,label,N,d,noi,c1,c2);
   hamp(i,:)=hampso(1,:);
   hamap(i,:)=hamapso(1,:);
   payp(i)=max(hamp(i,:));
end

figure
plot(1:iter,payp);

