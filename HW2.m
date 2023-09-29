
%% PROBLEM 2.13
c = 5;
m = 1;
k = 1;
x0 = 0.25;
x0t = 0.4;
t = [0:0.01:20];

[T,Y] = ode45(@myodefun, t, [x0t, 0], [], k, m, c, x0);


plot(T, Y)
title('Plot of x');
xlabel("Time");
ylabel("Position/Velocity")
legend("x position", "xdot velocity")




function ydot = myodefun(t,y, k, m, c, x0)
    ydot(1,1) = y(2);
    ydot(2,1) = -k/m*(y(1)-x0) - (c/m)*(y(2)-x0)^3;
end

