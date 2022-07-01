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
title('(b)HEP');

subplot(3,3,3);
load('result\PAR\hamtrader');
load('result\PAR\hamwcc');
load('result\PAR\hampso');
load('result\PAR\hamic');
load('result\PAR\hamlc');


% Plot convergence curve
plot(1:noi,hamtrader,'r-',1:noi,hamwcc,'b-',1:noi,hamlc1,'m-',1:noi,hampso,'g-',1:noi,hamic1,'k-'); 
xlabel('Number of Iterations');
ylabel('Accuracy');
title('(c)PAR');

subplot(3,3,4);
load('result\WDBC\hamtrader');
load('result\WDBC\hamwcc');
load('result\WDBC\hampso');
load('result\WDBC\hamic');
load('result\WDBC\hamlc');


% Plot convergence curve
plot(1:noi,hamtrader,'r-',1:noi,hamwcc,'b-',1:noi,hamlc1,'m-',1:noi,hampso,'g-',1:noi,hamic1,'k-'); 
xlabel('Number of Iterations');
ylabel('Accuracy');
title('(d)WDBC');

subplot(3,3,5);
load('result\LUNG\hamtrader');
load('result\LUNG\hamwcc');
load('result\LUNG\hampso');
load('result\LUNG\hamic');
load('result\LUNG\hamlc');


% Plot convergence curve
plot(1:noi,hamtrader,'r-',1:noi,hamwcc,'b-',1:noi,hamlc1,'m-',1:noi,hampso,'g-',1:noi,hamic1,'k-'); 
xlabel('Number of Iterations');
ylabel('Accuracy');
title('(e)LUNG');

subplot(3,3,6);
load('result\ARRYTM\hamtrader');
load('result\ARRYTM\hamwcc');
load('result\ARRYTM\hampso');
load('result\ARRYTM\hamic');
load('result\ARRYTM\hamlc');


% Plot convergence curve
plot(1:noi,hamtrader,'m-',1:noi,hamwcc,'b-',1:noi,hamlc1,'r-',1:noi,hampso,'g-',1:noi,hamic1,'k-'); 
xlabel('Number of Iterations');
ylabel('Accuracy');
title('(f)ARRYTM');

subplot(3,3,7);
load('result\PARKINSON\hamtrader');
load('result\PARKINSON\hamwcc');
load('result\PARKINSON\hampso');
load('result\PARKINSON\hamic');
load('result\PARKINSON\hamlc');


% Plot convergence curve
plot(1:noi,hamtrader,'r-',1:noi,hamwcc,'b-',1:noi,hamlc1,'m-',1:noi,hampso,'g-',1:noi,hamic1,'k-'); 
xlabel('Number of Iterations');
ylabel('Accuracy');
title('(g)PARKINSON');

subplot(3,3,8);
load('result\ARCENE\hamtrader');
load('result\ARCENE\hamwcc');
load('result\ARCENE\hampso');
load('result\ARCENE\hamic');
load('result\ARCENE\hamlc');


% Plot convergence curve
plot(1:noi,hamtrader,'r-',1:noi,hamwcc,'b-',1:noi,hamlc1,'m-',1:noi,hampso,'g-',1:noi,hamic1,'k-'); 
xlabel('Number of Iterations');
ylabel('Accuracy');
title('(h)ARCENE');

subplot(3,3,9);
load('result\GEEN\hamtrader');
load('result\GEEN\hamwcc');
load('result\GEEN\hampso');
load('result\GEEN\hamic');
load('result\GEEN\hamlc');


% Plot convergence curve
plot(1:noi,hamtrader,'k-',1:noi,hamwcc,'b-',1:noi,hamlc1,'m-',1:noi,hampso,'g-',1:noi,hamic1,'r-'); 
xlabel('Number of Iterations');
ylabel('Accuracy');
title('(i)GEEN');