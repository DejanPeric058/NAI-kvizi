function [y, diference] = hermitovPolinom(f, df, ddf, a, b, x)
% Za funkcijo in njuna prva dva odvoda (f, df, ddf) in 
% točki a in b izračuna vrednosti polinoma stopnje 5, ki 
% interpolira vrednosti funkcije in odvodov v podanih točkah 
% (a in b). Izhod y so izračunane vrednosti polinoma v točkah x.
% fa    0       0       0       0       0
% fa    dfa     0       0       0       0
% fa    dfa     ddfa    0       0       0
% fb    *       *       *       0       0
% fb    dfb     *       *       *       0
% fb    dfb     ddfb    *       *       *
% %%%%%%%%%%%%%%%%%% RAČUNANJE DIFERENC %%%%%%%%%%%%%%%%%%%%%
X = [a a a b b b];
diference = zeros(6);
diference(:,1) = f(X);
for j = 2:6
    for i = j:6
        if X(i) == X(i-j+1)
            if j == 2
                diference(i,j) = df(X(i));
            elseif j == 3
                diference(i,j) = ddf(X(i))./2;
            end
        else
            diference(i,j) = (diference(i,j-1) - diference(i-1,j-1))./(X(i)-X(i-j+1));
        end
    end
end
%%%%%%%%%%%%%%%%% RAČUNANJE VREDNOSTI POLINOMA %%%%%%%%%%%%%%
N = length(x);
y = zeros(1,N);
for j = 1:N
    vrednost = diference(6,6);
    for i = 6-1:-1:1
        vrednost = diference(i,i) + (x(j)-X(i)).*vrednost;
    end
    y(j) = vrednost;
end
end