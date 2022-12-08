%% Problem 8
close all; clear all; clc;

H = 0.005; %W/cm^2 * C�
m = 40;
n = 20; %values from Problem 4
Lx = 4;
Ly = 4;
L = 2;
move = 5; %posision where the heat starts to enter

P = linspace(6,12,25);
K = linspace(1,5,25);

for j = 1:length(K)
    for i = 1:length(P)
        [A,b] = test(m,n,P(i),H,K(j),L,Lx,Ly,move);
        v = (A\b)+20;
        if max(v) < 100
            max_P = P(i);
            max(v)
        end  
    end
    P_vec(j) = max_P;
    K_vec(j) = K(j); 
end

plot(K_vec,P_vec)

