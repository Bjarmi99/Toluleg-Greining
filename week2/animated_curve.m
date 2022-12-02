function animated_curve(y,n,T) %we need to call n and T for the FrameRate

figure %open figure for animation
path = animatedline('Color','k','LineWidth',1.5);

axis([min(y(1,:)) max(y(1,:)) min(y(3,:)) max(y(3,:))]*1.1) %to get always the right fixed axis

%vidObj = VideoWriter('Parametrized curve'); %create a video object, it will create an AVI file
%vidObj.FrameRate = n/T; %frame rate set to number of steps/time interval
%open(vidObj) %open the video object

for i = 1:length(y(1,:))
    addpoints(path,y(1,i),y(3,i));
    %addpoints(theta2,t(i),y(3,i));
    %pause(0.05)
    drawnow

    %frame = getframe(gcf); %capture figure as a movie frame
    %writeVideo(vidObj, frame) %writes the movie frames from the getframe function
    
end
%close(vidObj) %close the video object
end




