%% problem 10
close all; clear all;clc;

L1=2; L2=2; m1=1; m2=1;T=20;

y0 = [pi/3;0;pi/6;0];
n = 350;
T = 20;


[t y] = RK_method_double_pendulum(y0,n,T,L1,L2,m1,m2);
animated_curve(y)


