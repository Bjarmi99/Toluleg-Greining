%% Problem 9 maybe we don't need these initial values since we are comparing to problems in 8
clear all; close all; clc;

L1=2; L2=2; m1=1; m2=1;T=20;

y0 = [pi/3;0;pi/6;0]; %Initial values like in problem 7
%rand á upphafsgildin max og min pi/2
n = 100;
T = 20;

[error,n_vec] = RK_calc_errors(y0, n, T, L1, L2, m1, m2);

% Do best fit on errors on loglog plot
coefficients = polyfit(log(n_vec),log(error),1);
y1 = polyval(coefficients,log(n_vec));

plot(log(n_vec),log(error),'*')
hold on
plot(log(n_vec),y1)
xl = xlim;
yl = ylim;
xt = 0.7 * (xl(2)-xl(1)) + xl(1);
yt = 0.75 * (yl(2)-yl(1)) + yl(1);
caption = sprintf('y = %.2f * x + %.2f', coefficients(1), coefficients(2));
text(xt, yt, caption, 'FontSize', 9, 'Color', 'k');
ylabel('log(Error)')
xlabel('log(n)')
legend('Errors','Fitted line')


%% 9.1


%can do like this: (rand-0.5)*pi where rand is a random number between 0-1

%for example 100 different random initial values and use them for 7
%different n's get the slope for each random initial values (10 slopes) and
%show it on a histogram (distribution of the slopes)
%%%% OR %%%%
%Input different theta values and get all the slopes and analyse what gives
%the best, worst...... easier to analyse this says Olivier

y0 = [pi/2;0;pi/2;0];


[error,n_vec] = RK_calc_errors(y0, n, T, L1, L2, m1, m2);


% Do best fit on errors on loglog plot
coefficients = polyfit(log(n_vec),log(error),1);
y1 = polyval(coefficients,log(n_vec));

plot(log(n_vec),log(error),'*')
hold on
plot(log(n_vec),y1)
xl = xlim;
yl = ylim;
xt = 0.7 * (xl(2)-xl(1)) + xl(1);
yt = 0.75 * (yl(2)-yl(1)) + yl(1);
caption = sprintf('y = %.2f * x + %.2f', coefficients(1), coefficients(2));
text(xt, yt, caption, 'FontSize', 9, 'Color', 'k');
ylabel('log(Error)')
xlabel('log(n)')
legend('Errors','Fitted line')


%% 9.2
y0 = [pi/2;0;pi/6;0];


[error,n_vec] = RK_calc_errors(y0, n, T, L1, L2, m1, m2);


% Do best fit on errors on loglog plot
coefficients = polyfit(log(n_vec),log(error),1);
y1 = polyval(coefficients,log(n_vec));

plot(log(n_vec),log(error),'*')
hold on
plot(log(n_vec),y1)
xl = xlim;
yl = ylim;
xt = 0.7 * (xl(2)-xl(1)) + xl(1);
yt = 0.75 * (yl(2)-yl(1)) + yl(1);
caption = sprintf('y = %.2f * x + %.2f', coefficients(1), coefficients(2));
text(xt, yt, caption, 'FontSize', 9, 'Color', 'k');
ylabel('log(Error)')
xlabel('log(n)')
legend('Errors','Fitted line')

%% 9.3

y0 = [pi/1.5;0;pi/6;0];

[error,n_vec] = RK_calc_errors(y0, n, T, L1, L2, m1, m2);

% Do best fit on errors on loglog plot
coefficients = polyfit(log(n_vec),log(error),1);
y1 = polyval(coefficients,log(n_vec));

plot(log(n_vec),log(error),'*')
hold on
plot(log(n_vec),y1)
xl = xlim;
yl = ylim;
xt = 0.7 * (xl(2)-xl(1)) + xl(1);
yt = 0.75 * (yl(2)-yl(1)) + yl(1);
caption = sprintf('y = %.2f * x + %.2f', coefficients(1), coefficients(2));
text(xt, yt, caption, 'FontSize', 9, 'Color', 'k');
ylabel('log(Error)')
xlabel('log(n)')
legend('Errors','Fitted line')

%% 9.4

y0 = [pi/3;0;pi/4;0];

[error,n_vec] = RK_calc_errors(y0, n, T, L1, L2, m1, m2);

% Do best fit on errors on loglog plot
coefficients = polyfit(log(n_vec),log(error),1);
y1 = polyval(coefficients,log(n_vec));

plot(log(n_vec),log(error),'*')
hold on
plot(log(n_vec),y1)
xl = xlim;
yl = ylim;
xt = 0.7 * (xl(2)-xl(1)) + xl(1);
yt = 0.75 * (yl(2)-yl(1)) + yl(1);
caption = sprintf('y = %.2f * x + %.2f', coefficients(1), coefficients(2));
text(xt, yt, caption, 'FontSize', 9, 'Color', 'k');
ylabel('log(Error)')
xlabel('log(n)')
legend('Errors','Fitted line')
%% 9.6 (like part 6 in 8)

y0 = [pi/3;0;pi;0];

[error,n_vec] = RK_calc_errors(y0, n, T, L1, L2, m1, m2);

% Do best fit on errors on loglog plot
coefficients = polyfit(log(n_vec),log(error),1);
y1 = polyval(coefficients,log(n_vec));

plot(log(n_vec),log(error),'*')
hold on
plot(log(n_vec),y1)
xl = xlim;
yl = ylim;
xt = 0.7 * (xl(2)-xl(1)) + xl(1);
yt = 0.75 * (yl(2)-yl(1)) + yl(1);
caption = sprintf('y = %.2f * x + %.2f', coefficients(1), coefficients(2));
text(xt, yt, caption, 'FontSize', 9, 'Color', 'k');
ylabel('log(Error)')
xlabel('log(n)')
legend('Errors','Fitted line')

%% 9.7

y0 = [pi;0;pi;0];

[error,n_vec] = RK_calc_errors(y0, n, T, L1, L2, m1, m2);

% Do best fit on errors on loglog plot
coefficients = polyfit(log(n_vec),log(error),1);
y1 = polyval(coefficients,log(n_vec));

plot(log(n_vec),log(error),'*')
hold on
plot(log(n_vec),y1)
xl = xlim;
yl = ylim;
xt = 0.7 * (xl(2)-xl(1)) + xl(1);
yt = 0.75 * (yl(2)-yl(1)) + yl(1);
caption = sprintf('y = %.2f * x + %.2f', coefficients(1), coefficients(2));
text(xt, yt, caption, 'FontSize', 9, 'Color', 'k');
ylabel('log(Error)')
xlabel('log(n)')
legend('Errors','Fitted line')