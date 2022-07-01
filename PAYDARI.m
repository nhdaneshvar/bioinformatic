tic;
clc
close
clear all

data=load('data2/2GENEEX.txt');

input=data;

[m,n]=size(input);
label=input(:,n);
input(:,n)=[];
[m,n]=size(input);

%---------data Normalization-------------
%input = normalize(input,'range');

nob=21;
not=7;
d=20;
noi=40;
iter=50;
hamtr=zeros(iter,noi);
hamatr=zeros(iter,noi);
paytr=zeros(1,iter);
for i=1:iter
    
   [best,hamtrader,hamatrader] = jTRADER(input,label,nob,not,d,noi);
   hamtr(i,:)=hamtrader(1,:);
   hamatr(i,:)=hamatrader(1,:);
   paytr(i)=max(hamtr(i,:));
end

nteam=21;
no=3;
iterw=50;
hamw=zeros(iterw,noi);
hamaw=zeros(iterw,noi);
payw=zeros(1,iterw);
for i=1:iterw
  
    [bestf,hamwcc,hamawcc] = jWCC(input,label,nteam,no,d,noi);
    hamw(i,:)=hamwcc(1,:);
    hamaw(i,:)=hamawcc(1,:);
    payw(i)=max(hamw(i,:));
end

N = 10; 
c1= 2; 
c2= 2;
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
figure
plot(1:iter,paytr);
figure
plot(1:iterw,payw);
toc;
