%% Problem 12 - TIME INTERVAL LENGTH
close all; clear all; clc;

L1=2; L2=2; m1=1; m2=1;
y0 = [2*pi/3;0;pi/6;0];
n = 2000;
T = 45;

[t1 y1] = RK_method_double_pendulum(y0,n,T,L1,L2,m1,m2);

y1 = y1';
counter = 1;

for k = 1:12
    y00 = [(2*pi/3)+10^(-k); 0; (pi/6)+10^(-k); 0]; 
    [t2 y2] = RK_method_double_pendulum(y00,n,T,L1,L2,m1,m2);
    y2=y2';
    
    for i = 1:length(y2(:,1))
        if abs(y1(i,3)-y2(i,3)) > 0.1 %there is always a minor displacement so we decided to detect when the displacement of the angles is more than 0.1
            time_vec(counter) = t2(i);
            counter = counter + 1;
            break;
        end 
    end
    k_vec(k) = k;
end


plot(k_vec,time_vec,'k*','LineWidth',2)
grid on
xlabel('k')
ylabel('T')
legend('Displacement of the pendulums at time interval T','Location','Best')

%% PROBLEM 12 - METHOD PRECISION (CHANGING THE VALUE OF N)
close all; clear all; clc;

L1=2; L2=2; m1=1; m2=1;
y0 = [2*pi/3;0;pi/6;0];
n = [1000 10000 50000 100000]; 
T = 45;


counter = 1;
for j = 1:4
    [t1 y1] = RK_method_double_pendulum(y0,n(j),T,L1,L2,m1,m2); % Pendulum nr 1
    y1 = y1';
    for k = 1:12
        y00 = [(2*pi/3)+10^(-k); 0; (pi/6)+10^(-k); 0]; %Pendulum nr 2
        [t2 y2] = RK_method_double_pendulum(y00,n(j),T,L1,L2,m1,m2);
        y2=y2';

        for i = 1:length(y2(:,1))
            if abs(y1(i,3)-y2(i,3)) > 0.1 %there is always a minor displacement so we decided to detect when the displacement of the angles is more than 0.1
                time_vec(counter) = t2(i);
                counter = counter + 1;
                break;
            end 
        end
        k_vec(k) = k;
    end
    subplot(2,2,j)
    plot(k_vec, time_vec,'k*','LineWidth',2) 
    counter = 1;
    grid on
    xlabel('k')
    ylabel('T')
    legend('Displacement of the pendulums at time interval T','Location','Best')
    title(['n = ',num2str(n(j))]) %prints the title with each n used
end




%% Problem 12 - WITH DIFFERENT INITIAL POSITIONS
close all; clear all; clc;

L1=2; L2=2; m1=1; m2=1;
y0 = [pi/2 0 pi/6 0 ; pi/2 0 pi/2 0 ; pi 0 pi/2 0; 1.1*pi 0 pi 0]';
n = 2000;
T = 40;


counter = 1;
for j = 1:4
[t1 y1] = RK_method_double_pendulum(y0(:,j),n,T,L1,L2,m1,m2);
y1 = y1';
    for k = 1:12
        y00 = [(y0(1,j))+10^(-k); 0; (y0(3,j))+10^(-k); 0]; 
        [t2 y2] = RK_method_double_pendulum(y00,n,T,L1,L2,m1,m2);
        y2=y2';
        k_vec(k) = k;
        if k == 12
            displacement_vec(counter) = abs(y2(end,3)-y1(end,3))
        end
        
    end
    counter = counter + 1;
end

