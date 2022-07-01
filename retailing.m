function [ output ] = retailing(branches,input,label,tp,sv,nof)
[m,n]=size(branches);
for i=1:m
    tmp=branches(i,:);
    k=max(2,round(randi(n-3)/10));
    for j=1:k
        r=randi(nof);
        h=randi(n-3);
        tmp(1,h)=r;
    end
    tmp=svmscore(tmp,input,label,tp,sv);
    if tmp(1,n)>branches(i,n)
       branches(i,:)=tmp; 
    end
    %end
end
output=branches;
end