f = @(x) exp(-x.^2);
df = @(x) -2.*x .* exp(-x.^2);
ddf = @(x) 2*exp(-x.^2).*(2*x.^2-1);
a = -1;
b = 4;
n = 4; % 2, 4, 8, 16, 32, 64, 128, 256 
x = linspace(a, b, 11); % za računanje vrednosti y
X = linspace(a, b, n+1); % delilne točke za zlepke


y1 = hermitovPolinom(f,df,ddf,a,b,x);
y2 = hermitovZlepek(f,df,ddf,X,x);
%%%%%%%%% RAČUNANJE NAPAK %%%%%%%%%%%%%
X_e = linspace(a, b, 1001); % za računanje napak
napake = zeros(1,9);
for i = 0:8
    m = 2.^i;
    Xs = linspace(a, b, m+1);
    napaka = max(abs(f(X_e)-hermitovZlepek(f,df,ddf,Xs,X_e)));
    napake(i+1) = napaka;
end
napake
%%%%%%%%%% RISANJE GRAFOV %%%%%%%%%%%%%
%X_r = linspace(a, b, 100);
%hold on
%xlabel('x')
%ylabel('y')
%c_r = hermitovPolinom(f,df,ddf,a,b,X_r);
%plot(X_r,f(X_r))
%plot(X_r,c_r)
%plot(X_r,hermitovZlepek(f,df,ddf,X,X_r))
%hold off
