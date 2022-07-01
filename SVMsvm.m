
clc
close
clear all

load('data2\CHD2');

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
dataF=[dataF1,dataF2,dataF3,dataF4,dataF5];
%--------input 1of 5fold---------

accu=zeros(1,5);
%---------data Normalization-------------
for i=1:5
    input=dataF(:,(i-1)*n+1:n*i);
    
    [k,l]=size(input);
    label=input(:,l);
    input(:,l)=[];
  
    input = normalize(input,'range');
   
    entries_breakpoint = round(m*.80);
    x_train = input(1:entries_breakpoint,:);
    y_train = label(1:entries_breakpoint,1);

    x_test = input((entries_breakpoint)+1:end,:);
    y_test = label((entries_breakpoint)+1:end,1);

    svmod=fitcecoc(x_train,y_train);
    prediction=predict(svmod,x_test);

    accu(1,i)=sum( prediction== y_test)/numel(y_test);

end
acc=mean(accu);
