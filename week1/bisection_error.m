function [max_err] = bisection_error(measuring_error,phi,theta)
%This function takes in the measuring error of phi and calculates for
%different random values of the angles and for the specified
%measuring_error and returns the maximum error.


c = 299792.458; 
P=26570; %km
x0 = [0;0;6370;0]; % starting point is north pole
tol2 = 10^(-3);
n=4;

max_err = 0;
counter = 1;
total_err=[];
for m = 1:100
    
    [A B C R t] = distance_and_time(P,phi(m,:),theta(m,:),c,n);

    for i = [-1 1]
        for j = [-1 1]
            for k = [-1 1]
                for h = [-1 1]
                    %Calculate the values with the error:
                    phi2=[phi(m,1)+(i)*measuring_error, phi(m,2)+(j)*measuring_error, phi(m,3)+(k)*measuring_error, phi(m,4)+(h)*measuring_error]; 
                    [A2 B2 C2 R2 t2] = distance_and_time(P,phi2,theta(m,:),c,n);
    
                    pos_new = newtonmult(x0,tol2,A2,B2,C2,t,c,n); %location with some error
    
                    total_err(counter) = norm(pos_new-x0);
                   
                    counter = counter + 1;
                end
            end
        end
    end
    maximum_errors(m) = max(total_err);
    total_err = 0;
    
end
max_err = max(maximum_errors);
end