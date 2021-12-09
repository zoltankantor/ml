clear;
hold on;
axis equal;
%% Tekintsük paraméteres felületet. 
% Ábrázolja a két görbét, valamint a felületet is ugyanazon ábrán!

xlabel('x');
ylabel('y');
zlabel('z');

syms u v;
P1 = [ 0, 0, 0 ];
P2 = [ 0, 1, 1 ];
R1 = [ 1, 0, 1 ];
R2 = [ 1, 1, 0 ];

%%p(u) = (1-u)*P1 + u*P2;
px(u) = (1-u)*P1(1) + u * P2(1);
py(u) = (1-u)*P1(2) + u * P2(2);
pz(u) = (1-u)*P1(3) + u * P2(3);

%%r(u) = (1-u)*R1 + u*R2;
rx(u) = (1-u)*R1(1) + u * R2(1);
ry(u) = (1-u)*R1(2) + u * R2(2);
rz(u) = (1-u)*R1(3) + u * R2(3);

fplot3(px, py, pz, [0 1]);
fplot3(rx, ry, rz, [0 1]);

%%s(u, v) = (1 - v) * p(u) + v * r(u);
sx(u, v) = (1 - v) * px(u) + v * rx(u);
sy(u, v) = (1 - v) * py(u) + v * ry(u);
sz(u, v) = (1 - v) * pz(u) + v * rz(u);

fsurf(sx, sy, sz, [0 1 0 1]);

hold off;