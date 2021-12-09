clear;
hold on;
axis equal;
grid on;

xlabel('x');
ylabel('y');
zlabel('z');
%% Negyedfoku polinomialis görbe
Px = [ 10 20 40 50 20];
Py = [ 20 40 40 20 10];
plot(Px, Py, '*');
syms t
t0= 0; t1 = 1; t2 = 2; t3 = 3; t4 = 4;

syms a4 a3 a2 a1 a0
x(t) = a4*t^4 + a3*t^3 + a2*t^2 + a1*t + a0;
ex = [x(t0) == Px(1), x(t1) == Px(2), x(t2) == Px(3), x(t3) == Px(4), x(t4) == Px(5)];
mx = solve(ex, [a4 a3 a2 a1 a0]);
cx(t) = subs(x, [a4 a3 a2 a1 a0], [mx.a4 mx.a3 mx.a2 mx.a1 mx.a0]);

syms b4 b3 b2 b1 b0
y(t) = b4*t^4 + b3*t^3 + b2*t^2 + b1*t + b0;
ey = [y(t0) == Py(1), y(t1) == Py(2), y(t2) == Py(3), y(t3) == Py(4), y(t4) == Py(5)];
my = solve(ey, [b4 b3 b2 b1 b0]);
cy(t) = subs(y, [b4 b3 b2 b1 b0], [my.b4 my.b3 my.b2 my.b1 my.b0]);

fplot(cx(t), cy(t), [t0 t4]);

t5 = 0.5;

cxd(t) = diff(cx, t);
cyd(t) = diff(cy, t);

v = [ cxd(t5), cyd(t5)];
quiver(cx(t5), cy(t5), v(1), v(2));


grid off;