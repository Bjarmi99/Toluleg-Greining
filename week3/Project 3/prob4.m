%% Problem 4.1 (RUN ALL SECTIONS, TAKES A BIT OF TIME BUT ALL THE ANSWERS WILL SHOW IN COMMAND WINDOW)
close all; clear all; clc;

m = 100;
n = 100;
[A,b] = set_up_matrix_3_4(m,n);
v = (A\b)+20;
v_matrix = reshape(v(1:m*n),m,n); %here we reshape from vector to matrix so it maches the X,Y boundaries

% [X,Y] = meshgrid(1:m,1:n); %HERE I PLOT THE PLATE
% 
% mesh(X,Y,v_matrix)
% colorbar

refrence_val = v_matrix(1,1); %keep the refrence value for comparision


%% 4.2 Compare the values to refrence value
 
m = 10;
n = 10;
val_count = 1;
m_count = 1;
n_count = 1;
for i = 1:9
    for j = 1:9
        [A,b] = set_up_matrix_3_4(m,n);
        v = (A\b)+20;
        v_matrix = reshape(v(1:m*n),m,n);
        comp_val = abs(v_matrix(1,1) - refrence_val);
        compare_vec(j,i) = comp_val;
        
        if comp_val < 0.01
            wanted_error(val_count) = comp_val;
            m_vec(m_count) = m;
            n_vec(n_count) = n;
            
            val_count = val_count+1; m_count = m_count+1; n_count = n_count+1;
        end
        n = n+10;
    end
    m = m+10;
    n = 10;
end

wanted_values = [m_vec' n_vec' wanted_error'];

%% 4.3 Get the most time efficient values


counter = 1;
for i = 1:length(wanted_values)
    m = wanted_values(i,1);
    n = wanted_values(i,2);
    tic
    [A,b] = set_up_matrix_3_4(m,n);
    v = (A\b)+20;
    line = toc;
    v_matrix = reshape(v(1:m*n),m,n);
    
    if line < 0.5
        time(counter,1) = i; %column one displays in which line the most efficient values appears in,in 
        time(counter,2) = line;
        counter = counter + 1;
    end

end

efficient_val = wanted_values(9,1:2);

%% 4.4 printing correct values

n_matter1 = compare_vec(1,1);

n_matter2 = compare_vec(end,1);

m_matter1 = compare_vec(1,1);
m_matter2 = compare_vec(1,end);

chosen_temperature_deviation = wanted_values(9,3);
%best_runing_time = 

fprintf('\nWhen m = 10 and n = 10 we get the error: %.4f',n_matter1)
fprintf('\nWhen m = 10 and n = 90 we get the error: %.4f',n_matter2)

fprintf('\nWhen n = 10 and m = 10 we get the error: %.4f',m_matter1)
fprintf('\nWhen n = 10 and m = 90 we get the error: %.4f',m_matter2)


fprintf('\n\nThe most efficient values were\n m = %.f\n n = %.f\n',efficient_val(1), efficient_val(2))
fprintf('\nWhere these m,n values give the temperature change: %.4f°C\nAnd the running time is: %.4fs\n',chosen_temperature_deviation,min(time(:,2)))
