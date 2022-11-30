%% Problem 9
clear all; close all; clc;

L1=2; L2=2; m1=1; m2=1;T=20;

y0 = [pi/3;0;pi/6;0];
n = 100;
n_theo = 10000;
T = 20;

%[approx_val] = RK_calc_errors(y0, n, T, L1, L2, m1, m2);
[t y] = RK_method_double_pendulum(y0,n,T,L1,L2,m1,m2);
pos = get_double_pendulum_pos(y,L1,L2);
