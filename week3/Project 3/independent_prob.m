%% Independent problem PART 1
close all; clear all; clc;

%H = 0.005;
K = 1.68;
m = 40;
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
xlabel('H [W/cm^{2}�C]')

%xlabel('Convective heat transfer (H [W/cm^{2}*�C])')

%%  Independent problem PART 2
close all; clear all; clc;




