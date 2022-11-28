%% 1
clear all; close all;clc;

x0 = [0;0;6370;0]; % starting point is north pole
A = [15600;18760;17610;19170]; % A,B, C, t are the satellite coordinates
B = [7540; 2750; 14630; 610];
C = [20140; 18610; 13480; 18390];
t = [0.07074; 0.07220; 0.07690; 0.07242];
c = 299792.458; %speed of light
tol = 10^(-3); %so we have the error in meters in stead of kilometers
n=4;

%hello
x = newtonmult(x0,tol,A,B,C,t,c,n); % x is a vector that contains x,y,z and d

fprintf('Problem 1\n\nThe location of the reciever is the following\n\nx = %.6f\ny = %.6f\nz = %.6f\n\nAnd the difference between the satellite clock and the receiver clock\nd = %.6s',x(1),x(2),x(3),x(4))

%% 2

P=26570; %km
phi=[pi/8, pi/6, pi/4, pi/2];
theta = [pi/2, pi, 3*pi/2, 2*pi];
n=4;

[A B C R t] = distance_and_time(P,phi,theta,c,n); % TO GET COORDINATES OF THE SATELLITE (A, B, C) OR THE DISTANCE (R) OR THE TIME (t)

fprintf('\nProblem 2\n\n');
fprintf('The location of the four satellites:\n')
fprintf('Satellite 1: %.2f km, %.2f km, %.2f km\n', A(1), B(1), C(1))
fprintf('Satellite 2: %.2f km, %.2f km, %.2f km\n', A(2), B(2), C(2))
fprintf('Satellite 3: %.2f km, %.2f km, %.2f km\n', A(3), B(3), C(3))
fprintf('Satellite 4: %.2f km, %.2f km, %.2f km \n\n', A(4), B(4), C(4))
fprintf('\nDistance\n');
fprintf('%.6f km\n',R);
fprintf('\nTime\n');
fprintf('%.6f sec\n',t);


%% 3
clear all; close all; clc;
c = 299792.458; %speed of light
P=26570; %km
x0 = [0;0;6370;0]; % starting point is north pole
tol2 = 10^(-9);
phi=[pi/8, pi/6, 3*pi/8, pi/4];
theta=[-pi/4, pi/2, 2*pi/3, pi/6];
n=4;

[A B C R t] = distance_and_time(P,phi,theta,c,n);


phi2=[pi/8+10^(-8), pi/6+10^(-8), 3*pi/8-10^(-8), pi/4-10^(-8)];
[A2 B2 C2 R2 t2] = distance_and_time(P,phi2,theta,c,n);

pos_new = newtonmult(x0,tol2,A2,B2,C2,t,c,n); %location with some error

total_err = norm(pos_new-x0);
fprintf('\nProblem 3\n\nThe error is: %.4s km',total_err)

%% 4
close all; clear all; clc;
c = 299792.458; %speed of light
P=26570; %km
x0 = [0;0;6370;0]; %starting point is north pole
tol2 = 10^(-9);
phi=[pi/8, pi/6, 3*pi/8, pi/4];
theta=[-pi/4, pi/2, 2*pi/3, pi/6];
n=4;


[A B C R t] = distance_and_time(P,phi,theta,c,n);
max_err = 0; sign_1=0; sign_2=0; sign_3=0; sign_4=0;
counter = 1;
for i = [-1 1]
    for j = [-1 1]
        for k = [-1 1]
            for h = [-1 1]
                phi2(counter,:)=[pi/8+(i)*10^(-8), pi/6+(j)*10^(-8), 3*pi/8+(k)*10^(-8), pi/4+(h)*10^(-8)];
                [A2 B2 C2 R2 t2] = distance_and_time(P,phi2(counter,:),theta,c,n);

                pos_new = newtonmult(x0,tol2,A2,B2,C2,t,c,n); %location with some error

                total_err(counter) = norm(pos_new-x0);
                if total_err(counter) > max_err
                    max_err = total_err(counter);
                    sign_1=i;
                    sign_2=j;
                    sign_3=k;
                    sign_4=h;
                end
                counter = counter + 1;
            end
        end
    end
end

fprintf('\nProblem 4\n\nThe maximum value for the error is: %.4s',max_err)
fprintf('\nThe sign combination that gives the maximum error is the following, where -1 and 1 represent - and +:\n%.f\n %.f\n%.f\n%.f\n',sign_1, sign_2,sign_3,sign_4)


