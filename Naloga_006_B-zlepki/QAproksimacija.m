function y = QAproksimacija(a, b, f, n, X)


v = linspace(a,b,n+1);
t = [a, a, a, v, b, b, b];
y = zeros(size(X));
c = zeros(1,n+3);
c(1) = f(a);
c(2) = 1./18 .*(-5.*f(a) + 40.*f((a+v(2))./2) - 24.*f(v(2)) + 8.*f((v(2) + v(3))./2) - f(v(3)));
c(n+3) = f(b);
c(n+2) = 1./18 .*(-5.*f(b) + 40.*f((b+v(n))./2) - 24.*f(v(n)) + 8.*f((v(n) + v(n-1))./2) - f(v(n-1)));
for k = 3:n+1
    c(k) = 1./6 .* (f(v(k-2)) - 8.*f((v(k-2)+v(k-1))./2) + 20.*f(v(k-1)) - 8.*f((v(k-1)+v(k))./2) + f(v(k)));
end
for i = 1:length(X)
    x = X(i);
    vrednost = deBoor(t, c, x);
    y(i) = vrednost;
end


end