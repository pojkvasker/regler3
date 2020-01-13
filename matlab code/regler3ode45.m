clear all
close all

x0 = 0;
T=100;

[u,v] = ode45('fun',[0 T],100);
plot(u,v);