%% 5

close all; clear all; clc;
c = 299792.458; %speed of light
P=26570; %km
x0 = [0;0;6370;0]; % starting point is north pole
tol2 = 10^(-9);
n=4;
phi=[pi/8.00000000000011, pi/6, 3*pi/8, pi/8.00000000000012];

theta=[-pi/4.00000000000011, pi/2, 2*pi/3, -pi/4.00000000000012];

[A B C R t] = distance_and_time(P,phi,theta,c,n);

phi2=[pi/8.00000000000011+10^(-8),pi/6+10^(-8), 3*pi/8-10^(-8), pi/8.00000000000012+10^(-8)];

[A2 B2 C2 R2 t2] = distance_and_time(P,phi2,theta,c,n);

pos_new = newtonmult(x0,tol2,A2,B2,C2,t,c,n); %location with some error
total_err = norm(pos_new-x0);
fprintf('\nProblem 5\n\nTotal error: %.3s', total_err)



%% 6
clear all; close all; clc;

c = 299792.458; %speed of light
P=26570; %km
x0 = [0;0;6370;0]; % starting point is north pole
tol2 = 10^(-8);
n=4;

max_err = 0;
min_err = 1;
counter = 1;

for m = 1:100
    %Calculate the values with out the error:
    nr_1 = rand; nr_2 = rand; nr_3 = rand; nr_4 = rand; nr_5 = rand; nr_6 = rand; nr_7 = rand; nr_8 = rand; %To create different random  numbers, for phi the random numbers for the correct data and wrong data still need to be the same for each satellite in each run
    phi(m,:)= [nr_1*(pi/2), nr_2*(pi/2), nr_3*(pi/2), nr_4*(pi/2)];
    theta(m,:) = [nr_5*(pi*2), nr_6*(pi*2), nr_7*(pi*2), nr_8*(pi*2)];
    [A B C R t] = distance_and_time(P,phi(m,:),theta(m,:),c,n);

    for i = [-1 1]
        for j = [-1 1]
            for k = [-1 1]
                for h = [-1 1]
                    %Calculate the values with the error:
                    phi2=[nr_1*pi/2+(i)*10^(-8), nr_2*pi/2+(j)*10^(-8), nr_3*pi/2+(k)*10^(-8), nr_4*pi/2+(h)*10^(-8)]; 
                    [A2 B2 C2 R2 t2] = distance_and_time(P,phi2,theta,c,n);
                    loc_A(counter,:) = A2;
                    loc_B(counter,:) = B2;
                    loc_C(counter,:) = C2;
                    pos_new = newtonmult(x0,tol2,A2,B2,C2,t,c,n); %location with some error
    
                    total_err(counter) = norm(pos_new-x0);
                   
                    counter = counter + 1;
                end
            end
        end
    end
    
    [val, ind] =  max(total_err); %Out of those 16 errors we want to take the maximum as the "realistic" value from those iterations
    real_total_err(m)= val;
    
    A_max(m,:) = loc_A(ind,:);
    B_max(m,:) = loc_B(ind,:);
    C_max(m,:) = loc_C(ind,:);
    
    total_err = []; loc_A=[]; loc_B=[]; loc_C=[];
end


[min_err, ind_min] = min(real_total_err);
A_min_plot = A_max(ind_min,:);
B_min_plot = B_max(ind_min,:);
C_min_plot = C_max(ind_min,:);
    
[max_err, ind_max] = max(real_total_err);
A_max_plot = A_max(ind_max,:);
B_max_plot = B_max(ind_max,:);
C_max_plot = C_max(ind_max,:);
    
avg_err= mean(real_total_err);


figure
histogram(real_total_err)
xlim([0, max(real_total_err)]);
xlabel('Errors [km]')
ylabel('Number of occurrences')

figure
[x,y,z] = sphere; % Make unit sphere
radius = 6370; % Scale to desire radius.
x = x * radius;
y = y * radius;
z = z * radius;
offset = 0;%6370;% Translate sphere to new location.
surf(x+offset,y+offset,z+offset) % Plot as surface.
xlabel('X', 'FontSize', 20);% Label axes.
ylabel('Y', 'FontSize', 20);
zlabel('Z', 'FontSize', 20);
axis equal;


for i=1:n
    hold on 
    plot3(A_max_plot(i),B_max_plot(i),C_max_plot(i), 'b.', 'MarkerSize',30)
