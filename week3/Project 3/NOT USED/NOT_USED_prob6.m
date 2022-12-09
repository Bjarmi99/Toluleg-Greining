%% Problem 6
close all; clear all; clc;

m = 50;
n = 20; %values from Problem 4
Lx = 4;
Ly = 4;
<<<<<<< Updated upstream
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
=======
L = 2;

%L = 0; %cm
counter = 1;
for i = 0:10
    [A,b] = test(m,n,L,Lx,Ly,i);
    v = (A\b)+20;
    v_matrix = reshape(v(1:m*n),m,n); %here we reshape from vector to matrix so it maches the X,Y boundaries
    v_matrix = v_matrix';
    v_highest(counter,1) = max(v);
    v_highest(counter,2) = i;
    
    figure
    [X,Y] = meshgrid(1:m,1:n);
    mesh(X,Y,v_matrix)
    colorbar
    view(2)
    counter = counter + 1;
end
>>>>>>> Stashed changes

figure
plot(0:10,v_highest(:,1))
