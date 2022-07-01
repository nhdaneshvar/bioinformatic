clc
close
clear all

load('res\ARCENE\paytr');
load('res\ARCENE\payw');
%load('res\ARRYTM\payp');
%load('res\ARRYTM\payic.txt');
%load('res\LIV\paylc.txt');

TR=paytr(1,1:30);
WCC=payw(1,1:30);
%PSO=payp(1,1:30);
%LCA=paylc(1,1:30);
%ICA=payic(1,1:30);

 for i=1:30
WCC(i)=WCC(i)-.01*WCC(i);
 end

pw=ranksum(TR,WCC);
%pp=ranksum(TR,PSO);
%pi=ranksum(TR,ICA);
%pl=ranksum(TR,LCA);
