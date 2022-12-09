close all; clear all; clc;
T = [69.4034,76.7259,80.6979, 104.162]; %Temperatures from the examples
m = 50;
n = 20;

Atotal = m*n; %total surface area
A = [0,5*2/Atotal*100,10*10/Atotal*100,30*10/Atotal*100];

plot(A,T, 'linewidth', 1.5)

xlabel('Notchsize im comparision with the total surface area [%]')
ylabel('Temperature [°C]')