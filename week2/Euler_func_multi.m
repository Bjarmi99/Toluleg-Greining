function [t y]=Euler_func_multi(x,n,T)
h=T/n;
t(1)=0;
y=[x(1); x(2)]; %To get the initial conditions



for i=1:n
    f = ydot(t(i),y(:,i)); %Now this is a vector
    y(:,i+1)=eulerstep(t(i),y(:,i),h);  %y(:,i)+f'.*h %þarf að bylta f því f er dálkavigur
    t(i+1)=t(i)+h;
end


end