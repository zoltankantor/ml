clear;
hold on;
axis equal;

xlabel('x');
ylabel('y');
zlabel('z');

syms u v;
x(u, v) = u - (u^3)/3 + u*v^2;
y(u, v) = v - (v^3)/3 + v*u^2;
z(u, v) = u^2 - v^2;

fsurf(x(u, v), y(u, v), z(u, v), [-25  25 -25 25]);

u0 = 10;
v0 = 15;

P = [ x(u0, v0), y(u0, v0), z(u0, v0) ];
fplot3(P(1), P(2), P(3), 'or', 'MarkerSize', 10);

cx(v) = x(u0, v);
cy(v) = y(u0, v);
cz(v) = z(u0, v);
fplot3(cx, cy, cz, [-25 25], '--g', 'MarkerSize', 20);

dx(u) = x(u, v0);
dy(u) = y(u, v0);
dz(u) = z(u, v0);
fplot3(dx, dy, dz, [-25 25], '--b', 'MarkerSize', 20);

cxd(v) = diff(cx, v);
cyd(v) = diff(cy, v);
czd(v) = diff(cz, v);
a = [ cxd(v0), cyd(v0), czd(v0) ];
quiver3(P(1), P(2), P(3), a(1), a(2), a(3));

dxd(u) = diff(dx, u);
dyd(u) = diff(dy, u);
dzd(u) = diff(dz, u);
b = [ dxd(u0), dyd(u0), dzd(u0)];
quiver3(P(1), P(2), P(3), b(1), b(2), b(3));

n = cross(a, b);
quiver3(P(1), P(2), P(3), n(1), n(2), n(3));

hold off;