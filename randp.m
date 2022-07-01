function output = randp(data)
[a,b]=size(data);
datam=zeros(a,b);
x=randperm(data);

for i=1:a
    for j=1:b
     datam(i,j)=data(x(i),j);
    end
end
output=datam;
end


