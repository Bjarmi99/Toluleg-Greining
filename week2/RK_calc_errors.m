function [error n_vec] = RK_calc_errors(y0,n,T,L1,L2,m1,m2);
n_theoretical = 30000; %many intervals so very precise values 
[t y_true_val] = RK_method_double_pendulum(y0,n_theoretical,T,L1,L2,m1,m2); %y_true_val is the true value (theoretical)
y_true_val = y_true_val'; %transpose the vectors

true_val = y_true_val(end,:); %we take the last line and all the colums to get the biggest error
for i = 1:7
    [t y] = RK_method_double_pendulum(y0,n,T,L1,L2,m1,m2);
    y = y'; %transpose the vector
    error(i) = norm(y(end,:) - true_val); %error of the norm of the all the final values of the thetas
    n_vec(i) = n; % keep all the different n values that are used
    n = n*2;  
end




end