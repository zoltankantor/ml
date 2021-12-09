clear;
syms x y;
hold on;
z(x,y)=sin(x)+(cos(y)/x);
axis equal;
fsurf(z,[0.1 5 -6 6]);
fx(x,y)=0*x+0*y;
fsurf(fx,[0.1 5 -6 6],'r');