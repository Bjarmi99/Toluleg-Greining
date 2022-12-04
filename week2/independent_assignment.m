%% 1. Independent assignment NORMAL
close all; clear all; clc;

L1=2; L2=2; m1=1; m2=1;T=50;

y0 = [pi/3;0;pi/4;0];
n = 2000;


[t y] = RK_method_double_pendulum(y0,n,T,L1,L2,m1,m2);
plot_double_pendulum(y,L1,L2,n,T) %we need to call n and T for the FrameRate
animated_curve(y,n,T)


%% 2. Independent assignment with L1 longer than L2
close all; clear all; clc;

L1=4; L2=2; m1=1; m2=1;T=50;

y0 = [pi/3;0;pi/4;0];
n = 2000;


[t y] = RK_method_double_pendulum(y0,n,T,L1,L2,m1,m2);
plot_double_pendulum(y,L1,L2,n,T) %we need to call n and T for the FrameRate
animated_curve(y,n,T)


%% 3. Independent assignment with L2 longer than L1
close all; clear all; clc;

L1=2; L2=4; m1=1; m2=1;T=50;

y0 = [pi/3;0;pi/4;0];
n = 2000;


[t y] = RK_method_double_pendulum(y0,n,T,L1,L2,m1,m2);
plot_double_pendulum(y,L1,L2,n,T) %we need to call n and T for the FrameRate
animated_curve(y,n,T) %we need to call n and T for the FrameRate


%% 4. Independent assignment with L1 longer than L2 AND m1 has more weight than m2
close all; clear all; clc;

L1=4; L2=2; m1=50; m2=1;T=50;

y0 = [pi/3;0;pi/4;0];
n = 5000;


[t y] = RK_method_double_pendulum(y0,n,T,L1,L2,m1,m2);
plot_double_pendulum(y,L1,L2,n,T) %we need to call n and T for the FrameRate
animated_curve(y,n,T)


%% 5. Independent assignment with L2 longer than L1 AND m2 has more weight than m1
close all; clear all; clc;

L1=2; L2=4; m1=1; m2=50;T=50;

y0 = [pi/3;0;pi/4;0];
n =5000;


[t y] = RK_method_double_pendulum(y0,n,T,L1,L2,m1,m2);
plot_double_pendulum(y,L1,L2,n,T) %we need to call n and T for the FrameRate
animated_curve(y,n,T) %we need to call n and T for the FrameRate


