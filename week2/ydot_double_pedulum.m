function z = ydot_double_pedulum(t,y,L1,L2,m1,m2)
g=9.81; 
delta = y(3)-y(1);
w1 = y(2);
w2 = y(4);
theta1 = y(1);
theta2 = y(3);

z(1,:) = w1;
z(2,:) = (m2*L1*w1^2*sin(delta)*cos(delta)+m2*g*sin(theta2)*cos(delta)+m2*L2*w2^2*sin(delta)-(m1+m2)*g*sin(theta1))/((m1+m2)*L1-m2*L1*cos(delta)^2); 
z(3,:) = w2;
z(4,:) = (-m2*L2*w2^2*sin(delta)*cos(delta)+(m1+m2)*(g*sin(theta1)*cos(delta)-L1*w1^2*sin(delta)-g*sin(theta2)))/((m1+m2)*L2-m2*L2*cos(delta)^2);

end