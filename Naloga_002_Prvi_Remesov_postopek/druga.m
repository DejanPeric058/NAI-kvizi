

c = 153./101;

f = @(x) x.*sin(2.*exp(c*x)-1);
stopnja = 3; % 4, 6, 8
koraki = 3;
a = -1;
b = 1;
vrednosti = RemesovPostopek(f,a,b,stopnja,koraki)
% napaka v diskretni normi je zadnji minimaks
X = linspace(-1, 1, 101);
Y = polyval(vrednosti,X);