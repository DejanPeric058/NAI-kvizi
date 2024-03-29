function vrednost = DiskretniSkalarni(g, h, N,c)
% Metoda za dani funkciji g in h izračuna diskretni
% skalarni produkt 1/(N+1) sum(0,N,g(2pi*i/N)*f(2pi*i/N).

X = linspace(0, c, N+1);
vrednost = 0;                           % Poracunamo skalarni produkt po definiciji
for i = 1:N+1
    vrednost = vrednost + g(X(i)) * h(X(i));
end
vrednost = vrednost ./ (N+1);
end