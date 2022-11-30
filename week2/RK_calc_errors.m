function [approx_value] = RK_calc_errors(y0,n,T,L1,L2,m1,m2);
% [t y] = RK_method_double_pendulum(y0,n,T,L1,L2,m1,m2);
% [t y_true_val] = RK_method_double_pendulum(y0,n,T,L1,L2,m1,m2);
%n_theo = 10000;
%approx_value = zeros(7,1)

for i = 1:7
    [t y] = RK_method_double_pendulum(y0,n,T,L1,L2,m1,m2);
    %approx_value(i,1) = T/n;
    approx_value(:,i) = y(1,:);
    n = n*2; 
end




end