

a = 1;
m = 0.5;
k = 3;
t = [0:0.01:10];

[T,Y] = ode45(@myodefun, t, [0,0], [], k, m, a);

hold on

plot(T, Y)
title('Plot of x" = a-xk/m');
xlabel("Time");
ylabel("X value (line dependent)")

y0 = 0;
ydot0 = 0;

y = (y0-(a/(k/m)))*cos(sqrt(k/m)*t) + ydot0/(sqrt(k/m))*sin(sqrt(k/m)*t) + a/(k/m);
ydot = -(y0-(a/(k/m)))*sin(sqrt(k/m)*t)*(sqrt(k/m)) + ydot0/(sqrt(k/m))*cos(sqrt(k/m)*t)*sqrt(k/m);
plot(t, y, ".");
plot(t, ydot, ".")
legend("x", "x'", "analytic x", "analytic x'")



function ydot = myodefun(t,y, k, m, a)
    ydot(1,1) = y(2);
    ydot(2,1) = a -(k/m)*y(1);
end

