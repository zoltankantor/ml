clear;
syms t;
hold on; axis equal;
px=[0 2]; py=[0 1];
r=1;r2=2;
plot(px(1),py(1),'g.','MarkerSize',20);
plot(px(2),py(2),'r.','MarkerSize',20);

k1x(t)=px(1)+r*cos(t);
k1y(t)=py(1)+r*sin(t);
fplot(k1x,k1y,[0 pi],'g','LineWidth',3);

k2x(t)=px(2)+r2*cos(t);
k2y(t)=py(2)+r2*sin(t);
fplot(k2x,k2y,[0 2*pi],'r','LineWidth',3);

syms u v;
e=[k1x(u)==k2x(v), k1y(u)==k2y(v), u>=0, u<=pi];
m=solve(e,[ u v]);
for i=1:length(m.u)
    M=[k1x(m.u(i)),k1y(m.u(i))];
    plot(M(1),M(2),'y.','MarkerSize',20);
end