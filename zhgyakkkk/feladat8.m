clear;
hold on;
axis equal;
grid on;

xlabel('x');
ylabel('y');
zlabel('z');
%% Hermit iv Görbe érintő vektorát megrajzolni t=2nél
Px = [ -2 4 6 10 ];
Py = [ -2 0 -2 2 ];
plot(Px, Py, '*');

syms t;
t0 = -1;
t1 = 0;
t2 = 2;
t3 = 3;

syms a3 a2 a1 a0;
x(t) = a3*t^3 + a2*t^2 + a1*t + a0;
ex = [ x(t0) == Px(1), x(t1) == Px(2), x(t2) == Px(3), x(t3) == Px(4)];
mx = solve(ex, [a3 a2 a1 a0]);
cx(t) = subs(x, [a3 a2 a1 a0], [mx.a3 mx.a2 mx.a1 mx.a0]);

syms b3 b2 b1 b0;
y(t) = b3*t^3 + b2*t^2 + b1*t + b0;
ey = [ y(t0) == Py(1), y(t1) == Py(2), y(t2) == Py(3), y(t3) == Py(4)];
my = solve(ey, [b3 b2 b1 b0]);
cy(t) = subs(y, [b3 b2 b1 b0], [my.b3 my.b2 my.b1 my.b0]);

fplot(cx, cy, [t0 t3], 'g');

cxd(t) = diff(cx, t);
cyd(t) = diff(cy, t);
v = [ cxd(t2), cyd(t2)];
quiver(Px(3), Py(3), v(1), v(2));

hold off;