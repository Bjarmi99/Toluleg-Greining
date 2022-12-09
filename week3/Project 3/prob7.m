%% Problem 7 with bisection method
close all; clear all; clc;


H = 0.005; %W/cm^2 * C°
K = 1.68; %W/cm^2 * C°
m = 40;
n = 20; %values from Problem 4
Lx = 4;
Ly = 4;
L = 2;
move = 5; %posision where the heat starts to enter
a = 5; %minimum power
b = 10; %maximum power
tol = 10^-2;

max_power_allowed = bisect3(a,b,tol,m,n,H,K,L,Lx,Ly,move);

T = calc_max_temp(m,n,max_power_allowed,H,K,L,Lx,Ly,move)+100;
%have to add 100 to the T value since it is a midpoint (zero)

fprintf('\nThe maximum power allowed is: %.3f W\nWhich results in maximum plate temperature: %.3f°C\n',max_power_allowed,T)


