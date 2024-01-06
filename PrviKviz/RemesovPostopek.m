function koeficienti = RemesovPostopek(f, a, b, stopnja, k)
% Metoda sprejme funkcijo f, ki aproksimiramo, interval (a, b),
% na katerem aproksimiramo, stopnjo aprkosimativnega polinoma 
% in število korakov Remesovega postopka. V zameno vrne koeficiente
% aprkosimanta p(x) = a_0 + a_1 x + ... + a_n x^n

%E = linspace(a,b,stopnja+2);
E = [-1, -5./10, 0, 3./10, 1];
tol=10e-10;
for i=1:k
    [vrednosti, m] = ResidualniPolinom(f, E);
    r = @(x) f(x) - polyval(vrednosti, x);
    max_res = MaksimalnaAbscisa(r,a,b,1000);
    razlika = abs(r(max_res))-abs(m);
    [i, m, razlika]
    if razlika < tol
        break;
    end
    E = SubstitucijaTockePrviPoskus(r,E,max_res);
end
koeficienti = vrednosti;
end