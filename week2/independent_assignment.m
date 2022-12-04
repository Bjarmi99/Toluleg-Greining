%% Independent assignment NORMAL
close all; clear all; clc;

L1=2; L2=2; m1=1; m2=1;T=50;

y0 = [pi/3;0;pi/4;0];
n = 2000;


[t y] = RK_method_double_pendulum(y0,n,T,L1,L2,m1,m2);
plot_double_pendulum(y,L1,L2,n,T) %we need to call n and T for the FrameRate
animated_curve(y,n,T)

%HERE IS A DEMONSTRATION ON HOW THE DOUBLE PENDULUM BEHAVES IF THE INITIAL VALUES ARE THE SAME AS IN EXAMPLE 8.4?
%AND THE MOVEMENT IS NOT VERY CHAOTIC AND SINCE THE INITIAL ANGLE IS NOT TO
%BIG THE MOVEMENT IS PREDICTABLE

%IN THE NEXT EMAPLES WE ALLWAYS USE THE SAME INITIAL VALUES ON THE POSITION
%% Independent assignment with L1 longer than L2
close all; clear all; clc;

L1=4; L2=2; m1=1; m2=1;T=50;

y0 = [pi/3;0;pi/4;0];
n = 2000;


[t y] = RK_method_double_pendulum(y0,n,T,L1,L2,m1,m2);
plot_double_pendulum(y,L1,L2,n,T) %we need to call n and T for the FrameRate
animated_curve(y,n,T)

%HERE THE MOVEMENT OF THE PENDULUM IS SHOWN WITH THE L1 LONGER THAN L2.
%THE MOVEMENT OF THE DOUBLE PENDULUM IS NOT AS CHAOTIC AS THE PENDULUM WITH 
%THE NORMAL INITIAL VALUES AND IS VERY PERIODIC AS SHOWN IN THE GRAPH
%(NEARLY GOES ALLWAS IN THE SAME PATH)


%% Independent assignment with L2 longer than L1
close all; clear all; clc;

L1=2; L2=4; m1=1; m2=1;T=50;

y0 = [pi/3;0;pi/4;0];
n = 2000;


[t y] = RK_method_double_pendulum(y0,n,T,L1,L2,m1,m2);
plot_double_pendulum(y,L1,L2,n,T) %we need to call n and T for the FrameRate
animated_curve(y,n,T) %we need to call n and T for the FrameRate

%HERE THE MOVEMENT OF THE PENDULUM IS SHOWN WITH THE L2 LONGER THAN L1. THE
%MOVEMENT OF THE DOUBLE PENDULU BECOMES MORE CHAOTIC THAN IF L1 IS LONGER
%THAN THE L2 BUT STILL IT IS PREDICTABLE AND HAS A NICE PERIODIC MOVEMENT
%AS SHOWN IN THE GRAPH (ANIMATED CURVE)

%% Independent assignment with L1 longer than L2 AND m1 has more weight than m2
close all; clear all; clc;

L1=4; L2=2; m1=50; m2=1;T=50;

y0 = [pi/3;0;pi/4;0];
n = 5000;


[t y] = RK_method_double_pendulum(y0,n,T,L1,L2,m1,m2);
plot_double_pendulum(y,L1,L2,n,T) %we need to call n and T for the FrameRate
animated_curve(y,n,T)

%MORE CHAOS HAPPENS AND THE LOWER PENDULUM GOES IN MANY CIRCLES MORE
%UNPREDICTABLE...

%% Independent assignment with L2 longer than L1 AND m2 has more weight than m1
close all; clear all; clc;

L1=2; L2=4; m1=1; m2=50;T=50;

y0 = [pi/3;0;pi/4;0];
n =5000;


[t y] = RK_method_double_pendulum(y0,n,T,L1,L2,m1,m2);
plot_double_pendulum(y,L1,L2,n,T) %we need to call n and T for the FrameRate
animated_curve(y,n,T) %we need to call n and T for the FrameRate

%PERIODIC AND TRYES TO BE LIKE A STICK WITH NO LEGAMENT....