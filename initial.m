function [ output ] = initial( branches,k )
[m,n]=size(branches);
n=n-3;
for i=1:m
   a=1:k;
   for j=1:n 
       [r,d]=size(a);
       c=randi(d);
       branches(i,j)=a(r,c);
       a(:,c)=[];
   end
end
output=branches;
end

