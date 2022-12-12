%% Problem 9
close all; clear all; clc;
P = 5; %W
H = 0.005; %W/cm^2 * C째
K = 1.68; %W/cm^2 * C째
m = 50;
n = 20; %values from Problem 4
Lx = 4;
Ly = 4;
L = 2;
x = 10;
y = 10;
Extrernal_temp = 20;

counter = 1;
for i = 0:n/2
    [A,b] = set_up_matrix9(m,n,P,H,K,L,Lx,Ly,i, x, y);
    v = (A\b);
    for index = 1:length(v)
        if v(index) < 0.00001
            v(index) = NaN;
        else
            v(index) = v(index)+Extrernal_temp;
        end
    end
    
    v_matrix = reshape(v(1:m*n),m,n); %here we reshape from vector to matrix so it maches the X,Y boundaries
    v_matrix = v_matrix';
    v_highest(counter,1) = max(v);
    v_highest(counter,2) = i;
    
    figure
    [X,Y] = meshgrid(1:m,1:n);
    mesh(X,Y,v_matrix)
    colorbar
    %view(2)
    counter = counter + 1;
end

figure
plot(0:10,v_highest(:,1),'r-o') 
ylabel('Temperature [C�]')
xlabel('n steps')
legend('Higest temperature of each iteration','Location','Best')

%% Finding how large the power intake may be

close all; clear all; clc;
%P = 5; %W
H = 0.005; %W/cm^2 * C째
K = 1.68; %W/cm^2 * C째
m = 50;
n = 20; %values from Problem 4
Lx = 4;
Ly = 4;
L = 2;
x = 10;
y = 10;
External_temp = 20;
tol = 10^-2;
move = 5;
a = 5; %W
b = 10; %W


max_power_allowed = bisect9(a,b,tol,m,n,H,K,L,Lx,Ly,move,x,y,External_temp);

T = calc_max_temp9(m,n,max_power_allowed,H,K,L,Lx,Ly,move,x,y,External_temp)+100;
%have to add 100 to the T value since it is a midpoint (zero)

fprintf('\nThe maximum power allowed is: %.2f W\nWhich results in maximum plate temperature: %.2f캜\n',max_power_allowed,T)