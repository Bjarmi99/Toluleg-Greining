%% Problem 7 
clear all; close all; clc;
L1=2; L2=2; m1=1; m2=1;T=20;

y0 = [pi/3;0;pi/6;0];
n = 500;
T = 20;

[t y] = RK_method_double_pendulum(y0,n,T,L1,L2,m1,m2);
plot_double_pendulum(y,L1,L2)

%% Problem 8 part 1
%Here we look at the effect of making the initial position being horizontal
%(theta1 = theta2)

y0 = [pi/2;0;pi/2;0]; 
[t y] = RK_method_double_pendulum(y0,n,T,L1,L2,m1,m2);
plot_double_pendulum(y,L1,L2)

%% Problem 8 part 2
%Here we look at the effect of making the initial position of theta 1 being
%bigger than in problem 7


y0 = [pi/2;0;pi/6;0];
[t y] = RK_method_double_pendulum(y0,n,T,L1,L2,m1,m2);
plot_double_pendulum(y,L1,L2)

%% Problem 8 part 3
%Here we look at the effect of making the initial position of theta 1 being
%even bigger than in problem 8 part 2


y0 = [pi/1.5;0;pi/6;0];
[t y] = RK_method_double_pendulum(y0,n,T,L1,L2,m1,m2);
plot_double_pendulum(y,L1,L2)

%% Problem 8 part 4
%Here we look at the effect of making the initial position of theta 2 being
% bigger than in problem 7


y0 = [pi/3;0;pi/4;0];
[t y] = RK_method_double_pendulum(y0,n,T,L1,L2,m1,m2);
plot_double_pendulum(y,L1,L2)

%% Problem 8 part 5
%Here we look at the effect of making the initial position of theta 2 being
% even bigger than in problem 8 part 4


y0 = [pi/3;0;pi/2;0];
[t y] = RK_method_double_pendulum(y0,n,T,L1,L2,m1,m2);
plot_double_pendulum(y,L1,L2)

%Note it has less effect on the motion (chaos in the trajectories) increasing theta2 than increasing
%theta1

%% Problem 8 part 6
%Here we look at the effect of making the initial position of theta 2 being
% even bigger than in problem 8 part 5


y0 = [pi/3;0;pi;0];
[t y] = RK_method_double_pendulum(y0,n,T,L1,L2,m1,m2);
plot_double_pendulum(y,L1,L2)

%Note it has less effect on the motion (chaos in the trajectories) increasing theta2 than increasing
%theta1


