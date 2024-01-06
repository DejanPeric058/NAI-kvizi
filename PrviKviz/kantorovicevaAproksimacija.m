function aproksimacija = kantorovicevaAproksimacija(f,a,b,n,x)

% Funkcija kantorovicevaAproksimacija izračuna aproksimacijo z
% Bernsteinovimi polinomi na intervalu [a, b] funkcije f. Pri tem vrne
% interpolacijo in napako ocenjeno po neskoncno normi

koeficient = @(n, i) (n+1)*integral(f, a + (b-a)*i/(n+1), a + (b-a)*(i+1)/(n+1))/2; % Po formuli ni deljeno 2 ampak sicer dobim dvakrat prevec

Bn = @(n, i, x) nchoosek(n, i) * ((x-a)/(b-a)).^i .* (1-((x-a)/(b-a))).^(n - i);    % Bernsteinov operator
KnF = @(n, i, x) koeficient(n, i) * Bn(n, i, x);    % Aproksimacija z Kantorivevim operatorjem

N = length(x);
aproksimacija = zeros(1,N);
for i = 0:n
    aproksimacija = aproksimacija + KnF(n, i, x);
end

end
