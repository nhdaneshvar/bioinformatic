
function [ output ] = get_branch(branches,property)
t=length(property);
[m,n]=size(branches);
NB=zeros(1,t);
s=sum(property);
for i=1:t
    NB(i)=fix((property(i)/s)*(m-2*t));
    %property(t)=property(t)+(m-s);
end
k=1;
for i=1:t
    c=0;
    for j=k:m
        if c <NB(i)
           branches(j,n-2)=i;
           c=c+1;
        end
        k=k+c;
    end
end
%property=update_property(property,newb);
output=branches;
end