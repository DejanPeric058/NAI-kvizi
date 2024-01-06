function koeficienti = MNK(f, bazne_funkcije, skalarni)
% Metoda sprejme aproksimacijsko funkcijo f, bazne funkcije
% {f0, f1, ... , fn}, na katerih aproksimiramo in funkcijo
% skalarnega produkta
n = length(bazne_funkcije);
G = zeros(n);
d = zeros(1,n);
for i=1:n
    d(i) = skalarni(f, bazne_funkcije{i});
    for j=1:n
        G(i,j) = skalarni(bazne_funkcije{i}, bazne_funkcije{j});
    end
end
d = d';
[G, d]
obcutljivost = norm(inv(G)) .* norm(G)
koeficienti = G\d;
end