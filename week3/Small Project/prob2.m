close all; clear all; clc;
T = 1;
n = 10;
h = T/n;

y1 = 1;
yn = -1;

A = zeros(n,n);
b = zeros(n,1);
b(1) = y1;
b(n) = yn;


%boundary
A(1,1)=1;
A(n,n)=1;



for i= 2:n-1
    A(i,i-1:i+1)=[1 -(2+h^2) 1]; %This starts in line i and puts the values in the vector in the colums specified (i-1, i and i+1)
end

y_real = -0.5820*exp(1) + 1.5820*exp(-1);
y = A\b;

plot(y,'r')
hold on 
plot(y_real,'b')
legend('approximate', 'real')
