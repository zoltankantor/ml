clear;
hold on; axis equal;
Px=[-2 4 6 10]; Py=[ -2 0 -2 2];
t0=-1; t1=0; t2=2; t3=3;
plot(Px,Py,'b.','MarkerSize',20);

syms a0 a1 a2 a3 t;
syms b0 b1 b2 b3;

ex(t)=a3*t^3+a2*t^2+a1*t+a0;
ey(t)=b3*t^3+b2*t^2+b1*t+b0;

e1=[ex(t0)==Px(1)...
    ex(t1)==Px(2)...
    ex(t2)==Px(3)...
    ex(t3)==Px(4)];

e2=[ey(t0)==Py(1)...
    ey(t1)==Py(2)...
    ey(t2)==Py(3)...
    ey(t3)==Py(4)];

mx=solve(e1,[a0 a1 a2 a3]);
my=solve(e2,[b0 b1 b2 b3]);

x(t)=mx.a3*t^3+mx.a2*t^2+mx.a1*t+mx.a0;
y(t)=my.b3*t^3+my.b2*t^2+my.b1*t+my.b0;

fplot(x,y,[t0 t3],'r','LineWidth',3);

dx(t)=diff(x,t);
dy(t)=diff(y,t);
quiver(x(2),y(2),dx(2),dy(2),'g','LineWidth',3);