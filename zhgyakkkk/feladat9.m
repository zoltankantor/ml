clear;
hold on;
axis equal;
grid on;
 % Hermit iv meg van adva az érintő
xlabel('x');
ylabel('y');
zlabel('z');

Px = [-2 6 10];
Py = [-2 -2 2];
plot(Px, Py, '*');
v = [ 6 -4 ];
quiver(Px(1), Py(1), v(1), v(2)); % A 0 értéknél a (6-4 vektor)

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

hold off;