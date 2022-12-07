%% Problem 6
close all; clear all; clc;

m = 50;
n = 20; %values from Problem 4
Lx = 4;
Ly = 4;

L = 2; %cm
% for i = 0:0.1:4
%  
[A,b] = set_up_matrix5(m,n,L,Lx,Ly);

v = (A\b)+20;
v_matrix = reshape(v(1:m*n),m,n); %here we reshape from vector to matrix so it maches the X,Y boundaries
v_matrix = v_matrix';

