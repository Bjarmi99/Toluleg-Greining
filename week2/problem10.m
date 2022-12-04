%% problem 10   Run for different initial values and analyse 
close all; clear all;clc;

L1=2; L2=2; m1=1; m2=1;T=50;

y0 = [pi/30;0;pi/30;0];   %almost a perfect rectangle
n = 10000;


[t y] = RK_method_double_pendulum(y0,n,T,L1,L2,m1,m2);
animated_curve(y,n,T) %we need to call n and T for the FrameRate 
%plot_double_pendulum(y,L1,L2,n,T) %we need to call n and T for the FrameRate


%We can see that it is filling this rectangle it is nearly always going the
%same path but nearly neaver in exactly his old paths or in the end he nearly does go exactly in his path.... 

%% 10.1a    %increase theta2
y0 = [pi/30;0;pi/10;0];

[t y] = RK_method_double_pendulum(y0,n,T,L1,L2,m1,m2);
animated_curve(y,n,T) %we need to call n and T for the FrameRate

%% 10.1b    %increase theta2 more
y0 = [pi/30;0;pi/2;0];

[t y] = RK_method_double_pendulum(y0,n,T,L1,L2,m1,m2);
animated_curve(y,n,T) %we need to call n and T for the FrameRate

%% 10.2a   %increase theta1
y0 = [pi/10;0;pi/30;0];

[t y] = RK_method_double_pendulum(y0,n,T,L1,L2,m1,m2);
animated_curve(y,n,T) %we need to call n and T for the FrameRate

%% 10.2b    %increase theta1 more
y0 = [pi/2;0;pi/30;0];

[t y] = RK_method_double_pendulum(y0,n,T,L1,L2,m1,m2);
animated_curve(y,n,T) %we need to call n and T for the FrameRate

%% 10.3   %bigger angles
y0 = [pi/3;0;pi/6;0]; 

[t y] = RK_method_double_pendulum(y0,n,T,L1,L2,m1,m2);
animated_curve(y,n,T) %we need to call n and T for the FrameRate

%% 10.4     
y0 = [pi/1.5;0;pi/6;0];

[t y] = RK_method_double_pendulum(y0,n,T,L1,L2,m1,m2);
animated_curve(y,n,T) %we need to call n and T for the FrameRate

%% 10.5     
y0 = [pi/3;0;pi/3;0];

[t y] = RK_method_double_pendulum(y0,n,T,L1,L2,m1,m2);
animated_curve(y,n,T) %we need to call n and T for the FrameRate

%% 10.6
y0 = [pi/3;0;pi;0];

[t y] = RK_method_double_pendulum(y0,n,T,L1,L2,m1,m2);
animated_curve(y,n,T) %we need to call n and T for the FrameRate

%% 10.7     
y0 = [pi;0;pi/2;0];

[t y] = RK_method_double_pendulum(y0,n,T,L1,L2,m1,m2);
animated_curve(y,n,T) %we need to call n and T for the FrameRate
%plot_double_pendulum(y,L1,L2,n,T) %we need to call n and T for the FrameRate

