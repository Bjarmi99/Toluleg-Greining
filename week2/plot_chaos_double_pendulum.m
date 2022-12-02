function plot_chaos_double_pendulum(y1,y2,L1,L2,n,T)
% 1 %
theta1 = y1(1,:);
theta2 = y1(3,:);

% 2 %
theta11 = y2(1,:);
theta22 = y2(3,:);

figure %open figure for animation

x_0_ball_1 = 0; %We want to pendulum to be fixed at (0,0)
y_0_ball_1 = 0;

%%%%%%%%% FOR PENDULI 1 %%%%%%%%%%
line_1 = animatedline('Color','k','LineWidth',3);
line_2 = animatedline('Color','k','LineWidth',3);
ball_2 = animatedline('Color','b','Marker','.','MarkerSize',35);
path_2 = animatedline('Color','b');
ball_1 = animatedline('Color','r','Marker','.','MarkerSize',50);
path_1 = animatedline('Color','r');

%%%%%%%%% FOR PENDULI 2 %%%%%%%%%%%
line_11 = animatedline('Color','k','LineWidth',3);
line_22 = animatedline('Color','k','LineWidth',3);
ball_22 = animatedline('Color','b','Marker','.','MarkerSize',35);
path_22 = animatedline('Color','b');
ball_11 = animatedline('Color','r','Marker','.','MarkerSize',50);
path_11 = animatedline('Color','r');

%%%%%%%%% FOR PENDULI 1 %%%%%%%%%
axis([-5 5 -5 5])
x_1 = L1*sin(theta1); %trigonometric functions
w_1 = -L1*cos(theta1);
x_2 = L1*sin(theta1)+L2*sin(theta2); %trigonometric functions
w_2 = -L1*cos(theta1)-L2*cos(theta2);

%%%%%%%%% FOR PENDULI 2 %%%%%%%%%
axis([-5 5 -5 5])
x_11 = L1*sin(theta11); %trigonometric functions
w_11 = -L1*cos(theta11);
x_22 = L1*sin(theta11)+L2*sin(theta22); %trigonometric functions
w_22 = -L1*cos(theta11)-L2*cos(theta22);

hold on
title('Double pendulum animation')

plot(0,0,'.','MarkerSize',35, 'color','k')


%vidObj = VideoWriter('Chaos');
%vidObj.FrameRate = n/T; %frame rate set to number of steps/time interval
%open(vidObj) %open the video object

for i=1:length(theta1)
    %%%% 1 %%%%
    addpoints(line_1,[x_0_ball_1 x_1(i)],[y_0_ball_1 w_1(i)])
    addpoints(ball_1,x_1(i),w_1(i))
    addpoints(line_2,[x_1(i) x_2(i)],[w_1(i) w_2(i)])
    addpoints(ball_2,x_2(i),w_2(i))
    addpoints(path_1,x_1(i),w_1(i))
    addpoints(path_2,x_2(i),w_2(i))
     
    %%%% 2 %%%%
    addpoints(line_11,[x_0_ball_1 x_11(i)],[y_0_ball_1 w_11(i)])
    addpoints(ball_11,x_11(i),w_11(i))
    addpoints(line_22,[x_11(i) x_22(i)],[w_11(i) w_22(i)])
    addpoints(ball_22,x_22(i),w_22(i))
    addpoints(path_11,x_11(i),w_11(i))
    addpoints(path_22,x_22(i),w_22(i))
    drawnow
    %frame = getframe(gcf); %capture figure as a movie frame
    %writeVideo(vidObj, frame) %writes the movie frames from the getframe function
    
    %%% 1 %%%
    clearpoints(line_1)
    clearpoints(ball_1)
    clearpoints(line_2)
    clearpoints(ball_2)
    
    %%% 2 %%%
    clearpoints(line_11)
    clearpoints(ball_11)
    clearpoints(line_22)
    clearpoints(ball_22)
  
end

%close(vidObj) %close the video object

end