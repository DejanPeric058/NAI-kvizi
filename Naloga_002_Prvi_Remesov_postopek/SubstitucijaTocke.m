function vrednosti = SubstitucijaTocke(f, vhodni_seznam, y)
% Funkcija sprejme seznam točk (x0, x1, ..., xn) in točko 
% y \in [x_i, x_(i+1)]. Sprejme še funkcijo f, ki alternira v predznaku
% po točkah v vhodnem seznamu. Če je sgn(f(x_i)) = sgn(f(y)), se zamenjata 
% ti dve točki, drugače drugi dve. Če je y med a in x0 oz xn in b je 
% treba malo drugače pogledati.

vrednosti = vhodni_seznam;
n = length(vhodni_seznam);

for i = 1:n
    if y < vhodni_seznam(i)
        if sign(f(y)) == sign(f(vhodni_seznam(i)))
            vrednosti(i) = y;
        else
            vrednosti(i-1) = y;
        end
        break
    end
end



end