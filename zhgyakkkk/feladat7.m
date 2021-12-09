clear;
hold on;
axis equal;
grid on;

xlabel('x');
ylabel('y');
%% Paraméteres kör egység sugrau a másik két egység sugaru és (2,1) közép
%%pontu 
%% Metszés pontjuk
syms t
cx(t) = cos(t);
cy(t) = sin(t);

fplot(cx, cy, [0 pi]);

dx(t) = 2 + 2*cos(t);
dy(t) = 1 + 2*sin(t);

fplot(dx, dy, [0 2*pi]);

syms u v;
e = [cx(u) == dx(v), cy(u) == dy(v)];
m = solve(e, [u v]);
M = [cx(m.u(2)), cy(m.u(2))];
plot(M(1), M(2), '*');
hold off;