end

for i=1:n
    hold on 
    plot3(A_min_plot(i),B_min_plot(i),C_min_plot(i), 'r.', 'MarkerSize',30)
end


leg = legend('Earth', 'Sat1_{max}', 'Sat2_{max}', 'Sat3_{max}', 'Sat4_{max}', 'Sat1_{min}', 'Sat2_{min}', 'Sat3_{min}', 'Sat4_{min}', 'Location', 'NorthEast'); 


fprintf('Problem 6:\n')
fprintf('\nThe minimum error is: %.4s km\nThe average error is: %.4s km\nThe maximum error is: %.4s km\n\n',min_err,avg_err,max_err)
fprintf('The location (A, B, C) of the four satellites when the maximum error occurred is:\n')
for i=1:n
    fprintf('Satellite %d: %.2f km, %.2f km, %.2f km\n',i, A_max_plot(i), B_max_plot(i), C_max_plot(i))
    
end

fprintf('\nThe location (A, B, C) of the four satellites when the minimum error occurred is:\n')
for i=1:n
    fprintf('Satellite %d: %.2f km, %.2f km, %.2f km\n', i, A_min_plot(i), B_min_plot(i), C_min_plot(i))
    
end




%% 7

a=0;
b=10^(-8); %We set b as the value we have been using for the measuring error of phi angle
tol=10^(-14);

xc = bisect(a,b,tol,phi,theta); %It is logical if the satellites are sending us data with an error less than 10^(-8) error so that we can get the recievers location within 10 cm.


[max_err] = bisection_error(xc,phi,theta); %Calculates what the error in the recievers location is in km

fprintf('\nProblem 7\n\nIf the measuring error of phi angle is %.2s then we get the receiver position within %.2s\n',xc, max_err) %Note that the measuring error of phi that gives this accuracy of the location of the reciever is less than 10^(-8) which makes sense.

%% 8

clear all; close all; clc;

c = 299792.458; %speed of light
P=26570; %km
x0 = [0;0;6370;0]; % starting point is north pole
tol2 = 10^(-8);

max_err = 0;
min_err = 10000000;
counter = 1;

n = 5 ; %Number of satillites
for m = 1:100
    %Calculate the values with out the error:
    for i=1:n
        phi(m,i) = rand*pi/2 ;
        theta(m,i) = rand*pi*2;
    end

    [A B C R t] = distance_and_time(P,phi(m,:),theta(m,:),c,n);
    
    for a = [-1 1]
        for j = [-1 1]
            for k = [-1 1]
                for h = [-1 1]
                    for z = [-1 1]
                        %Calculate the values with the error:
                        phi2(m,:)=[phi(m,1)+(a)*10^(-8), phi(m,2)+(j)*10^(-8), phi(m,3)+(k)*10^(-8), phi(m,4)+(h)*10^(-8), phi(m,5)+(z)*10^(-8)]; 
                        [A2 B2 C2 R2 t2] = distance_and_time(P,phi2(m,:),theta(m,:),c,n);
                        loc_A(counter,:) = A2;
                        loc_B(counter,:) = B2;
                        loc_C(counter,:) = C2;
                        
                        pos_new = Gaussnewton(x0,tol2, A2,B2,C2,t,c,n);

                        total_err(counter) = norm(pos_new-x0);
                       
                        counter = counter + 1;
                    end

                end
            end
        end
    end
    [val, ind] =  max(total_err); %Out of those 16 errors we want to take the maximum as the "realistic" value from those iterations
    real_total_err(m)= val;
    
    A_max(m,:) = loc_A(ind,:);
    B_max(m,:) = loc_B(ind,:);
    C_max(m,:) = loc_C(ind,:);
    
    total_err = []; loc_A=[]; loc_B=[]; loc_C=[];
end


[min_err, ind_min] = min(real_total_err);
A_min_plot = A_max(ind_min,:);
B_min_plot = B_max(ind_min,:);
C_min_plot = C_max(ind_min,:);
    
[max_err, ind_max] = max(real_total_err);
A_max_plot = A_max(ind_max,:);
B_max_plot = B_max(ind_max,:);
C_max_plot = C_max(ind_max,:);
    
avg_err= mean(real_total_err);


figure
histogram(real_total_err)
xlim([0, max(real_total_err)]);
xlabel('Errors [km]')
ylabel('Number of occurrences')

