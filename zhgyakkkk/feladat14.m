clear;
hold on;
axis equal;
grid on;

xlabel('x');
ylabel('y');
zlabel('z');

Px = [-2 6 10];
Py = [-2 -2 2];
plot(Px, Py, '*');
v = [ 6 -4 ];
quiver(Px(1), Py(1), v(1), v(2));

syms t;
t0 = 0;
t1 = 1;
t2 = 1.5;

syms a3 a3 a2 a1 a0;
x(t) = a3*t^3 + a2*t^2 + a1*t + a0;
xd(t) = diff(x, t);
ex = [x(t0) == Px(1), x(t1) == Px(2), x(t2) == Px(3), xd(t0) == v(1)];
mx = solve(ex, [a3 a2 a1 a0]);
cx(t) = subs(x, [a3 a2 a1 a0], [mx.a3 mx.a2 mx.a1 mx.a0]);

syms b3 b2 b1 b0;
y(t) = b3*t^3 + b2*t^2 + b1*t + b0;
yd(t) = diff(y, t);
ey = [y(t0) == Py(1), y(t1) == Py(2), y(t2) == Py(3), yd(t0) == v(2)];
my = solve(ey, [b3 b2 b1 b0]);
cy(t) = subs(y, [b3 b2 b1 b0], [my.b3 my.b2 my.b1 my.b0]);

fplot(cx, cy, [t0 t2]);




cxd(t) = diff(cx, t);
cyd(t) = diff(cy, t);

Rx = [Px(3) 20];
Ry = [Py(3) 5];
ux = [cxd(t2), 3];
uy = [cyd(t2), 0];

plot(Rx, Ry, '*');
quiver(Rx(1), Ry(1), ux(1), uy(1));
quiver(Rx(2), Ry(2), ux(2), uy(2));

ex2 = [x(t0) == Rx(1), x(t2) == Rx(2), xd(t0) == ux(1), xd(t2) == ux(2)];
mx2 = solve(ex2, [a3 a2 a1 a0]);
cx2(t) = subs(x, [a3 a2 a1 a0], [mx2.a3 mx2.a2 mx2.a1 mx2.a0]);

ey2 = [y(t0) == Ry(1), y(t2) == Ry(2), yd(t0) == uy(1), yd(t2) == uy(2)];
my2 = solve(ey2, [b3 b2 b1 b0]);
cy2(t) = subs(y, [b3 b2 b1 b0], [my2.b3 my2.b2 my2.b1 my2.b0]);

fplot(cx2, cy2, [t0 t2]);

hold off;