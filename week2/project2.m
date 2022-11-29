clear all; close all; clc;

x=[pi/12;0]; %Initial conditions
T=20;
n=500;
L=2
[t, y]=Euler_func_multi(x,n,T); 

plot_theta(t,y)%plot theta
hold off
figure
plot_pendulum(y,L) %plot the pendulum


%THE FOLLOWING CODE CAN BE UNCOMMENTED TO LOOK AT THE PLOTS WHEN n=1000
% [t1,y1]=Euler_func_multi(x,1000,T)
% plot_theta(t1,y1)%plot theta
% hold off
% figure
% plot_pendulum(y1,L) %plot the pendulum

% %now we draw the animation, it is supposed to stay in a constant
% %oscillation but because it is an approximation method then the oscillation
% %is alway increasing

%% Problem 4
clear all; close all; clc;


x=[pi/2;0]; %Initial conditions
T=20;
n=500;
L=2;

[t,y]=Euler_func_multi(x,n,T)

plot_theta(t,y)%plot theta
hold off
figure
plot_pendulum(y,L) %plot the pendulum


%THE FOLLOWING CODE CAN BE UNCOMMENTED TO LOOK AT THE PLOTS WHEN n=1000
% [t1,y1]=Euler_func_multi(x,1000,T)
% plot_theta(t1,y1)%plot theta
% hold off
% figure
% plot_pendulum(y1,L) %plot the pendulum


%% Problem 5
clear all; close all; clc;



