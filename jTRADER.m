function[best,hamtrader,hamatrader] = jTRADER(input,label,nob,not,d,noi)
[m,n]=size(input);

nog=round(nob/not);
property=zeros(1,not);
branches=zeros(nob,d+3);
branches=initial(branches,n);
branches(:,d+1)=not;
for i=1:not
    branches((i-1)*nog+1:nog*i,d+1)=i;
end
tp=0.8;
sv='-s 0 -q';
branches=svmscore(branches,input,label,tp,sv);

hamtrader=zeros(1,noi);
hamatrader=zeros(1,noi);
for i=1:noi   
    branches=main_branch(branches,not);
    branches=retailing(branches,input,label,tp,sv,n); 
    branches=distributing(branches,input,label,tp,sv);
    branches=import_export(branches,input,label,tp,sv,not);
    property=update_property(property,branches);
    branches=get_branch(branches,property);
    hamtrader(1,i)=max(branches(:,d+3));
    hamatrader(1,i)=mean(branches(:,d+3));
end

%---------select best feature-------
[a,b]=max(branches(:,d+3));
best=branches(b,:);
bestf=branches(b,1:d);
fprintf('best accuracy: %2.2f%%\n',a);
fprintf('best feature:\n');
fprintf('%d ,',bestf);
end