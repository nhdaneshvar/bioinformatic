function [accu,prediction]= VOTING(data1,data2,data3)

[m,n]=size(data1);
res=zeros(m,4);
res=[data1,data2(:,2),data3(:,2)];
for i=1:m
    c=0;
    if (res(i,2)==res(i,3))|(res(i,2)==res(i,4))
        res(i,5)=res(i,2);
    
    elseif (res(i,2)~=res(i,3))&(res(i,2)~=res(i,4))
        res(i,5)=res(i,3);
    end
    
       
end
y_test=res(:,1);
prediction=res(:,5);
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
scor=(2*pro*sen)/(pro+sen);
fprintf('\n f1-score: %2.2f%%\n',scor*100);
end

