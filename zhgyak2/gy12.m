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

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

dx(t)=diff(x,t);
dy(t)=diff(y,t);
dex(t)=diff(ex,t);
dey(t)=diff(ey,t);
Px2=[10 14];Py2=[2 -4];
VektorX2=[(dx(t3))/2,3];
VektorY2=[(dy(t3))/2,0];
t0=-1;t1=1;
plot(Px2,Py2,'k.','MarkerSize',20);
quiver(Px2(1),Py2(1),dx(t3),dy(t3),'y','MarkerSize',3);
quiver(Px2(2),Py2(2),VektorX2(2),VektorY2(2),'g','MarkerSize',3);

e3=[ex(t0)==Px2(1)...
    ex(t1)==Px2(2)...
    dex(t0)==VektorX2(1)...
    dex(t1)==VektorX2(2)];
e4=[ey(t0)==Py2(1)...
    ey(t1)==Py2(2)...
    dey(t0)==VektorY2(1)...
    dey(t1)==VektorY1(2)];
mx2=solve(e3,[a0 a1 a2 a3]);
my2=solve(e4,[b0 b1 b2 b3]);
x2(t)=subs(ex,[a0 a1 a2 a3],[mx2.a0,mx2.a1,mx2.a2,mx2.a3]);
y2(t)=subs(ey,[b0 b1 b2 b3],[my2.b0,my2.b1,my2.b2,my2.b3]);
fplot(x2,y2,[t0 t1],'y','LineWidth',3);