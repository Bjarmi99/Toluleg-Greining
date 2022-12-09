close all; clear all; clc;
m = 10;
n = 10;
 
[A,b] = set_up_matrix_3_4(m,n);

v = (A\b)+20;
v_matrix = reshape(v(1:m*n),m,n); %here we reshape from vector to matrix so it maches the X,Y boundaries

[X,Y] = meshgrid(1:m,1:n);

mesh(X,Y,v_matrix)
colorbar
%view(2)