figure
% Make unit sphere
[x,y,z] = sphere;
% Scale to desire radius.
radius = 6370;
x = x * radius;
y = y * radius;
z = z * radius;
% Translate sphere to new location.
offset = 0;%6370;
% Plot as surface.
surf(x+offset,y+offset,z+offset) 
% Label axes.
xlabel('X', 'FontSize', 20);
ylabel('Y', 'FontSize', 20);
zlabel('Z', 'FontSize', 20);
axis equal;


for i=1:n
    hold on
    plot3(A_max_plot(i),B_max_plot(i),C_max_plot(i), 'b.', 'MarkerSize',30)     
end

for i=1:n
    hold on
    plot3(A_min_plot(i),B_min_plot(i),C_min_plot(i), 'r.', 'MarkerSize',30)
end

leg = legend('Earth', 'Sat1_{max}', 'Sat2_{max}', 'Sat3_{max}', 'Sat4_{max}','Sat5_{max}', 'Sat1_{min}', 'Sat2_{min}', 'Sat3_{min}', 'Sat4_{min}', 'Sat5_{min}', 'Location', 'NorthEast'); 


fprintf('Problem 8:')
fprintf('\nThe minimum error is: %.4s km\nThe average error is: %.4s km\nThe maximum error is: %.4s km\n\n',min_err,avg_err,max_err)
fprintf('The location of the four satellites when the maximum error occurred is:\n')

for i=1:n
    fprintf('Satellite %d: %.2f km, %.2f km, %.2f km\n',i, A_max_plot(i), B_max_plot(i), C_max_plot(i))
end

fprintf('The location of the four satellites when the minimum error occurred is:\n')
for i=1:n
    fprintf('Satellite %d: %.2f km, %.2f km, %.2f km\n', i,A_min_plot(i), B_min_plot(i), C_min_plot(i))
end



%% 9

clear all; close all; clc;

c = 299792.458; %speed of light
P=26570; %km
x0 = [0;0;6370;0]; % starting point is north pole
tol2 = 10^(-8);

max_err = 0;
min_err = 10000000000000;
A_min = 0; B_min = 0; C_min = 0; A_max = 0; B_max = 0; C_max = 0;

