function [vrednosti, m] = ResidualniPolinom(f, E)
% Izračuna polinom g stopnje največ n za katerega je 
% f-g = +-m, m>0 alternirajoče za točke iz seznama E.

n = length(E);
M = ones([n, n]);
for i=1:n-1
    M(:,i) =  E.^(i-1);
end
M(:, n) = ones(n, 1) .* (mod(1:n, 2) * 2 - 1)';        
b = f(E)';
x = linsolve(M,b);
m = x(n);
vrednosti = flip(x(1:n-1));
end

