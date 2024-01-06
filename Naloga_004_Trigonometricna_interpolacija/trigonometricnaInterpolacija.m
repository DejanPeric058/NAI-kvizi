function [y, koef] = trigonometricnaInterpolacija(f, a, b, n, x)
% Interpolacija funkcije f na 2n + 1 ekvidistantnih točkah, prva 
% tocka a, zadnja tocka b. N je stopnja trigonometricnega polinoma,
% x pa je seznam absic, na katerem računamo vrednosti trigonometricnega
% polinoma. Izracunane vrednosti x so v seznamu y. Koeficienti 
% (a0, ...an, b1, ..., bn)

phi = @(x) (x-a)/(b-a)*(2*pi*(2*n)/(2*n+1)); % Reparametrizacija na [0,2pi(2n/(2n+1))]
% Reparametrizacija je važna le za evaluacijo seznama x, ne vpliva nič za
% koeficiente
X = linspace(a,b,2.*n + 1);
fX = f(X);
%%%%%%%%% IZRAČUN KOEFICIENTOV c_k (TISTI ZRAVNE e-JEV) %%%%%%%
koefC = zeros(1, 2.*n + 1);
for k = -n:n % izračun c_-n do c_n po formuli iz vaj za c_k
    vsota = 0;
    for j = 0:2*n
        vsota = vsota + fX(j+1).*exp(-2.*pi.*1i.*j.*k./(2.*n+1));
    end
    vsota = vsota ./ (2.*n+1);
    koefC(k+n+1) = vsota;
end
%%%%%%%%% IZRAČUN KOEFICIENTOV a_k, b_k (TISTI ZRAVEN COS IN SIN) %%%%%%%
koef = zeros(1, 2.*n + 1); % imamo (a_0, a_1, ..., a_n, b_1, ..., b_n)
sred = n + 1;
koef(1) = koefC(sred); % c_0 = a_0 prosti koeficient
for j = 1:sred-1
    koef(j+1) = koefC(sred + j) + koefC(sred - j);% a_k = c_k + c_-k
    koef(sred+j) = 1i*(koefC(sred + j) - koefC(sred - j));
    % b_k = (c_-k - c_k)/i = i*(c_k - c_-k)
end
%%%%%%%%% EVALUACIJA SEZNAMA X %%%%%%%%%%%%%%%%%%%%%%%%%%%%
N = length(x);
y = zeros(1, N); 
for j = 1:N
    z = phi(x(j)); % vzamemo reparametriziran x
    vsota = koef(1);
    for k = 1:n
        vsota = vsota + koef(k+1).*cos(k.*z) + koef(sred+k).*sin(k.*z);
    end
    y(j) = vsota;
end
end