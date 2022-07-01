clc, clear, close 
% Benchmark data set 

noi=50;
subplot(3,3,1);
load('result\SHD\hamatrader');
load('result\SHD\hamawcc');
load('result\SHD\hamapso');
load('result\SHD\hamaic');
load('result\SHD\hamalc');


% Plot convergence curve
plot(1:noi,hamatrader,'r-',1:noi,hamawcc,'b-',1:noi,hamalc1,'m-',1:noi,hamapso,'g-',1:noi,hamaic1,'k-'); 
xlabel('Number of Iterations');
ylabel('Accuracy');
legend('Trader','WCC', 'LCA','PSO','ICA','Location','northwest');
title('(a)SHD');

subplot(3,3,2);
load('result\HEP\hamatrader');
load('result\HEP\hamawcc');
load('result\HEP\hamapso');
load('result\HEP\hamaic');
load('result\HEP\hamalc');


% Plot convergence curve
plot(1:noi,hamatrader,'r-',1:noi,hamawcc,'b-',1:noi,hamalc1,'m-',1:noi,hamapso,'g-',1:noi,hamaic1,'k-'); 
xlabel('Number of Iterations');
ylabel('Accuracy');
title('(b)HEP');

subplot(3,3,3);
load('result\PAR\hamatrader');
load('result\PAR\hamawcc');
load('result\PAR\hamapso');
load('result\PAR\hamaic');
load('result\PAR\hamalc');


% Plot convergence curve
plot(1:noi,hamatrader,'r-',1:noi,hamawcc,'b-',1:noi,hamalc1,'m-',1:noi,hamapso,'g-',1:noi,hamaic1,'k-'); 
xlabel('Number of Iterations');
ylabel('Accuracy');
title('(c)PAR');

subplot(3,3,4);
load('result\WDBC\hamatrader');
load('result\WDBC\hamawcc');
load('result\WDBC\hamapso');
load('result\WDBC\hamaic');
load('result\WDBC\hamalc');


% Plot convergence curve
plot(1:noi,hamatrader,'r-',1:noi,hamawcc,'b-',1:noi,hamalc1,'m-',1:noi,hamapso,'g-',1:noi,hamaic1,'k-'); 
xlabel(' Iterations');
ylabel('Correlation');
title('(d)WDBC');

subplot(3,3,5);
load('result\LUNG\hamatrader');
load('result\LUNG\hamawcc');
load('result\LUNG\hamapso');
load('result\LUNG\hamaic');
load('result\LUNG\hamalc');


% Plot convergence curve
plot(1:noi,hamatrader,'r-',1:noi,hamawcc,'b-',1:noi,hamalc1,'m-',1:noi,hamapso,'g-',1:noi,hamaic1,'k-'); 
xlabel('Number of Iterations');
ylabel('Accuracy');
title('(e)LUNG');

subplot(3,3,6);
load('result\ARRYTM\hamatrader');
load('result\ARRYTM\hamawcc');
load('result\ARRYTM\hamapso');
load('result\ARRYTM\hamaic');
load('result\ARRYTM\hamalc');


% Plot convergence curve
plot(1:noi,hamatrader,'r-',1:noi,hamawcc,'b-',1:noi,hamalc1,'m-',1:noi,hamapso,'g-',1:noi,hamaic1,'k-'); 
xlabel(' Iterations');
ylabel('Correlation');
title('(f)ARRYTM');

subplot(3,3,7);
load('result\PARKINSON\hamatrader');
load('result\PARKINSON\hamawcc');
load('result\PARKINSON\hamapso');
load('result\PARKINSON\hamaic');
load('result\PARKINSON\hamalc');


% Plot convergence curve
plot(1:noi,hamatrader,'r-',1:noi,hamawcc,'b-',1:noi,hamalc1,'m-',1:noi,hamapso,'g-',1:noi,hamaic1,'k-'); 
xlabel(' Iterations');
ylabel('Correlation');
title('(g)PARKINSON');

subplot(3,3,8);
load('result\ARCENE\hamatrader');
load('result\ARCENE\hamawcc');
load('result\ARCENE\hamapso');
load('result\ARCENE\hamaic');
load('result\ARCENE\hamalc');


% Plot convergence curve
plot(1:noi,hamatrader,'r-',1:noi,hamawcc,'b-',1:noi,hamalc1,'m-',1:noi,hamapso,'g-',1:noi,hamaic1,'k-'); 
xlabel(' Iterations');
ylabel('Correlation');
title('(h)ARCENE');

subplot(3,3,9);
load('result\GEEN\hamatrader');
load('result\GEEN\hamawcc');
load('result\GEEN\hamapso');
load('result\GEEN\hamaic');
load('result\GEEN\hamalc');


% Plot convergence curve
plot(1:noi,hamatrader,'m-',1:noi,hamawcc,'b-',1:noi,hamalc1,'r-',1:noi,hamapso,'g-',1:noi,hamaic1,'k-'); 
xlabel(' Iterations');
ylabel('Correlation');
title('(i)GEEN');