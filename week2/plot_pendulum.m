function plot_pendulum(y,L)
theta = y(1,:);
angular_vel = y(2,:);

x_0 = 0; %We want to pendulum to be fixed at (0,0)
y_0 = 0;
h=animatedline('Color','k','LineWidth',3);

axis([-3 3 -3 3])
x_1 = L.*sin(theta); %trigonometric functions
w_1 = -L.*cos(theta);
hold on
title('Pendulum animation')
for i=1:length(theta)
    plot([-0.5,0.5],[0,0],'linewidth',8, 'color','k')
    ball = plot(x_1(i),w_1(i),'b.',"MarkerSize",35);
    addpoints(h,[x_0 x_1(i)],[y_0 w_1(i)]);
    drawnow
    
    clearpoints(h)
    delete(ball)
  
end


end
