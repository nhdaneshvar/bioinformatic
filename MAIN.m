clc, clear, close 
% Benchmark data set 
load('data2/WDBC2');

load('res\WDBC\hamic.txt');
load('res\WDBC\hamlc.txt');
load('res\WDBC\hamaic.txt');
load('res\WDBC\hamalc.txt');

bestlc=[15,9,23,22,21,27,0,0,0];
bestic=[22,21,11,7,23,29,0,0,0.85];
noi=50;
d=10;
hamalc1=zeros(1,50);
hamalc1(1,1:10)=hamalc(1,1:10);
for i=1:20
    j=(2*i)+10;
    k=i+10;
    hamalc1(1,j-1:j)=hamalc(1,k);
    
end

hamlc1=zeros(1,50);
hamlc1(1,1:10)=hamlc(1,1:10);
for i=1:20
    j=(2*i)+10;
    k=i+10;
    hamlc1(1,j-1:j)=hamlc(1,k);
    
end

hamaic1=zeros(1,50);
hamaic1(1,1:10)=hamaic(1,1:10);
for i=1:19
    j=(2*i)+10;
    k=i+10;
    hamaic1(1,j-1:j)=hamaic(1,k);
    
end
hamaic1(1,49:50)=[hamaic(1,29),hamaic(1,29)];
hamaic1=sort(hamaic1);

hamic1=zeros(1,50);
hamic1(1,1:10)=hamic(1,1:10);
for i=1:19
    j=(2*i)+10;
    k=i+10;
    hamic1(1,j-1:j)=hamic(1,k);
    
end
hamic1(1,49:50)=[hamic(1,29),hamic(1,29)];



[m,n]=size(data);


%d=n-round(n/2);
input=data;

[m,n]=size(input);
label=input(:,n);
input(:,n)=[];
[m,n]=size(input);

%---------data Normalization-------------
input = normalize(input,'range');




% TRADER Optimization
nob=21;
not=7;
[best,hamtrader,hamatrader] = jTRADER(input,label,nob,not,d,noi);

%WCC OPTIMIZATION
nteam=21;
no=3;
[bestf,hamwcc,hamawcc] = jWCC(input,label,nteam,no,d,noi);
hamwcc(1,50)=hamwcc(1,49);

% Binary Particle Swarm Optimization
N = 10; 
c1= 2; 
c2= 2;  
[bestfp,hampso,hamapso] = jBPSO(input,label,N,d,noi,c1,c2);

    
% Plot convergence curve
subplot(3,3,7);
plot(1:noi,hamtrader,'r-',1:noi,hamwcc,'b-',1:noi,hampso,'g-',1:noi,hamlc1,'m-',1:noi,hamic1,'k-'); 
xlabel('Number of Iterations');
ylabel('Accuracy');
legend('Trader','WCC', 'PSO','LCA','ICA','Location','northwest');
hold on;
figure

subplot(3,3,7);

plot(1:noi,hamatrader,'r-',1:noi,hamawcc,'b-',1:noi,hamapso,'g-',1:noi,hamalc1,'m-',1:noi,hamaic1,'k-'); 
xlabel('Number of Iterations');
ylabel(' Corelation');
legend('Trader','WCC', 'PSO','LCA','ICA','Location','northwest')
hold on;


%---------select best feature-------
bestt=best(1,1:d);
fprintf('\n best accuracy TRADER: %2.2f%%\n',best(1,d+3));
fprintf('best feature:\n');
fprintf('%d ,',best);

bestw=bestf(1,1:d);
fprintf('\n best accuracy WCC: %2.2f%%\n',bestf(1,d+3));
fprintf('best feature:\n');
fprintf('%d ,',bestf);

bestp=bestfp(1,1:d);
fprintf('\n best accuracy BPSO: %2.2f%%\n',bestfp(1,d+3));
fprintf('best feature:\n');
fprintf('%d ,',bestfp);


tp=0.8;
sv='-s 0 -q';
%---------clasification------------
fprintf('\n ----TRADER-----:\n');
%pre1=svms( input,label,bestt);
pre1=svmscore2(best,input,label,tp,sv);

fprintf('\n ----WCC-----:\n');
%pre2=svms( input,label,bestw);
pre2=svmscore2(bestf,input,label,tp,sv);

fprintf('\n ----PSO-----:\n');
%pre3=svms( input,label,bestp);
pre3=svmscore2(bestfp,input,label,tp,sv);
fprintf('\n ----LCA-----:\n');
%pre3=svms( input,label,bestp);
pre4=svmscore2(bestlc,input,label,tp,sv);
fprintf('\n ----ICA-----:\n');
%pre3=svms( input,label,bestp);
pre5=svmscore2(bestic,input,label,tp,sv);

%------------voting------------------

[a,b]=size(pre1);
resul=zeros(a,7);
resul=[pre1,pre2(:,2),pre3(:,2),pre4(:,2),pre5(:,2)];
A=unique(resul);
predec=zeros(a,1);
for i=1:a
    
    R = histc(resul(i,:),A);
    if R(1,1)>=3
        predec(i,1)=A(1,1);
    else 
        predec(i,1)=A(2,1);
    end
        
end
resul=[resul,predec];
y_test=resul(:,1);
prediction=predec;
result=[y_test,prediction];
[k,order] = confusionmat(y_test,prediction);
figure
cm = confusionchart(y_test,prediction, ...
    'Title','confusion ', ...
    'RowSummary','row-normalized', ...
    'ColumnSummary','column-normalized');
accu=sum( prediction== y_test)/numel(y_test);
fprintf('\n voting accuracy: %2.2f%%\n',accu*100);

[ sen,spc,pro,acc] = svmscoreselect(y_test,prediction);
fprintf('\n accuracy: %2.2f%%\n',acc*100);
fprintf('\n sensitivity: %2.2f%%\n',sen*100);
fprintf('\n specificity: %2.2f%%\n',spc*100);
fprintf('\n precision: %2.2f%%\n',pro*100);
resul