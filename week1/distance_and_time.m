function [A B C R t] = distance_and_time(P, phi, theta, c,n) 
    for i = 1:n
        A(i) = P*sin(phi(i))*cos(theta(i));
        B(i) = P*sin(phi(i))*sin(theta(i));
        C(i) = P*cos(phi(i));
    end

    for i = 1:n
        R(i) = sqrt((A(i))^2 + (B(i))^2 + (C(i)-6370)^2);
        t(i) = R(i)/c; 
    end
end