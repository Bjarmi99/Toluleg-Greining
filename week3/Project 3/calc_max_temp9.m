function max_temp = calc_max_temp9(m,n,P,H,K,L,Lx,Ly,move,x,y,External_temp)

   [A,b] = set_up_matrix9(m,n,P,H,K,L,Lx,Ly,move,x,y);
    v = (A\b);
    for index = 1:length(v)
        if v(index) < 0.00001
            v(index) = NaN;
        else
            v(index) = v(index)+External_temp;
        end
    end;
   max_temp = max(v)-100;

end