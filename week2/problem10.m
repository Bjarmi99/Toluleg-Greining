%% problem 10 maybe not use these initial values 
close all; clear all;clc;

L1=2; L2=2; m1=1; m2=1;T=50;

y0 = [pi/3;0;pi/6;0];
n = 10000;


[t y] = RK_method_double_pendulum(y0,n,T,L1,L2,m1,m2);
animated_curve(y)

%We can see that it is filling this rectangle it is nearly always going the
%same path but nearly neaver in exactly his old paths or in the end he nearly does go exactly in his path.... 

%% 10.1    Run for different initial values and analyse (do same as values in problem 8 and 9)
y0 = [pi/2;0;pi/2;0];

[t y] = RK_method_double_pendulum(y0,n,T,L1,L2,m1,m2);
animated_curve(y)

%% 10.2
y0 = [pi/2;0;pi/6;0]; 

[t y] = RK_method_double_pendulum(y0,n,T,L1,L2,m1,m2);
animated_curve(y)

%% 10.3
y0 = [pi/1.5;0;pi/6;0];

[t y] = RK_method_double_pendulum(y0,n,T,L1,L2,m1,m2);
animated_curve(y)

%% 10.4
y0 = [pi/3;0;pi/4;0];

[t y] = RK_method_double_pendulum(y0,n,T,L1,L2,m1,m2);
animated_curve(y)

%% 10.6
y0 = [pi/3;0;pi;0];

[t y] = RK_method_double_pendulum(y0,n,T,L1,L2,m1,m2);
animated_curve(y)

%% 10.7
y0 = [pi;0;pi;0];

[t y] = RK_method_double_pendulum(y0,n,T,L1,L2,m1,m2);
animated_curve(y)