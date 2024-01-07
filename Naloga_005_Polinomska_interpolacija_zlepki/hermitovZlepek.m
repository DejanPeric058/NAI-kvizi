function y = hermitovZlepek(f, df, ddf, X, x)
% Za funkcijo in njuna prva dva odvoda (f, df, ddf) ter 
% seznam delilnih točk X izračuna vrednosti odsekoma 
% polinomske funkcije stopnje 5 (zlepek stopnje 5), ki
% interpolira vrednosti in odvode v delilnih točkah.
% Izhod je seznam y, ki predstavlja vrednosti polinoma
% na seznamu x.

N = length(X);                                      % Dolzina seznama
y = [];
for i = 1:N-2
    vrednosti = x(x >= X(i) & x < X(i+1));          % Pogledamo katere vrednosti racunamo
    interpolacija = hermitovPolinom(f, df, ddf, X(i), X(i+1), vrednosti);   % Naredimo interpolacijo z metodo hermitovPolinom
    y = cat(2, y, interpolacija);                                           % Zdruzimo seznama
end
% Zadnjo vrednost pogledamo posebaj (zaradi <, <=)
vrednosti = x(x >= X(N-1) & x <= X(N));
interpolacija = hermitovPolinom(f, df, ddf, X(N-1), X(N), vrednosti);
y = cat(2, y, interpolacija);


end