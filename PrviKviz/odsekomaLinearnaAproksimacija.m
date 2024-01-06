function aproksimacija = odsekomaLinearnaAproksimacija(f,a,b,n,x)

% Funkcija odsekomaLinearnaAproksimacija izračuna aproksimacijo z odsekoma
% linearno preslikavo na intervalu [a, b] funkcije f. Pri tem vrne
% interpolacijo in napako ocenjeno po neskoncno normi

% Razdelimo interval
X = linspace(a, b, n+1);

% Definiramo bazne funkcije
H0 = @(x) max(0, min(1, (X(2)-x)./(X(2)-X(1)))); 
Hn = @(x) max(0, min(1, (x - X(end-1))./(X(end) - X(end-1))));
Hi = @(i, x) max(0, min(1, min((x-X(i))/(X(i+1)-X(i)),(X(i+2)-x)/(X(i+2)-X(i+1)))));

% Definiramo operator InF
InF = @(i, x) f(a + i*(b-a)/n) * Hi(i, x);

% Aproksimiramo, zanka je za 1:n-1, začetna in končna je ločeno
N = length(x);
aproksimacija = zeros(1,N);
aproksimacija = aproksimacija + f(X(1))*H0(x);
for i = 1:n-1
    aproksimacija = aproksimacija + InF(i, x);
end
aproksimacija = aproksimacija + f(X(end))*Hn(x);

end