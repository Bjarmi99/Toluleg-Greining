function [A b] = set_up_matrix5(m,n)
P = 5; %W
L = 1; %cm
Lx = 2;
Ly = 2;
ratio = L/Ly *n; %scaling the y axis to position the power source
delta = 0.1; %cm
h = Lx/(m-1);
k = Ly/(n-1);
H = 0.005; %W/cm^2 * C°
K = 1.68; %W/cm^2 * C°
A = zeros(m*n,m*n);
b = zeros(m*n,1);

%INNER MATRIX
for i = 2:m-1
    for j = 2:n-1
        eq = i + (j-1)*m;
        A(eq,eq) = -((2/h^2) + (2/k^2) + (2*H/(K*delta))); %%%%
        A(eq,eq+1) = 1/h^2;
        A(eq,eq-1) = 1/h^2;
        A(eq,eq+m) = 1/k^2;%%%%%
        A(eq,eq-m) = 1/k^2;
    end
end
        
        

%Left boundary no power
for j = ratio:n
   i = 1; eq = i+(j-1)*m;
   A(eq,eq) = -3+((2*h*H)/K);
   A(eq,eq+1) = 4;
   A(eq,eq+2) = -1;
end


%Left boundary (All power)
for j = 1:ratio   %LATER USE n = L
   i = 1; eq = i+(j-1)*m;
   A(eq,eq) = -3;
   A(eq,eq+1) = 4;
   A(eq,eq+2) = -1;
   b(eq) = (-2*h*P)/(L*delta*K);
end

%RIGHT BOUNDARY
for j = 1:n 
   i = m; eq = i+(j-1)*m;
   A(eq,eq) = -3+((2*h*H)/K);
   A(eq,eq-1) = 4;
   A(eq,eq-2) = -1;
   b(eq) = 0;
end

%BOTTOM BOUNDARY
for i = 2:m-1 
   j = 1; eq = i+(j-1)*m;
   A(eq,eq) = -3+((2*k*H)/K);
   A(eq,eq+m) = 4;
   A(eq,eq+2*m) = -1;
   b(eq) = 0;
end

%TOP BOUNDARY
for i = 2:m-1 
   j = n; eq = i+(j-1)*m;
   A(eq,eq) = -3+((2*k*H)/K);
   A(eq,eq-m) = 4;
   A(eq,eq-2*m) = -1;
   b(eq) = 0;
end
