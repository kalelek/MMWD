function x=type_of_car(row, distribution_of_car)
    x=0;
    for i=1:length(distribution_of_car)
        if row<=distribution_of_car(i) 
            x=i;
            break
        end
    end
end
% zwraca typ samochodu 