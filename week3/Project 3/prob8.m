close all; clear all; clc;
m = 50;
n = 20; %values from Problem 4
L = 2; %cm
Lx = 4;
Ly = 4;
counter = 1;
for i = 1:0.1:5 
    K = i;
    [A,b] = set_up_matrix8(m,n,L,Lx,Ly, K);
    
    v = (A\b)+20;
    v_matrix = reshape(v(1:m*n),m,n); %here we reshape from vector to matrix so it maches the X,Y boundaries
    v_matrix = v_matrix';
    [X,Y] = meshgrid(1:m,1:n);
    
    
    mesh(X,Y,v_matrix)
    colorbar
    
    highest_temp(1,counter) = max(v);
    fprintf('\nThe highest temperature is: %.4f',highest_temp);
    K = 0;
    counter = counter +1;
end

xlabel= "K [W/cm°C]";
ylabel= "Temperature in °C";
x = 1:0.1:5;
plot(x,highest_temp)