clear;
axis equal; hold on;
syms a0 a1 a2 a3 a4 t;
syms b0 b1 b2 b3 b4 t;
Px=[-2 6];Py=[-2 -2];
VektorX=[6 4];VektorY=[-4 4];
t0=0;t1=1;
plot(Px,Py,'b.','MarkerSize',20);
quiver(Px(1),Py(1),VektorX(1),VektorY(1),'g','MarkerSize',3);
quiver(Px(2),Py(2),VektorX(2),VektorY(2),'r','MarkerSize',3);
ex(t)=a3*t^3+a2*t^2+a1*t+a0;
ey(t)=b3*t^3+b2*t^2+b1*t+b0;
dex(t)=diff(ex,t);
dey(t)=diff(ey,t);
e1=[ex(t0)==Px(1)...
    ex(t1)==Px(2)...
    dex(t0)==VektorX(1)...
    dex(t1)==VektorX(2)];
e2=[ey(t0)==Py(1)...
    ey(t1)==Py(2)...
    dey(t0)==VektorY(1)...
    dey(t1)==VektorY(2)];
mx=solve(e1,[a0 a1 a2 a3]);
my=solve(e2,[b0 b1 b2 b3]);
x(t)=subs(ex,[a0 a1 a2 a3],[mx.a0,mx.a1,mx.a2,mx.a3]);
y(t)=subs(ey,[b0 b1 b2 b3],[my.b0,my.b1,my.b2,my.b3]);
fplot(x,y,[t0 t1],'r','LineWidth',3);