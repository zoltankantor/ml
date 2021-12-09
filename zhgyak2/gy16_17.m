clear;
hold on; axis equal;
syms t;
Px=[10 20 40 50 20]; Py=[20 40 40 20 10];
plot(Px,Py,'b.--','MarkerSize',20);
n=4; %pontok száma -1
x(t)=0*t;
y(t)=0*t;
for i=0:n
    b=nchoosek(n,i)*t^i*(1-t)^(n-i);
    x(t)=x(t)+b*Px(i+1);
    y(t)=y(t)+b*Py(i+1);
end
fplot(x,y,[0 1],'g','LineWidth',3);
dx(t)=diff(x,t);
dy(t)=diff(y,t);
quiver(Px(1),Py(1),dx(0),dy(0),'b','LineWidth',3);
quiver(Px(5),Py(5),dx(1),dy(1),'b','LineWidth',3);

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%5

Px2=[20 20]; Py2=[10-40]; Vx=[-60 60]; Vy=[-20 0];
plot(Px2,Py2, 'k.','MarkerSize',15);
t0=0;t1=1;
syms a0 a1 a2 a3 a4 b0 b1 b2 b3 t;
ex(t)=a3*t^3+a2*t^2+a1*t+a0;
ey(t)=b3*t^3+b2*t^2+b1*t+b0;
dex=diff(ex,t);
dey=diff(ey,t);
e1=[ex(t0)==Px2(1)...
    ex(t1)==Px2(2)...
    dex(t0)==Vx(1)...
    dex(t1)==Vx(2)];
e2=[ey(t0)==Py2(1)...
    ey(t1)==Px2(2)...
    dey(t0)==Vy(1)...
    dey(t1)==Vy(2)];
mx=solve(e1,[a0 a1 a2 a3]);
my=solve(e2,[b0 b1 b2 b3]);
x2(t)=subs(ex,[a0 a1 a2 a3],[mx.a0 mx.a1 mx.a2 mx.a3]);
y2(t)=subs(ey,[b0 b1 b2 b3],[my.b0 my.b1 my.b2 my.b3]);
fplot(x2,y2,[t0 t1],'y','LineWidth',3);