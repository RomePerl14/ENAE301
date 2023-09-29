
R = 50300;
C = 524.30*(10^-6);
Ein = 10.09;
t=[0:0.001:100];
E = Ein *(1-exp(-t/(R*C)));

hold on
plotter = plot(t, E);
xline(25.54, "r--")
yline(6.377, "r--", HandleVisibility="off")
xline(55.38, "g--")
yline(8.728, "g--", HandleVisibility="off")
xlabel("Time (seconds)")
ylabel("Voltage (Volts)")
title("470 uFd charging time - Theory vs Experimental")
legend("Theory Plot", "Voltage at time=RC", "Voltage at time=2RC")
axis([0, 100, 0, 2*Ein])

