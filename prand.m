function output = prand(data)
[a,b]=size(data);
datam=zeros(a,b);
x=randperm(a);

for i=1:a
    datam(i,:)=data(x(i),:);
 
end
output=datam;
end


