clc, clear, close 
% Benchmark data set 
load('data2/ARCENE2');
load('result2/ARCENE');

[m,n]=size(data);
input=data;
%---------data Normalization-------------
input = normalize(input,'range');

label=input(:,n);
input(:,n)=[];
[m,n]=size(input);
bes=[2975,3810,5336,490,9739,1516,120,5648,1517,6714,708,7639,6520,7902,0,0,0];
best=[7331,8192,9985,8901,3349,1289,3523,1478,6862,5516,9371,2103,6915,0,0,0];
bestf=[8071,2615,8340,1126,9185,9292,397,3598,2373,9674,7371,1223,239,4426,7865,0,0,0];
bestfp=[261,5218,9849,8208,8760,145,2712,166,8851,635,7856,118,1477,2950,4958,0,0,0];

tp=0.8;
sv='-s 0 -q';
%---------clasification------------
fprintf('\n ----wcc-----:\n');
pre=svmscore2(bes,input,label,tp,sv);
fprintf('\n ----LCA-----:\n');
%pre1=svms( input,label,bestt);
pre2=svmscore2(best,input,label,tp,sv);
fprintf('\n ----pso-----:\n');
pr=svmscore2(bestf,input,label,tp,sv);
fprintf('\n ----ICA-----:\n');
%pre3=svms( input,label,bestp);
pre3=svmscore2(bestfp,input,label,tp,sv);


%------------voting------------------
pre1=[res(:,1),res(:,5)];
[a,b]=size(pre1);
resul=zeros(a,7);
resul=[res(:,2:4),pre2(:,2),pre3(:,2)];
A=unique(resul);
predec=zeros(a,1);
for i=1:a
    
    R = histc(resul(i,:),A);
    if R(1,1)>=3
        predec(i,1)=A(1,1);
    else 
        predec(i,1)=A(2,1);
    end
        
end
resul=[res(:,1),resul,predec];
y_test=res(:,1);
prediction=predec;
result=[y_test,prediction];
[k,order] = confusionmat(y_test,prediction);
figure
cm = confusionchart(y_test,prediction, ...
    'Title','confusion ', ...
    'RowSummary','row-normalized', ...
    'ColumnSummary','column-normalized');
accu=sum( prediction== y_test)/numel(y_test);
fprintf('\n voting accuracy: %2.2f%%\n',accu*100);

[ sen,spc,pro,acc] = svmscoreselect(y_test,prediction);
fprintf('\n accuracy: %2.2f%%\n',acc*100);
fprintf('\n sensitivity: %2.2f%%\n',sen*100);
fprintf('\n specificity: %2.2f%%\n',spc*100);
fprintf('\n precision: %2.2f%%\n',pro*100);
resul