clear;
hold on;
axis equal;
grid on;
%%Bezier Gorbe
xlabel('x');
ylabel('y');

Px = [10 20 40 50 20];
Py = [20 40 40 20 10];
plot(Px, Py, '--*');

n = 4;
syms t;
t0 = 0;
t1 = 1;

x(t) = 0*t;
y(t) = 0*t;

for i=0:n
    b = nchoosek(n, i) * t^i * (1-t)^(n-i);
    x(t) = x(t) + Px(i+1) * b;
    y(t) = y(t) + Py(i+1) * b;
end

fplot(x, y, [t0 t1]);


v1 = [ n*(Px(2)-Px(1)), n*(Py(2)-Py(1))];
v2 = [ n*(Px(5)-Px(4)), n*(Py(5)-Py(4))];

quiver(Px(1), Py(1), v1(1), v1(2));
quiver(Px(5), Py(5), v2(1), v2(2));

hold off;