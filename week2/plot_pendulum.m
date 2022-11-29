function plot_pendulum(y,L)
theta = y(1,:);
<<<<<<< HEAD
=======
angular_vel = y(2,:);
>>>>>>> c99e8543d99fb520056086defe562295db4015b4

x_0 = 0; %We want to pendulum to be fixed at (0,0)
y_0 = 0;
b = animatedline('Color','b','Marker','.','MarkerSize',35);
h = animatedline('Color','k','LineWidth',3);

axis([-3 3 -3 3])
x_1 = L.*sin(theta); %trigonometric functions
w_1 = -L.*cos(theta);
hold on
title('Pendulum animation')
plot([-0.5,0.5],[0,0],'linewidth',8, 'color','k')

for i=1:length(theta)
    
    addpoints(b,x_1(i),w_1(i))
    addpoints(h,[x_0 x_1(i)],[y_0 w_1(i)])
    drawnow
    clearpoints(h)
    clearpoints(b)
  
end


end
