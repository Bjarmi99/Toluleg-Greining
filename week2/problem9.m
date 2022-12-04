%% 9.1
clear all; close all; clc;

L1=2; L2=2; m1=1; m2=1;T=20;

n = 100;
T = 20;
y0 = [pi/2;0;pi/2;0];


[error,n_vec] = RK_calc_errors(y0, n, T, L1, L2, m1, m2);


% Do best fit on errors on loglog plot
coefficients = polyfit(log(n_vec),log(error),1);
y1 = polyval(coefficients,log(n_vec));

plot(log(n_vec), log(error), "r*")
hold on
plot(log(n_vec),y1,'r')
xl = xlim;
yl = ylim;
xt = 0.7 * (xl(2)-xl(1)) + xl(1);
yt = 0.75 * (yl(2)-yl(1)) + yl(1);
caption_1 = sprintf('y_1 = %.2f * x + %.2f', coefficients(1), coefficients(2));
%text(xt, yt, caption, 'FontSize', 9, 'Color', 'k');
ylabel('log(Error)')
xlabel('log(n)')
legend('Errors','Fitted line')


%% 9.2
y0 = [pi/2;0;pi/6;0];


[error,n_vec] = RK_calc_errors(y0, n, T, L1, L2, m1, m2);


% Do best fit on errors on loglog plot
coefficients = polyfit(log(n_vec),log(error),1);
y1 = polyval(coefficients,log(n_vec));

plot(log(n_vec),log(error),"g*")
hold on
plot(log(n_vec),y1,'g')
xl = xlim;
yl = ylim;
xt = 0.7 * (xl(2)-xl(1)) + xl(1);
yt = 0.75 * (yl(2)-yl(1)) + yl(1);
caption_2 = sprintf('y_2 = %.2f * x + %.2f', coefficients(1), coefficients(2));
%text(xt, yt, caption, 'FontSize', 9, 'Color', 'k');
ylabel('log(Error)')
xlabel('log(n)')
%legend('Errors','Fitted line')

%% 9.3

y0 = [pi/1.5;0;pi/6;0];

[error,n_vec] = RK_calc_errors(y0, n, T, L1, L2, m1, m2);

% Do best fit on errors on loglog plot
coefficients = polyfit(log(n_vec),log(error),1);
y1 = polyval(coefficients,log(n_vec));

plot(log(n_vec),log(error),'b*')
hold on
plot(log(n_vec),y1,'b')
xl = xlim;
yl = ylim;
xt = 0.7 * (xl(2)-xl(1)) + xl(1);
yt = 0.75 * (yl(2)-yl(1)) + yl(1);
caption_3 = sprintf('y_3 = %.2f * x + %.2f', coefficients(1), coefficients(2));
%text(xt, yt, caption, 'FontSize', 9, 'Color', 'k');
ylabel('log(Error)')
xlabel('log(n)')
%legend('Errors','Fitted line')

%% 9.4

y0 = [pi/3;0;pi/4;0];

[error,n_vec] = RK_calc_errors(y0, n, T, L1, L2, m1, m2);

% Do best fit on errors on loglog plot
coefficients = polyfit(log(n_vec),log(error),1);
y1 = polyval(coefficients,log(n_vec));

plot(log(n_vec),log(error),"m*")
hold on
plot(log(n_vec),y1,'m')
xl = xlim;
yl = ylim;
xt = 0.7 * (xl(2)-xl(1)) + xl(1);
yt = 0.75 * (yl(2)-yl(1)) + yl(1);
caption_4 = sprintf('y_4 = %.2f * x + %.2f', coefficients(1), coefficients(2));
%text(xt, yt, caption, 'FontSize', 9, 'Color', 'k');
ylabel('log(Error)')
xlabel('log(n)')
%legend('Errors','Fitted line', caption_4)
%% 9.5 (like part 5 in 8)

y0 = [pi/3;0;pi;0];

[error,n_vec] = RK_calc_errors(y0, n, T, L1, L2, m1, m2);

% Do best fit on errors on loglog plot
coefficients = polyfit(log(n_vec),log(error),1);
y1 = polyval(coefficients,log(n_vec));

plot(log(n_vec),log(error),"c*")
hold on
plot(log(n_vec),y1,"c")
xl = xlim;
yl = ylim;
xt = 0.7 * (xl(2)-xl(1)) + xl(1);
yt = 0.75 * (yl(2)-yl(1)) + yl(1);
caption_5 = sprintf('y_5 = %.2f * x + %.2f', coefficients(1), coefficients(2));
%text(xt, yt, caption_5, 'FontSize', 9, 'Color', 'k');%
ylabel('log(Error)')
xlabel('log(n)')
%legend('Errors','Fitted line',caption_5)

%% 9.6

% y0 = [pi;0;pi;0];
% 
% [error,n_vec] = RK_calc_errors(y0, n, T, L1, L2, m1, m2);
% 
% % Do best fit on errors on loglog plot
% coefficients = polyfit(log(n_vec),log(error),1);
% y1 = polyval(coefficients,log(n_vec));
% 
% plot(log(n_vec),log(error),'*')
% hold on
% plot(log(n_vec),y1)
xl = xlim;
yl = ylim;
xt = 0.7 * (xl(2)-xl(1)) + xl(1);
yt = 0.75 * (yl(2)-yl(1)) + yl(1);
%caption_6 = sprintf('y_6 = %.2f * x + %.2f', coefficients(1), coefficients(2));
%text(xt, yt, caption, 'FontSize', 9, 'Color', 'k'); %caption,
ylabel('log(Error)')
xlabel('log(n)')
legend('Error 1', caption_1, 'Error 2', caption_2, 'Error 3', caption_3, 'Error 4', caption_4, 'Error 5', caption_5)