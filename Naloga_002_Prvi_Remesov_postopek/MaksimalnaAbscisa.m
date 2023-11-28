function abscisa = MaksimalnaAbscisa(r,a,b,N)
% Funkcija sprejme interval (a,b), funkcijo 
% residuala r in število ekvidistančnih točk (default 1000), 
% na katerih iščemo pri kateri točki dobimo max|r(x)|.
% x_i = a + i(b-a)/N; i = 0, 1, ..., N
% TODO


abscisa = a;
max_value = r(a);
for k = 1:N+1
    x = a + (k-1).*(b-a)./N;
    value = abs(r(x));
    if max_value < value
        abscisa = x;
        max_value = value;
    end
end
end