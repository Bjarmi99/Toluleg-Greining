%% Problem 8
close all; clear all; clc;


H = 0.005; %W/cm^2 * C°
%K = 1.68; %W/cm^2 * C°
m = 40;
n = 20; %values from Problem 4
Lx = 4;
Ly = 4;
L = 2;
move = 5; %posision where the heat starts to enter

P = linspace(5,10,100);
%K = linspace(

% for j = 1:length(K)
    for i = 1:length(P)
        [A,b] = test(m,n,P(i),H,K,L,Lx,Ly,move);
        v = (A\b)+20;
        if max(v) <= 99.98
            max_P(i) = P(i);
        end

    end

    
% end

% plot(K_vec,P_vec)
max(max_P)
