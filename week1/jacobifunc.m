

function DF = jacobifunc(A, B, C, c, t,pos,n)
    for i = 1:n
        DF(i,1) = 2*(pos(1) - A(i));
        DF(i,2) = 2*(pos(2) - B(i));
        DF(i,3) = 2*(pos(3) - C(i));
        DF(i,4) = 2*t(i)*c^2 - 2*c^2*pos(4);

    end
end
