%% Problem 12 
close all; clear all; clc;

L1=2; L2=2; m1=1; m2=1;
y0 = [2*pi/3;0;pi/6;0];
n = 2000;
T = 50;

[t1 y1] = RK_method_double_pendulum(y0,n,T,L1,L2,m1,m2);

y1 = y1';
counter = 1;

for k = 1:12
    y00 = [(2*pi/3)+10^(-k); 0; (pi/6)+10^(-k); 0]; 
    [t2 y2] = RK_method_double_pendulum(y00,n,T,L1,L2,m1,m2);
    y2=y2';
    
    for i = 1:length(y2(:,1))
        if abs(y1(i,3)-y2(i,3)) > 0.1 %there is allways a minor displacement so we decided to detect when the displacement of the angles is more than 0.1
            time_vec(counter) = t2(i);
            counter = counter + 1;
            break;
        end 
    end
    k_vec(k) = k;
end


%%%%%% SHOWS AT TIME INTERVAL T WHEN THE DISPLACEMENT HAPPENS WITH RESPECT TO K

%%%%%% INTERPRET THAT K CONTROLS THE EPSILON ERROR AND SAY AS K INCREASES
%%%%%% THE EPSILON ERROR DECREASES, SO THE DISPLACEMENT OF THE PENDULUMS
%%%%%% OCCURS AT A HIGHER T AS THE EPSILON ERROR DECREASES.....
plot(k_vec,time_vec,'k*','LineWidth',2)
grid on
xlabel('k')
ylabel('T')
legend('Displacement of the pendulums at time interval T','Location','Best')

%% 
% IF WE HAVE A SMALL N THE CALCULATIONS WILL BE MORE UNRELIABLE
% SHOW HOW THE GRAPH CHANGES IF THE N IS CHANGED (CHANGE N VERY MUTCH) SHOW
% IT IN SUBPLOT MAYBE 4 DIFFERENT ONES WITH DIFFERENT N'S

% SAME WITH THE INITIAL CONDITIONS




