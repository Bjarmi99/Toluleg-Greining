%% Problem 11 SHOWING THE GRAPHICAL REPRESENTATION when k=1
close all; clear all; clc;

L1=2; L2=2; m1=1; m2=1;
y0 = [2*pi/3;0;pi/6;0];
n = 2000;
T = 40;

[t1 y1] = RK_method_double_pendulum(y0,n,T,L1,L2,m1,m2);

k = 1;
y00 = [(2*pi/3)+10^(-k); 0; (pi/6)+10^(-k); 0]; 
[t2 y2] = RK_method_double_pendulum(y00,n,T,L1,L2,m1,m2);

plot_chaos_double_pendulum(y1,y2,L1,L2,n,T)


%% Problem 11 SHOWING THE GRAPHICAL REPRESENTATION when k=2
close all; clear all; clc;

L1=2; L2=2; m1=1; m2=1;
y0 = [2*pi/3;0;pi/6;0];
n = 2000;
T = 40;

[t1 y1] = RK_method_double_pendulum(y0,n,T,L1,L2,m1,m2);

k = 2;
y00 = [(2*pi/3)+10^(-k); 0; (pi/6)+10^(-k); 0]; 
[t2 y2] = RK_method_double_pendulum(y00,n,T,L1,L2,m1,m2);

plot_chaos_double_pendulum(y1,y2,L1,L2,n,T)

%% Problem 11 SHOWING THE GRAPHICAL REPRESENTATION when k=3
close all; clear all; clc;

L1=2; L2=2; m1=1; m2=1;
y0 = [2*pi/3;0;pi/6;0];
n = 2000;
T = 40;

[t1 y1] = RK_method_double_pendulum(y0,n,T,L1,L2,m1,m2);

k = 3;
y00 = [(2*pi/3)+10^(-k); 0; (pi/6)+10^(-k); 0]; 
[t2 y2] = RK_method_double_pendulum(y00,n,T,L1,L2,m1,m2);

plot_chaos_double_pendulum(y1,y2,L1,L2,n,T)

%% Problem 11 SHOWING THE GRAPHICAL REPRESENTATION when k=4
close all; clear all; clc;

L1=2; L2=2; m1=1; m2=1;
y0 = [2*pi/3;0;pi/6;0];
n = 2000;
T = 40;

[t1 y1] = RK_method_double_pendulum(y0,n,T,L1,L2,m1,m2);

k = 4;
y00 = [(2*pi/3)+10^(-k); 0; (pi/6)+10^(-k); 0]; 
[t2 y2] = RK_method_double_pendulum(y00,n,T,L1,L2,m1,m2);

plot_chaos_double_pendulum(y1,y2,L1,L2,n,T)

%% Problem 11 SHOWING THE GRAPHICAL REPRESENTATION when k=5
close all; clear all; clc;

L1=2; L2=2; m1=1; m2=1;
y0 = [2*pi/3;0;pi/6;0];
n = 2000;
T = 40;

[t1 y1] = RK_method_double_pendulum(y0,n,T,L1,L2,m1,m2);

k = 5;
y00 = [(2*pi/3)+10^(-k); 0; (pi/6)+10^(-k); 0]; 
[t2 y2] = RK_method_double_pendulum(y00,n,T,L1,L2,m1,m2);

plot_chaos_double_pendulum(y1,y2,L1,L2,n,T)
