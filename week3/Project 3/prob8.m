%% Problem 8
close all; clear all; clc;

H = 0.005;
m = 40;
n = 20; %values from Problem 4
Lx = 4;
Ly = 4;
L = 2;
move = 5; %posision where the heat starts to enter
a = 5; %minimum power
b = 12; %maximum power
tol = 10^-2;

K = linspace(1,5,25);

for j = 1:length(K)
    max_power_allowed = bisect3(a,b,tol,m,n,H,K(j),L,Lx,Ly,move);
    T = calc_max_temp(m,n,max_power_allowed,H,K(j),L,Lx,Ly,move)+100;
    P_vec(j) = max_power_allowed;
    K_vec(j) = K(j); 
end


plot(K_vec,P_vec,'LineWidth',1.5)
ylabel('Maximum Power allowed [W]')
xlabel('Thermal Conductivity of material (K)')

