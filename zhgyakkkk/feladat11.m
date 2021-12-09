clear;
hold on;
axis equal;
grid on;

xlabel('x');
ylabel('y');
zlabel('z');

Px = [-2 6];
Py = [-2 -2];
plot(Px, Py, '*');
Vx = [6 4];
Vy = [-4 4];
quiver(Px(1), Py(1), Vx(1), Vy(1));
quiver(Px(2), Py(2), Vx(2), Vy(2));

syms t;
t0 = 0;
t1 = 1;

syms a3 a2 a1 a0
x(t) = a3*t^3 + a2*t^2 + a1*t + a0;
xd(t) = diff(x, t);
ex = [x(t0) == Px(1), x(t1) == Px(2), xd(t0) == Vx(1), xd(t1) == Vx(2)];
mx = solve(ex, [a3 a2 a1 a0]);
cx(t) = subs(x, [a3 a2 a1 a0], [mx.a3 mx.a2 mx.a1 mx.a0]);

syms b3 b2 b1 b0
y(t) = b3*t^3 + b2*t^2 + b1*t + b0;
yd(t) = diff(y, t);
ey = [y(t0) == Py(1), y(t1) == Py(2), yd(t0) == Vy(1), yd(t1) == Vy(2)];
my = solve(ey, [b3 b2 b1 b0]);
cy(t) = subs(y, [b3 b2 b1 b0], [my.b3 my.b2 my.b1 my.b0]);

fplot(cx, cy, [t0 t1]);


t2 = 2;

Rx = [ 6 14];
Ry = [-2 -4];
plot(Rx, Ry, '*');
Ux = [ 3];
Uy = [ 0];
quiver(Rx(2), Ry(2), Ux(1), Uy(1));

syms k3 k2 k1 k0
kx(t) = k3*t^3 + k2*t^2 + k1*t + k0;
kxd(t) = diff(kx, t);
kex = [kx(t0) == Rx(1), kx(t2) == Rx(2), kxd(t0) == Vx(2), kxd(t2) == Ux(1)];
kmx = solve(kex, [k3 k2 k1 k0]);
kcx(t) = subs(kx, [k3 k2 k1 k0], [kmx.k3 kmx.k2 kmx.k1 kmx.k0]);

syms f3 f2 f1 f0
ky(t) = f3*t^3 + f2*t^2 + f1*t + f0;
kyd(t) = diff(ky, t);
key = [ky(t0) == Ry(1), ky(t2) == Ry(2), kyd(t0) == Vy(2), kyd(t2) == Uy(1)];
kmy = solve(key, [f3 f2 f1 f0]);
kcy(t) = subs(ky, [f3 f2 f1 f0], [kmy.f3 kmy.f2 kmy.f1 kmy.f0]);

fplot(kcx, kcy, [t0 t2]);

hold off;