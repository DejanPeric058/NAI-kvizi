
% Izberemo eno izmed aproksimacij --> 
    % bernsteinovaAproksimacija
    % kantorovicevaAproksimacija
    % odsekomaLinearnaAproksimacija

c = 214/101;
funkcija = @(x) c*sin(c*x) + 5;               % Funkcija, ki jo aproksimiramo


n = 4;                    % Na koliko delov delimo interval
x = linspace(-1, 1, 11);    % Razdelimo interval
f = funkcija;               % Katero funkcijo aproksimiramo
a = 0; b = 2;              % Interval [a, b] na katerem aproksimiramo
aproksimacija = kantorovicevaAproksimacija(f, a, b, n, 1) % Izracunamo aproksimacijo
X = linspace(0, 2, 1001);   % Razdelimo na 201 delcek
g = @(x) 1./4.*f(x./2 - 1./2) +1./2.*f(x./2)+1./4.*f(1./2 + x./2);
napaka = max(abs(odsekomaLinearnaAproksimacija(f, a, b, n, X) - g(X)))     % Poracunamo napako


%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%% SKICIRANJE %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%hold on
%x = linspace(-1, 1, 201);  
%plot(x, f(x), 'k')
%for i = 2:2:50 
%    aproksimacija = kantorovicevaAproksimacija(f, a, b, i, x);
%    plot(x, aproksimacija)
%    pause(0.1)
%end
%hold off