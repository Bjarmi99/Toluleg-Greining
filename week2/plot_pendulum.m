function plot_pendulum(y,L,n,T)
theta = y(1,:);
figure %open figure for animation
x_0 = 0; %We want the pendulum to be fixed at (0,0)
y_0 = 0;
b = animatedline('Color','b','Marker','.','MarkerSize',35);
h = animatedline('Color','k','LineWidth',3);

axis([-3 3 -3 3])
x_1 = L.*sin(theta); %trigonometric functions
w_1 = -L.*cos(theta);
hold on
title('Pendulum animation')
plot([-0.5,0.5],[0,0],'linewidth',8, 'color','k')

%vidObj = VideoWriter('Pendulum animation'); %create a video object, it will create an AVI file, for problem 3
%vidObj.FrameRate = n/T; %frame rate set to number of steps/time interval
%open(vidObj) %open the video object


for i=1:length(theta)
    
    addpoints(b,x_1(i),w_1(i))
    addpoints(h,[x_0 x_1(i)],[y_0 w_1(i)])
    drawnow
    %frame = getframe(gcf); %capture figure as a movie frame
    %writeVideo(vidObj, frame) %writes the movie frames from the getframe function
    clearpoints(h)
    clearpoints(b)

end

%close(vidObj) %close the video object
end
