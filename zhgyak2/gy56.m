clear;
syms x y z;
hold on; axis equal;
eq1(x,y,z)=x+y-z;
eq2(x,y,z)=x-2*y+3*x-4;
eq3(x,y,z)=2*x-0.5*y+4*z+2;
fimplicit3(eq1,'g');
fimplicit3(eq2,'y');
fimplicit3(eq3,'r');
e=[eq1==0,...
    eq2==0,...
    eq3==0];
m=solve(e,[x y z]);
M=[m.x,m.y,m.z];
plot3(M(1),M(2),M(3),'y.','MarkerSize',100);

