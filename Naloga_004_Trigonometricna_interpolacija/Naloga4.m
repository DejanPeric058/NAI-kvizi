
f = @(x) (cos(x)).^4;
g = @(x) f(x) + exp(-x);
n = 2; % 1, 2, 3, 4   stopnja trigonometričnega polinoma

a = 0;
b = 5; %2 .* pi .* ((2 .* n)./(2 .* n + 1));

%X = linspace(0, 2*pi*(2*n)/(2*n+1), 201); % a primer
X = linspace(0, 5, 201); % b primer

[vrednosti,koeficienti] = trigonometricnaInterpolacija(g,a,b,n,X);
koeficienti
napaka = max(abs(vrednosti-g(X))) 
x = linspace(a, b, 2*n+1); % seznam da se lahko polyfit interpolacija izvede
e = polyval(polyfit(x,g(x),2*n),X); % polinomska interpolacija za primerjavo
napaka2 = max(abs(e-g(X))) % napaka pri polinomski interpolaciji
%%%%%%%%%% RISANJE GRAFOV %%%%%%%%%%%%%
%X = linspace(a, b, 100);
%hold on
%xlabel('x')
%ylabel('y')
%plot(X,g(X))
%plot(X,vrednosti)
%plot(X,e)
%legend('g', 'c', 'e')
%hold off

