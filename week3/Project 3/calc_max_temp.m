function max_temp = calc_max_temp(m,n,P,H,K,L,Lx,Ly,move)

   [A,b] = test(m,n,P,H,K,L,Lx,Ly,move);
    v = (A\b)+20;
   max_temp = max(v)-100;

end