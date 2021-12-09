clear;
hold on; axis equal;
Px=[-2 6 10];Py=[-2 -2 2]; Vektor=[6 -4];
t0=0;t1=1;t2=1.5;
plot(Px,Py,'b.','MarkerSize',20);
quiver(Px(1),Py(1),Vektor(1),Vektor(2),'g','MarkerSize',3);
syms a0 a1 a2 a3 t;
syms b0 b1 b2 b3 t;
ex(t)=a3*t^3+a2*t^2+a1*t+a0;
ey(t)=b3*t^3+b2*t^2+b1*t+b0;
dx(t)=diff(ex,t);
dy(t)=diff(ey,t);
e1=[ex(t0)==Px(1)...
    ex(t1)==Px(2)...
    ex(t2)==Px(3)...
    dx(t0)==Vektor(1)];
e2=[ey(t0)==Py(1)...
    ey(t1)==Py(2)...
    ey(t2)==Py(3)...
    dy(t0)==Vektor(2)];
mx=solve(e1,[a0 a1 a2 a3]);
my=solve(e2,[b0 b1 b2 b3]);
x(t)=subs(ex,[a0 a1 a2 a3],[mx.a0,mx.a1,mx.a2,mx.a3]);
y(t)=subs(ey,[b0 b1 b2 b3],[my.b0,my.b1,my.b2,my.b3]);
fplot(x,y,[t0 t2],'r','LineWidth',3);