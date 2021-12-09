clear;
hold on;
axis equal;

xlabel('x');
ylabel('y');
%% Parabola és egyenes metszés pontja
syms x y;
F(x, y) = x^2 - 2*x*y + y^2 + 4*x - 8*y + 20;
fimplicit(F, 'b');

G(x, y) = -4*x + 4;
fimplicit(G, 'g');

e = [ F == 0, G == 0];
m = solve(e, [ x y ]);
M = [ m.x, m.y ];
plot(M(1), M(2), '*r');
hold off;