for n = 6:1:9 %number of satelites counting 
  
    figure
    [x,y,z] = sphere;  % Make unit sphere
    radius = 6370; % Scale to desire radius.
    x = x * radius;
    y = y * radius;
    z = z * radius;
    offset = 0;%6370;     % Translate sphere to new location.
    surf(x+offset,y+offset,z+offset) % Plot as surface.
    xlabel('X', 'FontSize', 20);
    ylabel('Y', 'FontSize', 20);
    zlabel('Z', 'FontSize', 20);
    axis equal;
    hold on
    
   
    out=ff2n(n); % creating -1,1 Matrix, 16x4 for 4 -> 512x9 for 9
    out(out==0) = -1; %replacing '0' with -1
    
    for m = 1:100
        for i=1:n %Calculate the angles with out the error:
            phi(m,i) = rand*pi/2 ;
            theta(m,i) = rand*pi*2 ;
            
        end

        [A B C R t] = distance_and_time(P,phi(m,:),theta(m,:),c,n);
        
        for k = 1: 2^n %Calculate the angles with error:
            for l = 1:n
               phi2(m,l) = phi(m,l)+10^(-8)*out(k,l); 
            end
            [A2 B2 C2 R2 t2] = distance_and_time(P,phi2(m,:),theta(m,:),c,n);
            pos_new = Gaussnewton(x0,tol2, A2,B2,C2,t,c,n);
            total_err(k,:) = norm(pos_new-x0);
            
            
            if total_err(k,:) < min_err %Keep track of the minimum error to be able to plot up the locations of the satellites when that happens
                min_err = total_err(k,:);
                A_min = A2;
                B_min = B2;
                C_min = C2;
            end

            if total_err(k,:) > max_err %Keep track of the maximum error 
                max_err = total_err(k,:);
                A_max = A2;
                B_max = B2;
                C_max = C2;
            end

        end
        
     
        maximum_vec(m,:) = max(total_err); %We want to achieve the "truest" value of all of those cominations, therefore we take the worst value
        
        
        if m==100
            if n==6
                
                maximum_vec_6 = max(maximum_vec); %We want to obtain the 3 values (max, min, ave) of the maximum vec which contains 100 values from the 100 iterations
                minimum_vec_6 = min(maximum_vec);
                average_vec_6 = mean(maximum_vec);
                for i=1:n
                    hold on
                    plot3(A_max(i),B_max(i),C_max(i), 'b.', 'MarkerSize',30)
                end
                for i=1:n
                    hold on
                    plot3(A_min(i),B_min(i),C_min(i), 'r.', 'MarkerSize',30)
                end
                leg = legend('Earth', 'Sat1_{max}', 'Sat2_{max}', 'Sat3_{max}', 'Sat4_{max}','Sat5_{max}','Sat6_{max}', 'Sat1_{min}', 'Sat2_{min}', 'Sat3_{min}', 'Sat4_{min}', 'Sat5_{min}','Sat6_{min}', 'Location', 'NorthEast'); 
                title('6 satellites');
           
            
            elseif n==7              
                
                maximum_vec_7 = max(maximum_vec);
                minimum_vec_7 = min(maximum_vec);
                average_vec_7 = mean(maximum_vec);
                for i=1:n
                    hold on
                    plot3(A_max(i),B_max(i),C_max(i), 'b.', 'MarkerSize',30)
                end
                for i=1:n
                    hold on
                    plot3(A_min(i),B_min(i),C_min(i), 'r.', 'MarkerSize',30)
                end
                leg = legend('Earth', 'Sat1_{max}', 'Sat2_{max}', 'Sat3_{max}', 'Sat4_{max}','Sat5_{max}','Sat6_{max}','Sat7_{max}', 'Sat1_{min}', 'Sat2_{min}', 'Sat3_{min}', 'Sat4_{min}', 'Sat5_{min}','Sat6_{min}','Sat7_{min}', 'Location', 'NorthEast'); 
                title('7 satellites'); 
            
            elseif n==8
                
                maximum_vec_8 = max(maximum_vec);
                minimum_vec_8 = min(maximum_vec);
                average_vec_8 = mean(maximum_vec); 
                
                for i=1:n
                    hold on
                    plot3(A_max(i),B_max(i),C_max(i), 'b.', 'MarkerSize',30)
                end
                for i=1:n
                    hold on
                    plot3(A_min(i),B_min(i),C_min(i), 'r.', 'MarkerSize',30)
                end
                leg = legend('Earth', 'Sat1_{max}', 'Sat2_{max}', 'Sat3_{max}', 'Sat4_{max}','Sat5_{max}','Sat6_{max}','Sat7_{max}', 'Sat8_{max}','Sat1_{min}', 'Sat2_{min}', 'Sat3_{min}', 'Sat4_{min}', 'Sat5_{min}','Sat6_{min}','Sat7_{min}','Sat8_{min}', 'Location', 'NorthEast'); 
                title('8 satellites'); 
                
            else 
               
                maximum_vec_9 = max(maximum_vec);
                minimum_vec_9 = min(maximum_vec);
                average_vec_9 = mean(maximum_vec);
                
                for i=1:n
                    hold on
                    plot3(A_max(i),B_max(i),C_max(i), 'b.', 'MarkerSize',30)
                end
                for i=1:n
                    hold on
                    plot3(A_min(i),B_min(i),C_min(i), 'r.', 'MarkerSize',30)
                end
                leg = legend('Earth', 'Sat1_{max}', 'Sat2_{max}', 'Sat3_{max}', 'Sat4_{max}','Sat5_{max}','Sat6_{max}','Sat7_{max}', 'Sat8_{max}','Sat9_{max}','Sat1_{min}', 'Sat2_{min}', 'Sat3_{min}', 'Sat4_{min}', 'Sat5_{min}','Sat6_{min}','Sat7_{min}','Sat8_{min}','Sat9_{min}', 'Location', 'NorthEast'); 
                title('9 satellites'); 
            end

        end
    end

    total_err=[];
    max_err = 0;
    min_err = 10000000000000;
    counter = 1;
    maximum_vec = [];

end
               
         


fprintf('Problem 9: See the plots')




figure %Plot the max, min, av error
plot(9,maximum_vec_9,'r.','MarkerSize',30)
hold on
plot(9,average_vec_9,'c.','MarkerSize',30)
hold on
plot(9,minimum_vec_9,'b.','MarkerSize',30)

