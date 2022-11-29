function [t y] = RK_method_double_pendulum(x,n,T,L1,L2,m1,m2)
h=T/n;
t(1)=0;
y=x; %To get the initial conditions


for i=1:n
    
    k1 = ydot_double_pedulum(t(i),y(:,i),L1,L2,m1,m2); %slope 1
    k2 = ydot_double_pedulum(t(i)+h/2,y(:,i)+(h/2).*k1,L1,L2,m1,m2); %slope 2
    k3 = ydot_double_pedulum(t(i)+h/2,y(:,i)+(h/2).*k2,L1,L2,m1,m2); %slope 3
    k4 = ydot_double_pedulum(t(i)+h,y(:,i)+h.*k3,L1,L2,m1,m2); %slope 4
    y(:,i+1)=RK_step(y(:,i),h,k1,k2,k3,k4); 
    t(i+1)=t(i)+h;
    
end

end
