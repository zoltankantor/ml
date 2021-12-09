clear;
hold on; axis equal;
Px=[-2 6 10]; Py=[-2 -2 2]; Vektor=[6 -4]; %Pontok és vektor koordináták felvétele
t0=0; t1=1; t2=1.5;
plot(Px, Py, 'b.', 'MarkerSize', 20);
quiver(Px(1), Py(1), Vektor(1), Vektor(2), 'g', 'MarkerSize', 3)
syms a0 a1 a2 a3 t;    %Egyenlet bevezetése
ex(t)=a3*t^3+a2*t^2+a1*t+a0;
dx(t)=diff(ex, t); %Egyenlet deriválása
e1=[ex(t0)==Px(1) ...
   ex(t1)==Px(2) ... 
   ex(t2)==Px(3) ...
   dx(t0)==Vektor(1) ];
mx=solve(e1, [a0 a1 a2 a3]);
x(t)=subs(ex, [a0 a1 a2 a3], [mx.a0 mx.a1 mx.a2 mx.a3]);    %Behelyettesítés az eredeti egyenletbe
%%%%%%%%%%%%%%%% Y Koordináták %%%%%%%%%%%%%%%%
syms b0 b1 b2 b3;    %Egyenlet bevezetése
ey(t)=b3*t^3+b2*t^2+b1*t+b0;
dy(t)=diff(ey, t); %Egyenlet deriválása

e2=[ey(t0)==Py(1) ...
    ey(t1)==Py(2) ... 
    ey(t2)==Py(3) ...
    dy(t0)==Vektor(2) ];
my=solve(e2, [b0 b1 b2 b3]);
y(t)=subs(ey, [b0 b1 b2 b3], [my.b0 my.b1 my.b2 my.b3]);

fplot(x, y, [t0 t2], 'r', 'LineWidth', 3);

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
dx2=diff(x,t);
dy2=diff(y,t);
Px2=[Px(3) 14]; Py2=[Py(3) -4];
VektorX2=[dx2(t2) 3]; VektorY2=[dy2(t2) 0];
t0=0; t1=3;
plot(Px2,Py2,'b.','MarkerSize',20);
quiver(Px2(1),Py2(1),VektorX2(1),VektorY2(1),'k','MarkerSize',10);
quiver(Px2(2),Py2(2),VektorX2(2),VektorY2(2),'y','MarkerSize',10);
e3=[ex(t0)==Px2(1)...
    ex(t1)==Px2(2)...
    dx(t0)==VektorX2(1)...
    dx(t1)==VektorX2(2)];
e4=[ey(t0)==Py2(1)...
    ey(t1)==Py2(2)...
    dy(t0)==VektorY2(1)...
    dy(t1)==VektorY2(2)];
mx2=solve(e3,[a0 a1 a2 a3]);
my2=solve(e4,[b0 b1 b2 b3]);
x2(t)=subs(ex,[a0 a1 a2 a3],[mx2.a0,mx2.a1,mx2.a3,mx2.a3]);
y2(t)=subs(ey,[b0 b1 b2 b3],[my2.b0,my2.b1,my2.b2,my2.b3]);
fplot(x2,y2,[t0 t1],'k','LineWidth',3);