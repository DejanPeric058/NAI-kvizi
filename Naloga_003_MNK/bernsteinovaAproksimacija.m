function aproksimacija = bernsteinovaAproksimacija(f,a,b,n,x)

% Funkcija bernsteinovaAproksimacija izračuna aproksimacijo z
% Bernsteinovimi polinomi na intervalu [a, b] funkcije f. Pri tem vrne
% aproksimirane vrednosti

% Definiramo Bernsteinov polinom B_i^n(x)
Bn = @(n, i, x) nchoosek(n, i) * ((x-a)/(b-a)).^i .* (1-((x-a)/(b-a))).^(n - i);

% Aproksimacija za F z Bernsteinovimi polinomi
BnF = @(n, i, x) f(a + (b-a)*i/n) * Bn(n, i, x);

N = length(x);
aproksimacija = zeros(1,N);
for i = 0:n
    aproksimacija = aproksimacija + BnF(n, i, x);
end

end
