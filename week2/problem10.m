%% problem 10
close all; clear all;clc;

L1=2; L2=2; m1=1; m2=1;T=50;

y0 = [pi/3;0;pi/6;0];
n = 1000;


[t y] = RK_method_double_pendulum(y0,n,T,L1,L2,m1,m2);
animated_curve(y)

%We can see that it is filling this rectangle it is nearly always going the
%same path but nearly neaver in exactly his old paths .... 

%% Run for different initial values and analyse

