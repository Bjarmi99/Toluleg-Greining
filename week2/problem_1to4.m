%% Problem 3
clear all; close all; clc;
%In problem 2 the code was written, in problem 3 the initial conditions
%were set and the outcome plotted

x=[pi/12;0]; %Initial conditions
T=20;
n=500;
L=2;
[t, y]=Euler_func_multi(x,n,T); %This is an approximation, here there is no friction so the angle should be just a constant wave, but because this is an approximation and euler method is not accurate is shows like the wave is increasing....


plot_theta(t,y)%plot theta
hold off
plot_pendulum(y,L,n,T) %plot the pendulum, we need to call n and T for the FrameRate


%THE FOLLOWING CODE CAN BE UNCOMMENTED TO LOOK AT THE PLOTS WHEN n=1000
% [t1,y1]=Euler_func_multi(x,1000,T)
% plot_theta(t1,y1)%plot theta
% hold off
% figure
% plot_pendulum(y1,L,n,T) %plot the pendulum


%% Problem 4
clear all; close all; clc;


x=[pi/2;0]; %Initial conditions
T=20;
n=500;
L=2;

[t,y]=Euler_func_multi(x,n,T);

plot_theta(t,y)%plot theta
hold off
%figure % we don't need figure here because we open figure in plot_pendulum
plot_pendulum(y,L,n,T) %plot the pendulum, we need to call n and T for the FrameRate


%THE FOLLOWING CODE CAN BE UNCOMMENTED TO LOOK AT THE PLOTS WHEN n=1000
% [t1,y1]=Euler_func_multi(x,1000,T)
% plot_theta(t1,y1)%plot theta
% hold off
% figure
% plot_pendulum(y1,L,n,T) %plot the pendulum






