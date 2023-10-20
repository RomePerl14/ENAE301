
%% Problem 6.4

M = 10;
m = 2;
k = 0.5;
b = .2;
l0 = .5;
r10 = l0/2;
r20 = l0;
r1dot0 = 0;
r2dot0 = 0;
t = [0:0.01:1000];

[T,Y] = ode45(@myodefun, t, [r10, r1dot0, r20, r2dot0], [], M, m, k, b, l0);

plot(T,Y(:,1), T, (Y(:,3) + Y(:,1)), T, Y(:,2), T, Y(:,4));
title("Plot of position of small mass and large Mass over time")
legend("r_1(t)", "r_2(t)")
xlabel("time (seconds)  ")
ylabel("r_1 (meters) and r_2 (meters)")



function ydot = myodefun(t, y, M, m, k, b, l0)
    ydot(1,1) = y(2);
    ydot(2,1) = ( k * ( -y(1) + y(3) ) -( b*y(2) ) ) / M;
    ydot(3,1) = y(4);
    ydot(4,1) = (-k / m) * ( y(3) - l0 ) - ydot(2,1);
end
