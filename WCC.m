close
clear all
load('data2/PARKINSON2');
[m,n]=size(data);

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

%--------input 1of 5fold---------
input=data;



[m,n]=size(input);
label=input(:,n);
input(:,n)=[];
[m,n]=size(input);

%---------data Normalization-------------
input = normalize(input,'range');

d=6;
%d=round(n/2);
nteam=20;
no=2;
noi=20;


[bestf,hamwcc,hamawcc] = jWCC(input,label,nteam,no,d,noi);

plot(1:noi,hamwcc); 
xlabel('Number of Iterations');
ylabel('Accuracy');
title('WCC'); grid on;
figure
plot(1:noi,hamawcc); 
xlabel('Number of Iterations');
ylabel(' Corelation');
title('WCC'); grid on;


%---------clasification------------
pre=svms( input,label,bestf);