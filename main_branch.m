function [ output ] = main_branch(branches,not)
[m,n]=size(branches);
for i=1:not
    s=1;
    for j=1:m
        if branches(j,n-2)==i
            s=j;
            break;
        end
    end
    k=s;
    for j=s+1:m
        if (branches(j,n-2)==i)&&(branches(j,n)>branches(k,n))
            k=j;
        end
    end
    for j=1:m
        if branches(j,n-2)==i
           branches(j,n-1)=k; 
        end
    end
end
output=branches;
end

