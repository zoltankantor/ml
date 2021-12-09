clear;
syms x y;
hold on; axis equal;
z(x,y)=sqrt(1-x^2-0.5*y^2);
fsurf(z);
plot3(0.5,0.2,z(0.5,0.2),'r.','MarkerSize',20);