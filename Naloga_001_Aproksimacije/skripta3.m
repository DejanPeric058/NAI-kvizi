
% Izberemo eno izmed aproksimacij --> 
    % bernsteinovaAproksimacija
    % kantorovicevaAproksimacija
    % odsekomaLinearnaAproksimacija

funkcija2 = @(x) cos(2*x);               % Funkcija, ki jo aproksimiramo
funkcija = @(x) abs(x).*cos(x.^2);     % Funkcija, ki jo aproksimiramo

n = 20;                    % Na koliko delov delimo interval
x = linspace(-1, 1, 11);    % Razdelimo interval
f = funkcija;               % Katero funkcijo aproksimiramo
a = -1; b = 1;              % Interval [a, b] na katerem aproksimiramo
aproksimacija = odsekomaLinearnaAproksimacija(f, a, b, n, x); % Izracunamo aproksimacijo
X = linspace(-1, 1, 201);   % Razdelimo na 201 delcek
napaka = max(abs(odsekomaLinearnaAproksimacija(f, a, b, n, X) - f(X)));     % Poracunamo napako


%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%% SKICIRANJE %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
 hold on
 x = linspace(-1, 1, 201);  
 plot(x, f(x), 'k')
 for i = 2:2:50 
     aproksimacija = kantorovicevaAproksimacija(f, a, b, i, x);
     plot(x, aproksimacija)
     pause(0.1)
 end
 hold off