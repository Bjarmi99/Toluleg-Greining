%% small n
close all; clear all; clc;
T = 1;
n = 2;
h = T/n;


y1 = 1;
yn = -1;

A = zeros(n,n);
b = zeros(n,1);
b(1) = y1;
b(n) = yn;

%boundaries
A(1,1)=1;
A(n,n)=1;

for i= 2:n-1
    A(i,i-1:i+1)=[1 -(2+h^2) 1]; %This starts in line i and puts the values in the vector in the colums specified (i-1, i and i+1)
end

x = linspace(0,1,n); %for approximation
x_real = linspace(0,1,1000); %for the real solution


for j = 1:length(x_real)
y_real(j) = -0.5820*exp(x_real(j)) + 1.5820*exp(-x_real(j));
end


y = A\b;
subplot(2,1,1)
plot(x,y,'r')
hold on 
plot(x_real,y_real,'b')
title(['n = ',num2str(n)]) %prints the title with each n used
legend('approximate', 'real')


%% bigger n
n = 20;
T = 1;

h = T/n;


y1 = 1;
yn = -1;

A = zeros(n,n);
b = zeros(n,1);
b(1) = y1;
b(n) = yn;

%boundaries
A(1,1)=1;
A(n,n)=1;

for i= 2:n-1
    A(i,i-1:i+1)=[1 -(2+h^2) 1]; %This starts in line i and puts the values in the vector in the colums specified (i-1, i and i+1)
end

x = linspace(0,1,n); %for approximation
x_real = linspace(0,1,1000); %for the real solution


for j = 1:length(x_real)
y_real(j) = -0.5820*exp(x_real(j)) + 1.5820*exp(-x_real(j));
end

y = A\b;

subplot(2,1,2)
plot(x,y,'r')
hold on 
plot(x_real,y_real,'b')
title(['n = ',num2str(n)]) %prints the title with each n used
legend('approximate', 'real')
