% hw3 regler3
close all
clear all

mu = [0.1 1 4];
s = tf('s');
G = (mu(3)/3)*s/(s^2 - mu(3)*s+1);

w = 0:1/100:2*pi;
unitcircle = cos(w)+1j*sin(w);
%figure(1)
%nyquist(G);

x1 = linspace(-7,7,30);
x2 = linspace(-7,7,30);
x1dot = zeros(length(x2),length(x1));
x2dot = zeros(length(x2),length(x1));

%% mu = .1 ------------------------------------------------------------------
for i=1:length(x1)
    for j=1:length(x2)
        x1dot(j,i) = x2(j);
        x2dot(j,i) = mu(1)*(1-x1(i)^2)*x2(j)-x1(i);
    end
end

% normalizing vector
x1dot = x1dot./sqrt(x1dot.^2 + x2dot.^2);
x2dot = x2dot./sqrt(x1dot.^2 + x2dot.^2);
figure(2)
quiver(x1,x2,x1dot,x2dot);
hold on
% ode45 solution with mu=1, y0=[.1,.1]
tspan = [0 1000];
y0 = [.1;.1];
[t,y] = ode45(@sysODE_01,tspan,y0);
plot(y(:,1)',y(:,2),'r'), title({'Phase plane portrait of,the Van der Pol for mu=0.1'});
hold on
% ode45 solution with mu=1, y0=[4,4] 
tspan = [0 1000];
y0 = [4;4];
[t,y] = ode45(@sysODE_01,tspan,y0);
plot(y(:,1)',y(:,2),'b');

%% mu = 1 ----------------------------------------------------------------
for i=1:length(x1)
    for j=1:length(x2)
        x1dot(j,i) = x2(j);
        x2dot(j,i) = mu(2)*(1-x1(i)^2)*x2(j)-x1(i);
    end
end

% normalizing vector
x1dot = x1dot./sqrt(x1dot.^2 + x2dot.^2);
x2dot = x2dot./sqrt(x1dot.^2 + x2dot.^2);
figure(3)
quiver(x1,x2,x1dot,x2dot);
hold on
% ode45 solution with mu=1, y0=[.1,.1]
tspan = [0 1000];
y0 = [.1;.1];
[t,y] = ode45(@sysODE_1,tspan,y0);
plot(y(:,1)',y(:,2),'r'), title({'Phase plane portrait of,the Van der Pol for mu=1'});
hold on
% ode45 solution with mu=1, y0=[4,4] 
tspan = [0 1000];
y0 = [4;4];
[t,y] = ode45(@sysODE_1,tspan,y0);
plot(y(:,1)',y(:,2),'b');

%% mu = 4 ----------------------------------------------------------------
for i=1:length(x1)
    for j=1:length(x2)
        x1dot(j,i) = x2(j);
        x2dot(j,i) = mu(3)*(1-x1(i)^2)*x2(j)-x1(i);
    end
end

% normalizing vector
x1dot = x1dot./sqrt(x1dot.^2 + x2dot.^2);
x2dot = x2dot./sqrt(x1dot.^2 + x2dot.^2);
figure(4)
quiver(x1,x2,x1dot,x2dot);
hold on
% ode45 solution with mu=4, y0=[.1,.1]
tspan = [0 1000];
y0 = [.1;.1];
[t,y] = ode45(@sysODE_4,tspan,y0);
plot(y(:,1)',y(:,2),'r'), title({'Phase plane portrait of,the Van der Pol for mu=4'});
hold on
% ode45 solution with mu=4, y0=[4,4] 
tspan = [0 1000];
y0 = [4;4];
[t,y] = ode45(@sysODE_4,tspan,y0);
plot(y(:,1)',y(:,2),'b');
%--------------------------------------------------------------------------


function y_out = sysODE_01(t,y)
    mu = .1;
    y_out = [y(2);mu*(1-y(1)^2)*y(2)-y(1)];
end
function y_out = sysODE_1(t,y)
    mu = 1;
    y_out = [y(2);mu*(1-y(1)^2)*y(2)-y(1)];
end
function y_out = sysODE_4(t,y)
    mu = 4;
    y_out = [y(2);mu*(1-y(1)^2)*y(2)-y(1)];
end