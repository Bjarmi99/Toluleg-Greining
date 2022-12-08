%% Problem 6
close all; clear all; clc;

m = 50;
n = 20; %values from Problem 4
Lx = 4;
Ly = 4;
Ly1 = 0;
k = Ly/(n-1);
L = 2; 
P=k*9;%cm
for i = 0:k:P
    Ly1 = Ly1 + i;
    [A,b] = set_up_matrix6(m,n,L,Lx,Ly, Ly1);
    v = (A\b)+20;
    v_matrix = reshape(v(1:m*n),m,n); %here we reshape from vector to matrix so it maches the X,Y boundaries
    v_matrix = v_matrix';
    [X,Y] = meshgrid(1:m,1:n);
    Ly1 = 0;

    mesh(X,Y,v_matrix)
    colorbar

    highest_temp = max(v);
    fprintf('\nThe highest temperature is: %.4f',highest_temp)

end

% for i = 0:0.1:4
%  


% v = (A\b)+20;
% v_matrix = reshape(v(1:m*n),m,n); %here we reshape from vector to matrix so it maches the X,Y boundaries
% v_matrix = v_matrix';

