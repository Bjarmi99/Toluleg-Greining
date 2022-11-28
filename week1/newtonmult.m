function x = newtonmult(x0,tol,A,B,C,t,c,n)

x=x0;
oldx=x0+2*tol;
    while norm(x-oldx,inf)>tol
       oldx=x;
       y=jacobifunc(A,B,C,c,t,x,n);
       z=Ffunc(A,B,C,c,t,x,n);
       s=-jacobifunc(A,B,C,c,t,x,n)\Ffunc(A,B,C,c,t,x,n);
       x=x+s;
    end
end





