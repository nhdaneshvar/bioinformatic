function pre= svms( feat,label,bestf)
[c,d]=size(bestf);
[m,n]=size(feat);
d=d-3;
feature=zeros(m,d);
for j=1:d
    f= bestf(1,j);
    feature(:,j)=feat(:,f);
end

entries_breakpoint = round(m*.80);
x_train = feature(1:entries_breakpoint,:);
y_train = label(1:entries_breakpoint,1);
    
x_test = feature((entries_breakpoint)+1:end,:);
y_test = label((entries_breakpoint)+1:end,1);
  
svmod=fitcecoc(x_train,y_train);
prediction=predict(svmod,x_test);
pre=[y_test,prediction];
%fprintf('\n y_test   predect \n');
%fprintf(' %d    %d \n',pre)
[k,order] = confusionmat(y_test,prediction);
figure
cm = confusionchart(y_test,prediction, ...
    'Title','confusion ', ...
    'RowSummary','row-normalized', ...
    'ColumnSummary','column-normalized');
accu=sum( prediction== y_test)/numel(y_test);


[ sen,spc,pro,acc] = svmscoreselect(y_test,prediction);
fprintf('\n accuracy: %2.2f%%\n',acc*100);
fprintf('\n sensitivity: %2.2f%%\n',sen*100);
fprintf('\n specificity: %2.2f%%\n',spc*100);
fprintf('\n precision: %2.2f%%\n',pro*100);

end