function [error n_vec] = RK_calc_errors(y0,n,T,L1,L2,m1,m2);
n_theoretical = 30000;
[t y_true_val] = RK_method_double_pendulum(y0,n_theoretical,T,L1,L2,m1,m2);
y_true_val = y_true_val';

true_val = y_true_val(end,:);
for i = 1:7
    [t y] = RK_method_double_pendulum(y0,n,T,L1,L2,m1,m2);
    y = y';
    
    error(i) = norm(y(end,:) - true_val);
    n_vec(i) = n;
%     max_theta1_val = y(n+1,1);
%     max_theta2_val = y(n+1,3);
%     error1(i,1) = abs(max_theta1_val-max_theta1_theoretical);
%     error2(i,1) = abs(max_theta1_val-max_theta2_theoretical);
    n = n*2;  
end




end