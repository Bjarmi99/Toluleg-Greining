function plot_double_pendulum(y,L1,L2,n,T)
theta1 = y(1,:);
theta2 = y(3,:);
figure %open figure for animation

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

%vidObj = VideoWriter('Double Pendulum animation 7'); %create a video object, it will create an AVI file
%vidObj = VideoWriter('Double Pendulum animation 8.1'); 
%vidObj = VideoWriter('Double Pendulum animation 8.2'); 
%vidObj = VideoWriter('Double Pendulum animation 8.3'); 
%vidObj = VideoWriter('Double Pendulum animation 8.4'); 
%vidObj = VideoWriter('Double Pendulum animation 8.5'); 
%vidObj = VideoWriter('Double Pendulum animation 8.6'); 
vidObj = VideoWriter('Double Pendulum animation 8.7'); 

vidObj.FrameRate = n/T; %frame rate set to number of steps/time interval
open(vidObj) %open the video object

for i=1:length(theta1)
    
    addpoints(line_1,[x_0_ball_1 x_1(i)],[y_0_ball_1 w_1(i)])
    addpoints(ball_1,x_1(i),w_1(i))
    addpoints(line_2,[x_1(i) x_2(i)],[w_1(i) w_2(i)])
    addpoints(ball_2,x_2(i),w_2(i))
    addpoints(path_1,x_1(i),w_1(i))
    addpoints(path_2,x_2(i),w_2(i))
     
    drawnow
    frame = getframe(gcf); %capture figure as a movie frame
    writeVideo(vidObj, frame) %writes the movie frames from the getframe function

    clearpoints(line_1)
    clearpoints(ball_1)
    clearpoints(line_2)
    clearpoints(ball_2)
  
end

close(vidObj) %close the video object
end