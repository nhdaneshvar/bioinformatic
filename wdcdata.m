load('wdbc');
%wdbc(1,:)=[];
wdbc(:,1)=[];

input=wdbc;
label=input(:,1);
label=table2array(label);
input(:,1)=[];
input=table2array(input);

[m,n]=size(input);
for i=1:m 

    if label(i,1)== 'M'
        
        label(i,1)='1';
    else 
        label(i,1)="0";
    end
end
input(:,n+1)=label(:,1);


%input=importdata('SDH_N.txt');
[m,n]=size(input);
label=input(:,n);
input(:,n)=[];
[m,n]=size(input);