hold on
plot(8,maximum_vec_8,'r.','MarkerSize',30)
hold on
plot(8,average_vec_8,'c.','MarkerSize',30)
hold on
plot(8,minimum_vec_8,'b.','MarkerSize',30)

hold on
plot(7,maximum_vec_7,'r.','MarkerSize',30)
hold on
plot(7,average_vec_7,'c.','MarkerSize',30)
hold on
plot(7,minimum_vec_7,'b.','MarkerSize',30)

hold on
plot(6,maximum_vec_6,'r.','MarkerSize',30)
hold on
plot(6,average_vec_6,'c.','MarkerSize',30)
hold on
plot(6,minimum_vec_6,'b.','MarkerSize',30)

legend('Maximum error','Average error', 'Minimum error')
xlabel('Number of satellites')
ylabel('Error [km]')

xlim([5 10])
%title('How increase in nr. of satellites affects the max/average/min error')


%% 10
close all; clear all; clc;

c = 299792.458; %speed of light
x0 = [0;0;6370;0]; % starting point is the north pole
tol = 10^(-3);
n = 4; %Four satellites
P = 26570; %Constant altitude of the satellites

angle = linspace(0,pi/2,50)'; 
theta = [0 1.7*pi 1.1*pi pi/2]; 


[x,y,z] = sphere; % Make unit sphere
radius = 6370; % Scale to desire radius.
x = x * radius;
y = y * radius;
z = z * radius;
offset = 0;%6370; % Translate sphere to new location.
surf(x+offset,y+offset,z+offset)  % Plot as surface.
xlabel('X', 'FontSize', 20); % Label axes.
ylabel('Y', 'FontSize', 20);
zlabel('Z', 'FontSize', 20);
axis equal;
hold on

total_err = [];
pos_new=[];


for i = 1:43
    
    phi(i,:) = [angle(i,:) angle(mod(i+2,50)+1,:) angle(mod(i+4,50)+1,:) angle(mod(i+6,50)+1,:)];
    
    [A B C R t] = distance_and_time(P,phi(i,:),theta,c,n);
    
    phi2(i,:) = [angle(i,:)+10^(-8) angle(mod(i+2,50)+1,:)-10^(-8) angle(mod(i+4,50)+1,:)-10^(-8) angle(mod(i+6,50)+1,:)+10^(-8)]; %IF I DECREASE THE SKEKKJA I GET NOT AS LINEAR DATA
    [A2 B2 C2 R2 t2] = distance_and_time(P,phi2(i,:),theta,c,n);
    A_loc(i,:)=A2;
    B_loc(i,:)=B2;
    C_loc(i,:)=C2;
 
    [numRows,numCols] = size(A_loc);
    if numRows == 1
        hold on 
        plot3(A_loc(i,1),B_loc(i,1),C_loc(i,1), 'r.', 'MarkerSize',8)
        hold on
        plot3(A_loc(i,2),B_loc(i,2),C_loc(i,2), 'r.', 'MarkerSize',8)
        hold on
        plot3(A_loc(i,3),B_loc(i,3),C_loc(i,3), 'r.', 'MarkerSize',8)
        hold on
        plot3(A_loc(i,4),B_loc(i,4),C_loc(i,4), 'r.', 'MarkerSize',8)
        hold on
    else 
        hold on 
        plot3(A_loc(i,1),B_loc(i,1),C_loc(i,1), 'b.', 'MarkerSize',5)
        hold on
        plot3(A_loc(i,2),B_loc(i,2),C_loc(i,2), 'b.', 'MarkerSize',5)
        hold on
        plot3(A_loc(i,3),B_loc(i,3),C_loc(i,3), 'b.', 'MarkerSize',5)
        hold on
        plot3(A_loc(i,4),B_loc(i,4),C_loc(i,4), 'b.', 'MarkerSize',5)
        hold on
    end
   
    
    format long
    pos_new(i,:) = newtonmult(x0,tol,A2,B2,C2,t,c,n);
    total_err(i) = norm(pos_new(i,:)-x0');
    
end 

 legend('Earth','Initial position of satellites')

figure
%plot(1:43, total_err,'*')
plot(phi(1,1),total_err(1),'r*')
hold on
plot(phi(2:end,1),total_err(2:end),'b*')
xlabel('\phi [rad]')
ylabel('Errors [km]')
%title('Distribution of errors in respecto to the linear increase of \phi angle')


legend('Error in starting position', 'Errors in other positions')



fprintf('Problem 10: See the plots')




