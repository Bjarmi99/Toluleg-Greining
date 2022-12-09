function [A b] = set_up_the_matrix(m,n,P,H,K,L,Lx,Ly,move)
ratio = (L/Ly)*n; %scaling the y axis to position the power source
delta = 0.1; %cm
h = Lx/(m-1);
k = Ly/(n-1);
A = zeros(m*n,m*n);
b = zeros(m*n,1);

%INNER MATRIX
for i = 2:m-1
    for j = 2:n-1
        eq = i + (j-1)*m;
        A(eq,eq) = -((2/h^2) + (2/k^2) + (2*H/(K*delta)));
        A(eq,eq+1) = 1/h^2;
        A(eq,eq-1) = 1/h^2;
        A(eq,eq+m) = 1/k^2;
        A(eq,eq-m) = 1/k^2;
    end
end
               

if move == 0
 %Left boundary no power
    for j = ratio+1:n %changed ratio to ratio + 1 (works the same)
       i = 1; eq = i+(j-1)*m;
       A(eq,eq) = -3+((2*h*H)/K);
       A(eq,eq+1) = 4;
       A(eq,eq+2) = -1;
    end
    
    
    %Left boundary POWER
    for j = 1:ratio   %LATER USE n = L
       i = 1; eq = i+(j-1)*m;
       A(eq,eq) = -3;
       A(eq,eq+1) = 4;
       A(eq,eq+2) = -1;
       b(eq) = (-2*h*P)/(L*delta*K);
    end
end
    

if move > 0 || move < L
     %Left boundary no power (UPPER SIDE)
    for j = ratio + move + 1 : n  
       i = 1; eq = i+(j-1)*m;
       A(eq,eq) = -3+((2*h*H)/K);
       A(eq,eq+1) = 4;
       A(eq,eq+2) = -1;
    end
    
     %Left boundary no power (LOWER SIDE)
    for j = 1:move  %MAYBE WRONG HERE IF MOVE == 1 (MOVE CAN'T BE = 1 TO START WITH?????      
       i = 1; eq = i+(j-1)*m;
       A(eq,eq) = -3+((2*h*H)/K);
       A(eq,eq+1) = 4;
       A(eq,eq+2) = -1;
    end
    
    
    %Left boundary POWER (MIDDLE)
    for j = 1 + move : ratio + move%%%%%% %here we move power up and we have to delete the top so it doesn't get longer than L
       i = 1; eq = i+(j-1)*m;
       A(eq,eq) = -3;
       A(eq,eq+1) = 4;
       A(eq,eq+2) = -1;
       b(eq) = (-2*h*P)/(L*delta*K);
    end

end
    
if move == ratio
   
    %Left boundary no power
    for j = 1:ratio %changed ratio to ratio + 1 (works the same)
       i = 1; eq = i+(j-1)*m;
       A(eq,eq) = -3+((2*h*H)/K);
       A(eq,eq+1) = 4;
       A(eq,eq+2) = -1;
    end
    
    
    %Left boundary POWER
    for j = ratio+1:n  %LATER USE n = L
       i = 1; eq = i+(j-1)*m;
       A(eq,eq) = -3;
       A(eq,eq+1) = 4;
       A(eq,eq+2) = -1;
       b(eq) = (-2*h*P)/(L*delta*K);
    end

    
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