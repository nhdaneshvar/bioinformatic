

load('data\PR.txt');

for i=1:9
    subplot(3,3,i); 

    y=PR(i,:);


    X=categorical({'Trader','WCC','LCA','PSO','ICA','Voting'});
    X=reordercats(X,{'Trader','WCC','LCA','PSO','ICA','Voting'});
    b=bar(X,y,0.7,'FaceColor',[.9 .8 .8],...
    'EdgeColor',[.4 .2 .3],'lineWidth',1);
    b.FaceColor='flat';
    b.CData(2,:) = [.7 .9 .8];
    b.CData(3,:) = [.6 .7 .9];
    b.CData(4,:) = [.8 .9 .7];
    b.CData(5,:) = [.4 .9 .8];
    b.CData(6,:) = [.9 .6 .7];

    text(.8,y(1,1)+.05,num2str(y(1,1)));
    text(1.8,y(1,2),num2str(y(1,2)));
    text(2.8,y(1,3),num2str(y(1,3)));
    text(3.8,y(1,4),num2str(y(1,4)));
    text(4.8,y(1,5),num2str(y(1,5)));
    text(5.8,y(1,6),num2str(y(1,6)));

    ylabel('AUC')
end


