%% Problem 4
close all; clear all; clc;

m = 100;
n = 100;
[A,b] = set_up_matrix(m,n);
v = (A\b)+20;
v_matrix = reshape(v(1:m*n),m,n); %here we reshape from vector to matrix so it maches the X,Y boundaries

[X,Y] = meshgrid(1:m,1:n);

mesh(X,Y,v_matrix)
colorbar

refrence_val = v_matrix(1,1); %keep the refrence value for comparision


%% Compare the values to refrence value
 
m = 10;
n = 10;
val_count = 1;
m_count = 1;
n_count = 1;
for i = 1:9
    for j = 1:9
        [A,b] = set_up_matrix(m,n);
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

%% Get the most efficient value


counter = 1;
for i = 1:length(wanted_values)
    m = wanted_values(i,1);
    n = wanted_values(i,2);
    tic
    [A,b] = set_up_matrix(m,n);
    v = (A\b)+20;
    line = toc;
    v_matrix = reshape(v(1:m*n),m,n);
    
    if line < 0.5
        time(counter,1) = i;
        time(counter,2) = line;
        counter = counter + 1;
    end

end




