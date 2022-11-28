
function F = Ffunc(A,B,C,c,t,pos,n)
    for i = 1:n
       F(i,1) = (pos(1)-A(i))^2 + (pos(2)-B(i))^2 + (pos(3)-C(i))^2 - c^2*(t(i)-pos(4))^2;
    end
end