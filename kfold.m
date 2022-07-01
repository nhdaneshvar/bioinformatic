clc 
close
clear all
data=importdata('data\SDH.txt');
[a,b]=size(data);
% Call kfold

rng('default') % For reproducibility
c = cvpartition(a,'KFold',5);
fold1 = test(c,1);
fold2 = test(c,2);
fold3 = test(c,3);
fold4 = test(c,4);
fold5 = test(c,5);

kf = [fold1,fold2,fold3,fold4,fold5];
h = heatmap(double(kf),'ColorbarVisible','off');
sorty(h,{'1','2','3','4','5'},'descend')
xlabel('Repetition')
ylabel('Observation')
title('Test Set Observations')

[F1,I]=sort(fold1);
dataF1=data(I,:);
[F1,I]=sort(fold2);
dataF2=data(I,:);
[F1,I]=sort(fold3);
dataF3=data(I,:);
[F1,I]=sort(fold4);
dataF4=data(I,:);
[F1,I]=sort(fold5);
dataF5=data(I,:);
