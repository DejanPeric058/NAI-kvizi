function vrednost = ZvezniSkalarni(f,g)
% Metoda za podani funkciji f in g vrne njun 
% zvezni skalarni produkt, se pravi 
% integral([0,2pi], g(x)f(x)dx)
s = @(x) f(x).*g(x);
vrednost = integral(@(x) s(x), 0, 2.*pi, 'AbsTol', 1e-14, 'RelTol',1e-14, "ArrayValued",true);

end