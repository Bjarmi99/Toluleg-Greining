function  x = Gaussnewton(x0,tol,A,B,C,t,c,n)
 
x=x0;
oldx = x0+2*tol;
jac = jacobifunc(A, B, C, c, t,x0,n); %jacobi
jacT = transpose(jac);

    while norm(x-oldx,inf)>tol
       oldx=x;
       s=jacT*jac\jacT*Ffunc(A,B,C,c,t,x,n);
       x = x-s; %new x calculated
       
    end
end




