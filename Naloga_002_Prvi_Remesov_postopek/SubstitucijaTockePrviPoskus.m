function vrednosti = SubstitucijaTockePrviPoskus(f, vhodni_seznam, y)
% Funkcija sprejme seznam točk (x0, x1, ..., xn) in točko 
% y \in [x_i, x_(i+1)]. Sprejme še funkcijo f, ki alternira v predznaku
% po točkah v vhodnem seznamu. Če je sgn(f(x_i)) = sgn(f(y)), se zamenjata 
% ti dve točki, drugače drugi dve. Če je y med a in x0 oz xn in b je 
% treba malo drugače pogledati.

vrednosti = vhodni_seznam;
n = length(vhodni_seznam);
if y <= vhodni_seznam(1)
    if sign(f(y)) == sign(f(vhodni_seznam(1)))
        vrednosti(1) = y;
    else
        vrednosti = [y, vrednosti];
        vrednosti(end) = [];
    end
elseif y >= vhodni_seznam(end)
    if sign(f(y)) == sign(f(vhodni_seznam(end)))
        vrednosti(end) = y;
    else
        vrednosti = [vrednosti, y];
        vrednosti(1) = [];
    end
else
    for i = 2:n
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


end