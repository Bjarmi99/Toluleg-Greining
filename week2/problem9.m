%% Problem 9
clear all; close all; clc;

L1=2; L2=2; m1=1; m2=1;T=20;

y0 = [pi/3;0;pi/6;0];
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

ylabel('log(Error)')
xlabel('log(n)')
legend('Errors','Fitted line')

%% Do for random initial values but don't let the angles go over pi/2 and under -pi/2

%can do like this: (rand-0.5)*pi where rand is a random number between 0-1

%for example 10 different random initial values and use them for 7
%different n's get the slope for each random initial values (10 slopes) and
%show it on a histogram (distribution of the slopes)
%%%% OR %%%%
%Input different theta values and get all the slopes and analyse what gives
%the best, worst...... easier to analyse this says Olivier
