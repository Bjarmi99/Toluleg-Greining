%% Problem 11 SHOWING THE GRAPHICAL REPRESENTATION
close all; clear all; clc;

L1=2; L2=2; m1=1; m2=1;
y0 = [2*pi/3;0;pi/6;0];
n = 2000;
T = 40;

[t1 y1] = RK_method_double_pendulum(y0,n,T,L1,L2,m1,m2);

for k = 1:5
y00 = [(2*pi/3)+10^(-k); 0; (pi/6)+10^(-k); 0]; 
[t2 y2] = RK_method_double_pendulum(y00,n,T,L1,L2,m1,m2);

plot_chaos_double_pendulum(y1,y2,L1,L2,n,T)
end

%% Showing the theta with respect to time % and mean displacement lika
close all; clear all; clc;

L1=2; L2=2; m1=1; m2=1;
y0 = [2*pi/3;0;pi/6;0];
n = 2000;
T = 40;

[t1 y1] = RK_method_double_pendulum(y0,n,T,L1,L2,m1,m2);

y1 = y1';
for k = 1:5
y00 = [(2*pi/3)+10^(-k); 0; (pi/6)+10^(-k); 0]; 
[t2 y2] = RK_method_double_pendulum(y00,n,T,L1,L2,m1,m2);
y2=y2';

figure
subplot(2,1,1)
plot(t1,abs(y1(:,1)-y2(:,1)),'r','LineWidth',1.2) % plotting the difference between the actual theta2 value and the theta2 with the epsilon error
ylabel('Displacement on \theta_1 angles')
xlabel('Time interval length (T)')
legend('\theta_1 - (\theta_1 + \epsilon)','Location','best')
xlim([0 40])

subplot(2,1,2)
plot(t2,abs(y1(:,3)-y2(:,3)),'LineWidth',1.2) % plotting the difference between the actual theta2 value and the theta2 with the epsilon error
ylabel('Displacement on \theta_2 angles')
xlabel('Time interval length (T)')
legend('\theta_2 - (\theta_2 + \epsilon)','Location','best')
xlim([0 40])
end

