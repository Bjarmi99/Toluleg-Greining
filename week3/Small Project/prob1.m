

A = zero(n,n);
b = zero(n,1);

%boundary
A(1,1)=1;
A(n,n)=1;

for i=2:n-1
    A(i+1,i,i-1)=[1+h, -(2-h^2), 1-h];
end