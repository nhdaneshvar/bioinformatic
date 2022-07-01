function [ output ] = score( teams,input,label,tp,sv)
 teams=svmscore(teams,input,label,tp,sv);

output=teams;
end