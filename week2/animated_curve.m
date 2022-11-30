function animated_curve(y)

path = animatedline('Color','k','LineWidth',1.5);

axis([min(y(1,:)) max(y(1,:)) min(y(3,:)) max(y(3,:))]*1.1) %to get allways the right fixed axis

for i = 1:length(y(1,:))
    addpoints(path,y(1,i),y(3,i));
    %addpoints(theta2,t(i),y(3,i));
    pause(0.05)
    drawnow
    
end

end




