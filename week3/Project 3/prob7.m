%% Problem 7
close all; clear all; clc;


H = 0.005; %W/cm^2 * C°
K = 1.68; %W/cm^2 * C°
m = 40;
n = 20; %values from Problem 4
Lx = 4;
Ly = 4;
L = 2;
move = 5; %posision where the heat starts to enter

P = linspace(8,9,1000);

for i = 1:length(P)
    [A,b] = test(m,n,P(i),H,K,L,Lx,Ly,move);
    v = (A\b)+20;
    if max(v) <= 100
        max_P(i) = P(i);
    end 
end

[A,b] = test(m,n,max(max_P),H,K,L,Lx,Ly,move);
v = (A\b)+20;
max(v)

%PRINT THE MAX TEMP AND THE MAX P WE GOT
% DO A PLOT ALSO.... TEMP ON Y AXIS AND POWER ON X AXIS
