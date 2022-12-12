close all; clear all; clc;
T = [69.4034,76.7259,80.6979, 104.162];

m = 50;
n = 20;
Lx = 4;
Ly = 4;

h = Lx/(m-1);
k = Ly/(n-1);
Atotal = 50*20; %n*m
A = [0,5*2/Atotal,10*10/Atotal,30*10/Atotal];


plot(A,T, 'linewidth', 1.5)

 xlabel('Notchsize im comparision with the total surface area [%]')
 ylabel('Temperature [°C]')