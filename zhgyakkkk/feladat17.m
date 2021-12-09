clear;
hold on;
axis equal;
grid on;

xlabel('x');
ylabel('y');

Px = [10 20 40 50 20];
Py = [20 40 40 20 10];
plot(Px, Py, '--*');

n = 4;
syms t;
t0 = 0;
t1 = 1;

x(t) = 0*t;
y(t) = 0*t;

for i=0:n
    b = nchoosek(n, i) * t^i * (1-t)^(n-i);
    x(t) = x(t) + Px(i+1) * b;
    y(t) = y(t) + Py(i+1) * b;
end

fplot(x, y, [t0 t1]);


v1 = [ n*(Px(2)-Px(1)), n*(Py(2)-Py(1))];
v2 = [ n*(Px(5)-Px(4)), n*(Py(5)-Py(4))];

quiver(Px(1), Py(1), v1(1), v1(2));
quiver(Px(5), Py(5), v2(1), v2(2));



Rx = [20 20];
Ry = [10 -40];

u1 = [-60, -20];
u2 = [60, 0];

plot(Rx, Ry, '*');
quiver(Rx(1), Ry(1), u1(1), u1(2));
quiver(Rx(2), Ry(2), u2(1), u2(2));

syms a3 a2 a1 a0
hx(t) = a3*t^3 + a2*t^2 + a1*t + a0;
hxd(t) = diff(hx, t);
ex = [hx(t0) == Rx(1), hx(t1) == Rx(2), hxd(t0) == u1(1), hxd(t1) == u2(1)];
mx = solve(ex, [a3 a2 a1 a0]);
cx(t) = subs(hx, [a3 a2 a1 a0], [mx.a3 mx.a2 mx.a1 mx.a0]);

ey = [hx(t0) == Ry(1), hx(t1) == Ry(2), hxd(t0) == u1(2), hxd(t1) == u2(2)];
my = solve(ey, [a3 a2 a1 a0]);
cy(t) = subs(hx, [a3 a2 a1 a0], [my.a3 my.a2 my.a1 my.a0]);

fplot(cx, cy, [t0 t1]);


%%   G1 folytonos, mert az egyik végpontjának érintővektora egyenlő irányú
%%a másik kezdőpontjának érintővektorával, de hosszuk nem egyezik.

hold off;