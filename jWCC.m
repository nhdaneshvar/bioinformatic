function [teams,hamwcc,hamawcc] = jWCC(input,label,nteam,not,d,noi)


mtime=1;

[m,n]=size(input);

teams=zeros(nteam,d+3);
teams=initial(teams,n);
nog=round(nteam/not);
nogr=nteam/not;


tp=0.8;
sv='-s 0 -q';
teams=svmscore(teams,input,label,tp,sv);

hamwcc=zeros(1,noi);
hamawcc=zeros(1,noi);
for g=1:noi
   teams=grouping(teams,nogr,nteam); 
   teams=groupmatch(teams,mtime,input,label,tp,sv,n);
   hamwcc(1,g)=max(teams(:,d+3));
   hamawcc(1,g)=mean(teams(:,d+3));
end
 teams= eliminate(teams,mtime,input,label,tp,sv,n);

[a,b]=size(hamwcc);
f1=max(teams(:,d+3));
hamwcc(a,b)=f1;
%---------select best feature-------
bestf=teams(1,1:d);
fprintf('best accuracy: %2.2f%%\n',teams(1,d+3));
fprintf('best feature:\n');
fprintf('%d ,',bestf);
end
