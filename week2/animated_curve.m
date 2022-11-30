function animated_curve(y)

path = animatedline('Color','k','LineWidth',1.5);
%theta2 = animatedline('Color','b','LineWidth',1.5);



for i = 1:length(y(1,:))
    addpoints(path,y(1,i),y(3,i));
    %addpoints(theta2,t(i),y(3,i));
    pause(0.01)
    drawnow
    
end

end




