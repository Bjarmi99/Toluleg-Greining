function y = RK_step(x,h,k1,k2,k3,k4)
y = x + h*((k1/6)+(k2/3)+(k3/3)+(k4/6)); %weighted average
end