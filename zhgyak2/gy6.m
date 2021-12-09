clear;
syms x y;
hold on;
f(x,y)=x^2-2*x*y+y^2+4*x-8*y+20;
g=-4*x+4;
fimplicit(f,'b');
fimplicit(g,'g');

eq=[f==0,g==0];
m=solve(eq,[x y]);
plot(m.x,m.y,'r.','MarkerSize',20);