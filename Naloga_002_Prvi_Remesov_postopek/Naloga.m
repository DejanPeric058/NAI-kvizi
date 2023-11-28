
f = @(x) abs(x).*sin(2.*exp(1.5*x)-1);
stopnja = 8; % 4, 6, 8
koraki = 1000;
a = -1;
b = 1;
vrednosti = RemesovPostopek(f,a,b,stopnja,koraki)
% napaka v diskretni normi je zadnji minimaks
X = linspace(-1, 1, 101);
Y = polyval(vrednosti,X);

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%% RISANJE %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

 hold on 
 plot(X, Y);
 plot(X, f(X));
 hold off