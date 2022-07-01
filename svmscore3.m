function [ output ] = svmscore3( teams,input,label,tp,sv)
[m,n]=size(teams);
[a,b]=size(input);
cr=0;
for i=1:m
    selection=zeros(1,n-3);
    for j=1:n-3
        flag=1;
        for k=1:j-1
            if teams(i,k)==teams(i,j)
                flag=0;
                break;
            end
        end
        if flag==1
            selection(1,j)=teams(i,j);
        end
    end
   
    pssmtrain=[];
    for j=1:n-3
        if selection(1,j)~=0
           pssmtrain=[pssmtrain,input(:,teams(i,j))]; 
        end
    end
    model = svmtrain(label(1:fix(a*tp),1),pssmtrain(1:fix(a*tp),:),sv);
    if ~contains(sv,'-v')
    [p, accuracy_L,d] = svmpredict(label(fix(a*tp):a,1), pssmtrain(fix(a*tp):a,:), model);
    predic=[label(fix(a*tp):a,1),p];
    [k,order] = confusionmat(label(fix(a*tp):a,1),p);
    figure
    cm = confusionchart(label(fix(a*tp):a,1),p, ...
        'Title','confusion ', ...
        'RowSummary','row-normalized', ...
        'ColumnSummary','column-normalized');
    if cr==1
        teams(i,n-1)=accuracy_L(2);
        teams(i,n)=accuracy_L(3);
        accuracy_L(3)
    else 
        [sen,spc,pro,acc]=svmscoreselect(label(fix(a*tp):a,1),p);
        fprintf('\n accuracy: %2.2f%%\n',acc*100);
        fprintf('\n sensitivity: %2.2f%%\n',sen*100);
        fprintf('\n specificity: %2.2f%%\n',spc*100);
        fprintf('\n precision: %2.2f%%\n',pro*100);
        scor=(2*pro*sen)/(pro+sen);
        fprintf('\n f1-score: %2.2f%%\n',scor*100);
        ct=1;
        teams(i,n+1)=accuracy_L(2);
        if ct==3
           teams(i,n+1)=sen;
        end
        if ct==4
           teams(i,n+1)=spc;
        end
        if ct==5
           teams(i,n+1)=pro;
        end
        teams(i,n)=acc;
    end
    else
       teams(i,n+1)=-model;
       teams(i,n)=0;
    end
end
output=[sen,spc,pro,acc];
end