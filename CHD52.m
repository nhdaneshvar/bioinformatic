function output = CHD52(input)

[m,n]=size(input);



for i=1:m 

    if input(i,n)== 0
        
        input(i,n)=0;
    else 
        input(i,n)=1;
    end
end
output=input;
end

