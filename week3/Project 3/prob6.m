%% Problem 6
close all; clear all; clc;
P = 5; %W
H = 0.005; %W/cm^2 * C°
K = 1.68; %W/cm^2 * C°
m = 40;
n = 20; %values from Problem 4
Lx = 4;
Ly = 4;
L = 2;

counter = 1;
for i = 0:n/2
    [A,b] = set_up_the_matrix(m,n,P,H,K,L,Lx,Ly,i);
    v = (A\b)+20;
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
plot(0:10,v_highest(:,1),'r-o') %DOUBLE CHECK IF THIS IS CORRECT
ylabel('Temperature [C°]')
xlabel('n steps')
legend('Higest temperature of each iteration','Location','Best')
