function xc = bisect(a,b,tol,phi,theta)
%xc is the angle error that gives the measuring error less than 10 cm.

f=@(measuring_error)bisection_error(measuring_error,phi,theta)-0.0001; % we need to substract 10 cm from f because the bisection method is looking for the "zero station"
if sign(f(a))*sign(f(b)) >= 0
  error('f(a)f(b)<0 not satisfied!') %ceases execution
end
fa=f(a);
while (b-a)/2>tol
  c=(a+b)/2;
  fc=f(c);
  if fc == 0              %c is a solution, done
    break
  end
  if sign(fc)*sign(fa)<0  %a and c make the new interval
    b=c;
  else                    %c and b make the new interval
    a=c;fa=fc;
  end
end
xc=(a+b)/2;               %new midpoint is best estimate
