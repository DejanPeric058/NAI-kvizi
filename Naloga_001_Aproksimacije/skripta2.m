funkcija = @(x) cos(2*x);
funkcija2 = @(x) abs(x).*cos(x.^2);
N = 201;
X = linspace(-1, 1, N);
f = funkcija;
a = -1;
b = 1;
x = X;
Interpolacije = zeros(25, N);
Napake = zeros(1, 25);

[interpolacija, napaka] = odsekomaLinearnaAproksimacija(f,a,b,n,funkcija(x));
