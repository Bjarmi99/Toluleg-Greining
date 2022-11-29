function [t y] = RK_method_single_pendulum(x,n,T)

h=T/n;
t(1)=0;
y=x; %To get the initial conditions


for i=1:n
    
    k1 = ydot(t(i),y(:,i)); %slope 1
    k2 = ydot(t(i)+h/2,y(:,i)+(h/2).*k1); %slope 2
    k3 = ydot(t(i)+h/2,y(:,i)+(h/2).*k2); %slope 3
    k4 = ydot(t(i)+h,y(:,i)+h.*k3); %slope 4
    y(:,i+1)=RK_step(y(:,i),h,k1,k2,k3,k4); 
    t(i+1)=t(i)+h;
    
end



end