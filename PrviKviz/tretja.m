c = 362./101;

f = @(x) exp(sin((x.^2)./16));
a = 0;
b = 2*pi;
X = linspace(a,b,101);
norma = @ (f,p) sqrt(DiskretniSkalarni(@(x) f(x)-p(x),@(x) f(x)-p(x), 20, c));

Bn = @(n, i, x) nchoosek(n, i) * (x).^i .* (1-x).^(n - i);
n = 4;
F = cell(1,n+1);
F{1} = @(x) Bn(n,0,x);
F{2} = @(x) Bn(n,1,x);
F{3} = @(x) Bn(n,2,x);
F{4} = @(x) Bn(n,3,x); 
F{5} = @(x) Bn(n,4,x);

zvezni = @(g,h) ZvezniSkalarni(g,h);
diskretni = @(g,h) DiskretniSkalarni(g,h,20,c);
koef = MNK(f, F,diskretni)
sum(koef)
Y = polyval(flip(koef),X);

p1 = @(x) koef(1) + koef(2) * x + koef(3) * x.^2 + koef(4) * x.^3 + koef(5) * x.^4;

norma2 = norma(f,p1)

n = 4;
k = sqrt(pi);
H = cell(1,n+1);
H{1} = @(x) 1./(sqrt(2).*k);
H{2} = @(x) cos(x)./k;
H{3} = @(x) sin(x)./k;
H{4} = @(x) cos(2.*x)./k; 
H{5} = @(x) sin(2.*x)./k;

koef = MNK(f, H,diskretni)
p2 = @(x) koef(1) * 1./(sqrt(2).*k) +koef(2) * cos(x)./k +koef(3) * sin(x)./k +koef(4) * cos(2.*x)./k +koef(5) * sin(2.*x)./k;
norma2 = norma(f,p2)


% Nariši še trigonometrične
%%%%%%%%%%%% SKICIRANJE %%%%%%%%%%%%%
%hold on
%
%plot(X,f(X))
%plot(X,Y)
%plot(X,p2(X))