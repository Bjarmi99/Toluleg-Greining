function plot_double_pendulum(y,L1,L2)
theta1 = y(1,:);
theta2 = y(3,:);

x_0_ball_1 = 0; %We want to pendulum to be fixed at (0,0)
y_0_ball_1 = 0;

line_1 = animatedline('Color','k','LineWidth',3);
line_2 = animatedline('Color','k','LineWidth',3);
ball_2 = animatedline('Color','b','Marker','.','MarkerSize',35);
path_2 = animatedline('Color','b');
ball_1 = animatedline('Color','r','Marker','.','MarkerSize',50);
path_1 = animatedline('Color','r');

axis([-5 5 -5 5])
x_1 = L1*sin(theta1); %trigonometric functions
w_1 = -L1*cos(theta1);

x_2 = L1*sin(theta1)+L2*sin(theta2); %trigonometric functions
w_2 = -L1*cos(theta1)-L2*cos(theta2);

hold on
title('Double pendulum animation')

plot(0,0,'.','MarkerSize',35, 'color','k')





for i=1:length(theta1)
    
    addpoints(line_1,[x_0_ball_1 x_1(i)],[y_0_ball_1 w_1(i)])
    addpoints(ball_1,x_1(i),w_1(i))
    addpoints(line_2,[x_1(i) x_2(i)],[w_1(i) w_2(i)])
    addpoints(ball_2,x_2(i),w_2(i))
    addpoints(path_1,x_1(i),w_1(i))
    addpoints(path_2,x_2(i),w_2(i))
     
    drawnow
    clearpoints(line_1)
    clearpoints(ball_1)
    clearpoints(line_2)
    clearpoints(ball_2)
  
end

end