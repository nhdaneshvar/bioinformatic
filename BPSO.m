

%-------------------------------------------------------------------%
%  Binary Particle Swarm Optimization (BPSO) demo version           %
%-------------------------------------------------------------------%


%---Input------------------------------------------------------------
% feat     : feature vector (instances x features)
% label    : label vector (instances x 1)
% N        : Number of particles
% max_Iter : Maximum number of iterations
% c1       : Cognitive factor
% c2       : Social factor

%---Output-----------------------------------------------------------
% sFeat    : Selected features 
% Sf       : Selected feature index
% Nf       : Number of selected features
% curve    : Convergence curve
%--------------------------------------------------------------------


%% Binary Particle Swarm Optimization 
clc, clear, close 
% Benchmark data set 
load('data2/CHD2');
[m,n]=size(data);

%----------5fold-----------
k=5;
fold=zeros(m,k);
nog=fix(m/k);
for i=1:k
    fold((i-1)*nog+1:nog*i,i)=1;
end

[F1,I]=sort(fold(:,1));
dataF1=data(I,:);
[F1,I]=sort(fold(:,2));
dataF2=data(I,:);
[F1,I]=sort(fold(:,3));
dataF3=data(I,:);
[F1,I]=sort(fold(:,4));
dataF4=data(I,:);
[F1,I]=sort(fold(:,5));
dataF5=data(I,:);

feat=data;

[m,n]=size(feat);
label=feat(:,n);
feat(:,n)=[];
[m,n]=size(feat);

%---------data Normalization-------------
input = normalize(feat,'range');

d=6;
%d=n-round(n/2);
% Parameter setting
N        = 10; 
noi = 10;
c1       = 2; 
c2       = 2; 
% Binary Particle Swarm Optimization 
[Sf,hampso,hamapso] = jBPSO(feat,label,N,d,noi,c1,c2);

% Plot convergence curve
plot(1:noi,hampso); 
xlabel('Number of Iterations');
ylabel('Accuracy');
title('BPSO'); grid on;
figure
plot(1:noi,hamapso); 
xlabel('Number of Iterations');
ylabel(' Corelation');
title('BPSO'); grid on;



%---------select best feature-------

bestf=Sf(1,1:d);
fprintf('best accuracy: %2.2f%%\n',Sf(1,d+3));
fprintf('best feature:\n');
fprintf('%d ,',bestf);

%---------clasification------------
pre=svms( feat,label,bestf);
