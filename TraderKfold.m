clc 
close
clear all
load('data2\ARRYTM16');

%data=xlsread('data2\GENEEX.xlsx');

[m,n]=size(data);
noi=50;
d=6;                                
nob=21;
not=7;

%----------dataprem--------
%data=prand(data);

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
  
    %input = normalize(input,'range');
    %noi=30;d=6;nob=20;not=10;

    [bestf(i,:),hamtrader(i,:),hamatrader(i,:)] = jTRADER(input,label,nob,not,d,noi);
end
acckfold=hamtrader(:,noi);
acc=mean(acckfold);