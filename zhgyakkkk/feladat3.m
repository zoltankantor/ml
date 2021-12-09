clear;
hold on;
axis equal;

xlabel('x');
ylabel('y');
zlabel('z');
%%Ábrázolja a felületet
%%Határozza meg a felületnek az xy síkkal való
%% metszetét, majd ábrázolja ezt a felületen! x$0[0.1 5]
syms x y;
z(x, y) = sin(x) + (cos(y)/x);
fsurf(z, [0.1 5 -6 6]);

fimplicit(z, [0.1 5 -6 6]);


hold off;