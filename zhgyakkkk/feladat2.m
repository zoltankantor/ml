clear;
hold on;
axis equal;

%% Ábrázolja a felületet! 
% Jelenítse meg a (0.5, 0.2) ponthoz tartozó felületi pontot!


syms x y;
z(x, y) = sqrt(1-(x^2)-0.5*(y^2));
fsurf(z);

P = [ 0.5, 0.2, z(0.5,0.2) ];
fplot3(P(1), P(2), P(3), '*');

hold off;