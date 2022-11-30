clear all; close all; clc;

% Problem 5.1
x=[pi/12;0]; %Initial conditions
T=20;
n=500;
L = 2;

[t, y] = RK_method_single_pendulum(x,n,T);

plot_theta(t,y)
figure
plot_pendulum(y,L)

%% Problem 5.2
x=[pi/2;0]; %Initial conditions
T=20;
n=500;
L = 2;

[t, y] = RK_method_single_pendulum(x,n,T);

plot_theta(t,y)
figure
plot_pendulum(y,L)