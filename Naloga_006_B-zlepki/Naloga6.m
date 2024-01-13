t = [0   0   0   0   2   4   6   8  10  10  10  10]; % seznam vozlov
c = [5  7  3  9  2  4  1  6]; % seznam koeficientov

x = linspace(0,10,21);
y = deBoor(t,c,x);

f = @(x) cos(2.*x);
g = @(x) abs(x).*cos(x.^2); 
a = -1;
b = 1;
n = 2; % 2, 4, 6, ... , 50
X = linspace(a,b,n+1);
y2 = QAproksimacija(a,b,g,n,X);



%%%%%%%%%% RAČUNANJE NAPAK %%%%%%%%%%%%
X_e = linspace(a,b,201);
for i = 2:2:20
    max(abs(g(X_e) - QAproksimacija(a,b,g,i,X_e))) 
end

%%%%%%%%%% RISANJE GRAFOV %%%%%%%%%%%%%
%X_r = linspace(a, b, 100);
%hold on
%xlabel('x')
%ylabel('y')
%c_r = QAproksimacija(a,b,f,n,X_r);
%plot(X_r,f(X_r))
%plot(X_r,c_r)
%hold off