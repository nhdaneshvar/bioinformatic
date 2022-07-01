function [ output ] = import_export(branches,input,label,tp,sv,not)
[m,n]=size(branches);
tmp=zeros(not,n);

for i=1:m

    h=randi(m);
    f=branches(h,n-1);
    tmp=branches(f,:);

    if ne(branches(i,n-1),f)
        r=branches(i,n-1);
        k=max(2,round(randi(n-3)/10));
        for j=1:k
            l=randi(n-3);
           
            tmp(1,l)=branches(r,l);
        end
    end
 
end
 tmp=svmscore(tmp,input,label,tp,sv);
    %if objective_function==1
    if tmp(1,n)>branches(i,n)
       branches(i,:)=tmp; 
    end
output=branches;
end
