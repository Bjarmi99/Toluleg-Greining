%% Problem 4
close all; clear all; clc;

m = 100;
n = 100;

[A,b] = set_up_matrix(m,n);

v = (A\b)+20;
v_matrix = reshape(v(1:m*n),m,n); %here we reshape from vector to matrix so it maches the X,Y boundaries

[X,Y] = meshgrid(1:m,1:n);


mesh(X,Y,v_matrix)
colorbar

refrence_val = v_matrix(1,1); %keep the refrence value for comparision


%% Compare the values to refrence value
 
m = 10;
n = 10;
for i = 1:9
    for j = 1:9
        [A,b] = set_up_matrix(m,n);
        v = (A\b)+20;
        v_matrix = reshape(v(1:m*n),m,n);
        compare_vec(j,i) = abs(v_matrix(1,1) - refrence_val);
        
        n = n+10;
    end
    m = m+10;
    n = 10;
end

