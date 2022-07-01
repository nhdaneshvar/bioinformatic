function [ output ] = distributing(branches,input,label,tp,sv)
[m,n]=size(branches);
for i=1:m
    tmp=branches(i,:);
    
    f=branches(i,n-1);
    if ne(branches(f,:),tmp)
       k=max(2,round(randi(n-3)/10));
       for j=1:k
           h=randi(n-3);
           r=randi(n-3);
           tmp(1,h)=branches(f,r);
       end
    end
    tmp=svmscore(tmp,input,label,tp,sv);
    %if objective_function==1
    if tmp(1,n)>branches(i,n)
       branches(i,:)=tmp; 
    end
    %end
end
output=branches;
end

