clc 
close
clear all
load('data2\PARKINSON2');

%data=xlsread('data2\GENEEX.xlsx');

[m,n]=size(data);                            
d=10;
nteam=20;
not=2;
noi=20;



%----------5fold-----------
k=5;
fold=zeros(m,k);
nog=fix(m/k);
for i=1:k
    fold((i-1)*nog+1:nog*i,i)=1;
end

[F1,I]=sort(fold(:,1));
dataF1=data(I,:);
[F1,I]=sort(fold(:,2));
dataF2=data(I,:);
[F1,I]=sort(fold(:,3));
dataF3=data(I,:);
[F1,I]=sort(fold(:,4));
dataF4=data(I,:);
[F1,I]=sort(fold(:,5));
dataF5=data(I,:);
dataF=[dataF1,dataF2,dataF3,dataF4,dataF5];
%--------input 1of 5fold---------

bestf=zeros(5,d+3);
hamtrader=zeros(5,noi);
hamatrader=zeros(5,noi);
%---------data Normalization-------------
for i=1:5
    input=dataF(:,(i-1)*n+1:n*i);
    
    [k,l]=size(input);
    label=input(:,l);
    input(:,l)=[];
  
    input = normalize(input,'range');

   [teams,hamwcc,hamawcc] = jWCC(input,label,nteam,not,d,noi);
end
acckfold=hamwcc(:,noi);
acc=mean(acckfold);