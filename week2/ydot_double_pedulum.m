function z = ydot_double_pedulum(t,y)
g=9.81; L=2;
z(1,:) = y(2); %From problem 1 we can see that the first line in Z_vec is equal to y_prime
z(2,:) = -g/L*sin(y(1)); %From problem 1 we can see that the second line in Z_vec is equal to this equation
%z(3,:)
%z(4,:)

end