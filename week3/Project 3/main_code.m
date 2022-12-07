close all; clear all; clc;
m = 10;
n = 10;

[A,b] = set_up_matrix(m,n);

v = (A\b)+20;
plot(v)

% x = 2:m-1;
% y = 1:n
% [X,Y] = meshgrid(1:m,1:n);
%reshape

%mesh(X,Y,v)