%% small n
close all;clear all;clc;
T = 1;
n = 10;
h = T/n;
y1 = [-3 4 -1];
yn = [-1 4 -3];

A = zeros(n,n);
b = zeros(n,1);
b(1) = 0;
b(n) = -2*h;


for i = 1:3
   A(1,i) = y1(i);
end

A(n,n-2:n) = yn;


for i= 2:n-1
    A(i,i-1:i+1)=[1 -(2+h^2) 1]; %This starts in line i and puts the values in the vector in the colums specified (i-1, i and i+1)
end

x = linspace(0,1,n);
x_real = linspace(0,1,1000); %for the real solution

for j = 1:length(x_real)
y_real(j) = 0.4255*exp(x_real(j)) + 0.4255*exp(-x_real(j));
end


y = A\b;
subplot(2,1,1)
plot(x,y,'r')
hold on 
plot(x_real,y_real,'b')
title(['n = ',num2str(n)]) %prints the title with each n used
legend('approximate', 'real')

%% big n

T = 1;
n = 100;
h = T/n;
y1 = [-3 4 -1];
yn = [-1 4 -3];

A = zeros(n,n);
b = zeros(n,1);
b(1) = 0;
b(n) = -2*h;


for i = 1:3
   A(1,i) = y1(i);
end

A(n,n-2:n) = yn;


for i= 2:n-1
    A(i,i-1:i+1)=[1 -(2+h^2) 1]; %This starts in line i and puts the values in the vector in the colums specified (i-1, i and i+1)
end

x = linspace(0,1,n);
x_real = linspace(0,1,1000); %for the real solution

for j = 1:length(x_real)
y_real(j) = 0.4255*exp(x_real(j)) + 0.4255*exp(-x_real(j));
end


y = A\b;

subplot(2,1,2)
plot(x,y,'r')
hold on 
plot(x_real,y_real,'b')
title(['n = ',num2str(n)]) %prints the title with each n used
legend('approximate', 'real')
