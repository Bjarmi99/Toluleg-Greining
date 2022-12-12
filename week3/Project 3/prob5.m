close all; clear all; clc;
m = 50;
n = 20; %values from Problem 4
L = 2; %cm
Lx = 4;
Ly = 4;
 
[A,b] = set_up_matrix5(m,n,L,Lx,Ly);

v = (A\b)+20;
v_matrix = reshape(v(1:m*n),m,n); %here we reshape from vector to matrix so it maches the X,Y boundaries
v_matrix = v_matrix';
[X,Y] = meshgrid(1:m,1:n);


mesh(X,Y,v_matrix)
colorbar
%view(2)
highest_temp = v_matrix(1,1);
fprintf('\nThe highest temperature is: %.4f\n',highest_temp)