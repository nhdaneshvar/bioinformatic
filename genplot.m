clc, clear, close 
% Benchmark data set 

noi=50;
subplot(3,3,1);
load('result\SHD\hamtrader');
load('result\SHD\hamwcc');
load('result\SHD\hampso');
load('result\SHD\hamic');
load('result\SHD\hamlc');


% Plot convergence curve
plot(1:noi,hamtrader,'r-',1:noi,hamwcc,'b-',1:noi,hamlc1,'m-',1:noi,hampso,'g-',1:noi,hamic1,'k-'); 
xlabel('Number of Iterations');
ylabel('Accuracy');
legend('Trader','WCC', 'LCA','PSO','ICA','Location','northwest');
title('(a)SHD');

subplot(3,3,2);
load('result\HEP\hamtrader');
load('result\HEP\hamwcc');
load('result\HEP\hampso');
load('result\HEP\hamic');
load('result\HEP\hamlc');


% Plot convergence curve
plot(1:noi,hamtrader,'r-',1:noi,hamwcc,'b-',1:noi,hamlc1,'m-',1:noi,hampso,'g-',1:noi,hamic1,'k-'); 
xlabel('Number of Iterations');
ylabel('Accuracy');
legend('Trader','WCC', 'LCA','PSO','ICA','Location','northwest');
title('(b)HEP');

