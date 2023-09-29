
%% Problem 3.24

L0 = 0.1;
k = 2;
m = 1;
g = 9.8;
theta0 = (pi/4);
thetaDot0 = 0;
r0 = L0;
rDot0 = 0;
t = [0:0.01:20];

[T,Y] = ode45(@myodefun, t, [r0, rDot0, theta0, thetaDot0], [], k, m, L0, g);

Y

plot(T,Y(:,1), T, Y(:,3));
title("Plot of r(t) and theta(t)")
legend("r(t)", "(theta(t)")
xlabel("time")
ylabel("r (meters) and theta (radians)")

figure
plot(T, Y)






function ydot = myodefun(t, y, k, m, L0, g)
    ydot(1,1) = y(2);
    ydot(2,1) = (y(1).*(y(4).*y(4)) + m*g.*cos(y(3)) - k.*(y(1)-L0))./m;
    ydot(3,1) = y(4);
    ydot(4,1) = (-2*m.*y(2).*y(4) - m*g.*sin(y(3)))/2;
end
