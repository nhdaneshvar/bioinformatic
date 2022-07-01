function [ output ] = import_export(branches)
[m,n]=size(branches);
not=4;
t=not;
tmp=zeros(not,n);
[master,countg]=main_branch(branches);

for i=1:t
    f=master(i);
    tmp(i,:)=branches(f,:);
end
    
for j=1:t
    h=randi(n-3);
    tmp(1,h)=tmp(j,h);
end
for k=1:t
    d=master(k);
    branches(d,:)=tmp(k,:);
end
output=branches;
end
