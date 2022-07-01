function [ output] = update_property(property,branches)
t=length(property);
[m,n]=size(branches);

for i=1:t
    s=0;
    for j=1:m
        if branches(j,n-2)==i
           s=s+branches(j,n);
        end
    end
    property(i)=s;
end

output=property;
end