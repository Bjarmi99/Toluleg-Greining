%% Independent problem PART 1
close all; clear all; clc;

%H = 0.005;
K = 1.68;
m = 50;
n = 20; %values from Problem 4
Lx = 4;
Ly = 4;
L = 2;
move = 5; %posision where the heat starts to enter
a = 1; %minimum power
b = 40; %maximum power
tol = 10^-2;

H = linspace(0.005,0.1,25);

for j = 1:length(H)
    max_power_allowed = bisect3(a,b,tol,m,n,H(j),K,L,Lx,Ly,move);
    T = calc_max_temp(m,n,max_power_allowed,H(j),K,L,Lx,Ly,move)+100;
    P_vec(j) = max_power_allowed;
    H_vec(j) = H(j); 
end


plot(H_vec,P_vec,'LineWidth',1.5)
axis([0.005 0.1 0 35])
ylabel('Maximum Power allowed [W]')
xlabel('H [W/cm^{2}°C]')

%xlabel('Convective heat transfer (H [W/cm^{2}*°C])')

%%  Independent problem PART 2
close all; clear all; clc;
P = 5;
H = 0.005; %W/cm^2 * C°
K = 1.68; %W/cm^2 * C°
m = 50;
n = 20; %values from Problem 4
Lx = 4;
Ly = 4;
L = 2;
move = 0; %posision where the heat starts to enter
 
[A,b] = set_up_the_matrix_independent(m,n,P,H,K,L,Lx,Ly,move);

v = (A\b)+20;
v_matrix = reshape(v(1:m*n),m,n); %here we reshape from vector to matrix so it maches the X,Y boundaries
v_matrix = v_matrix';
[X,Y] = meshgrid(1:m,1:n);


mesh(X,Y,v_matrix)
colorbar
%view(2)
highest_temp = v_matrix(1,1);
fprintf('\nThe highest temperature is: %.4f',highest_temp)




