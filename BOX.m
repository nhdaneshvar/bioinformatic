clc
close
clear all

subplot(3,3,1)
load('res\SHD\paytr');
load('res\SHD\payw');
load('res\SHD\payp');
load('res\SHD\payic.txt');
load('res\SHD\paylc.txt');

TR=paytr(1,1:30);
WCC=payw(1,1:30);
PSO=payp(1,1:30);
LCA=paylc(1,1:30);
ICA=payic(1,1:30);

box=[TR;WCC;LCA;PSO;ICA]';
boxplot(box,'Labels',{'Trader','WCC','LCA','PSO','ICA'});

subplot(3,3,2)
load('res\HEP\paytr');
load('res\HEP\payw');
load('res\HEP\payp');
load('res\HEP\payic.txt');
load('res\HEP\paylc.txt');

TR=paytr(1,1:30);
WCC=payw(1,1:30);
PSO=payp(1,1:30);
LCA=paylc(1,1:30);
ICA=payic(1,1:30);

box=[TR;WCC;LCA;PSO;ICA]';
boxplot(box,'Labels',{'Trader','WCC','LCA','PSO','ICA'});

subplot(3,3,3)
load('res\PAR\paytr');
load('res\PAR\payw');
load('res\PAR\payp');
load('res\PAR\payic.txt');
load('res\PAR\paylc.txt');

TR=paytr(1,1:30);
WCC=payw(1,1:30);
PSO=payp(1,1:30);
LCA=paylc(1,1:30);
ICA=payic(1,1:30);

box=[TR;WCC;LCA;PSO;ICA]';
boxplot(box,'Labels',{'Trader','WCC','LCA','PSO','ICA'});

subplot(3,3,4)
load('res\WDBC\paytr');
load('res\WDBC\payw');
load('res\WDBC\payp');
load('res\WDBC\payic.txt');
load('res\WDBC\paylc.txt');

TR=paytr(1,1:30);
WCC=payw(1,1:30);
PSO=payp(1,1:30);
LCA=paylc(1,1:30);
ICA=payic(1,1:30);

box=[TR;WCC;LCA;PSO;ICA]';
boxplot(box,'Labels',{'Trader','WCC','LCA','PSO','ICA'});

subplot(3,3,5)
load('res\LUNG\paytr');
load('res\LUNG\payw');
load('res\LUNG\payp');
load('res\LUNG\payic.txt');
load('res\LUNG\paylc.txt');

TR=paytr(1,1:30);
WCC=payw(1,1:30);
PSO=payp(1,1:30);
LCA=paylc(1,1:30);
ICA=payic(1,1:30);

box=[TR;WCC;LCA;PSO;ICA]';
boxplot(box,'Labels',{'Trader','WCC','LCA','PSO','ICA'});

subplot(3,3,6)
load('res\ARRYTM\paytr');
load('res\ARRYTM\payw');
load('res\ARRYTM\payp');
load('res\ARRYTM\payic.txt');
load('res\ARRYTM\paylc.txt');

TR=paytr(1,1:30);
WCC=payw(1,1:30);
PSO=payp(1,1:30);
LCA=paylc(1,1:30);
ICA=payic(1,1:30);

box=[TR;WCC;LCA;PSO;ICA]';
boxplot(box,'Labels',{'Trader','WCC','LCA','PSO','ICA'});

subplot(3,3,7)
load('res\PARKINSON\paytr');
load('res\PARKINSON\payw');
load('res\PARKINSON\payp');
load('res\PARKINSON\payic.txt');
load('res\PARKINSON\paylc.txt');

TR=paytr(1,1:30);
WCC=payw(1,1:30);
PSO=payp(1,1:30);
LCA=paylc(1,1:30);
ICA=payic(1,1:30);

box=[TR;WCC;LCA;PSO;ICA]';
boxplot(box,'Labels',{'Trader','WCC','LCA','PSO','ICA'});

subplot(3,3,8)
load('res\ARCENE\paytr');
load('res\ARCENE\payw');
load('res\ARCENE\payp');
load('res\ARCENE\payic.txt');
load('res\ARCENE\paylc.txt');

TR=paytr(1,1:30);
WCC=payw(1,1:30);
PSO=payp(1,1:30);
LCA=paylc(1,1:30);
ICA=payic(1,1:30);

box=[TR;WCC;LCA;PSO;ICA]';
boxplot(box,'Labels',{'Trader','WCC','LCA','PSO','ICA'});

subplot(3,3,9)
load('res\GEEN\paytr');
load('res\GEEN\payw');
load('res\GEEN\payp');
load('res\GEEN\payic.txt');
load('res\GEEN\paycl.txt');

TR=paytr(1,1:30);
WCC=payw(1,1:30);
PSO=payp(1,1:30);
LCA=paycl(1,1:30);
ICA=payic(1,1:30);

box=[TR;WCC;LCA;PSO;ICA]';
boxplot(box,'Labels',{'Trader','WCC','LCA','PSO','ICA'});