function y = deBoor(t, c, X)
% deBoor izvede de Boorov postopek za računanje vrednosti linearne
% kombinacije z, ki je dolocena z B-zlepki stopnje k nad zaporedjem vozlov
% t in koeficienti iz seznama c. Metoda vrne seznam y z vrednostmi linearne
% kombinacije z v tockah iz vhodnega seznama X. 

N = length(t);                      % Dolocimo N po definiciji
n = length(c);                      % Dolocimo n po definiciji
k = N-n-1;                          % Izracunamo k

omega = @(i, m, x) (x - t(i))/(t(i+m)-t(i));    % Definiramo funkcijo omega s pomocjo katere racunamo vrednosti

y = zeros(size(X));                 % y je nas izhodni seznam
dolzina = length(X);                % to je dolzina nasega input seznama
for I = 1:dolzina
    x = X(I);                       % Katero vrednost racunmo
    j = find(t<=x, 1, 'last');      % Najdemo ustrezni indeks
    if x == t(end)                  % V tem primeru popravimo da je j = N - k - 1 = n
        j = n;
    end
    C = zeros(n, k+1);              % Pripravimo matriko za racunanje
    C(:, 1) = c;                    % Dolocimo prvi stolpec matrike
    for r = 1:k
        for i = j-k+r:j
            % Izracunamo naslednji koeficient v deBoorovem postopku
            C(i, r+1) = (1-omega(i, k+1-r, x))*C(i-1,r)+omega(i,k+1-r,x)*C(i,r);            
        end
    end
    y(I) = C(i, r+1);       % Ko zakljucimo dobimo ravno iskano vrednost
end



end

