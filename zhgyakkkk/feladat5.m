 %%Három sik metszés pontja

syms x y z;
F(x, y, z) = x + y - z;
G(x, y, z) = x -2*y + 3*z - 4;
H(x, y, z) = 2*x - 0.5 * y + 4 * z + 2;

fimplicit3(F, 'g');
fimplicit3(G, 'b');
fimplicit3(H, 'r');

e = [ F == 0, G  == 0, H == 0];
m = solve(e, [ x y z ]);
M = [ m.x m.y m.z ];
plot3(M(1), M(2), M(3), '*', 'MarkerSize', 10);

hold off;