clc
close
clear all

load('res\AUC.txt');
y=AUC(:,9);
X=categorical({'Trader','WCC','LCA','PSO','ICA','Voting'});
X=reordercats(X,{'Trader','WCC','LCA','PSO','ICA','Voting'});
b=bar(X,y,0.7,'FaceColor',[0 .3 .6],...
'EdgeColor',[0 .9 .9],'lineWidth',1.2);
b.FaceColor='flat';
b.CData(2,:) = [0 .5 .2];
b.CData(3,:) = [0 .8 .5];
b.CData(4,:) = [.5 .7 .5];
b.CData(5,:) = [.2 .9 .8];
b.CData(6,:) = [0 .5 .5];

ylabel('AUCPR')
