function   value=objective_function(solution_matrix,car_matrix,task_matrix,distribution_of_car)
    value=0;
    row=size(solution_matrix,1); % wiersze
    col=size(solution_matrix,2); %kolumny
    max_row=max(solution_matrix,[],2);% maksymalna wartoœc w wiersze
    for i=1:row %sumowanie kosztów pojazdów
        if max_row(i)>0
            car=type_of_car(i,distribution_of_car); % typ samochodu
            value=value+car_matrix(2,car); %dodaje koszt pojazdu
        end
    end
    for i=1:row % leci po ca³ej macierzy sprawdzajac czy komorki sa 1 jesli tak dodajemy koszt przejazdu
        for j=1:col
            if solution_matrix(i,j)==1
                car=type_of_car(i,distribution_of_car); %ustawiam typ pojazdów 
                value=value+car_matrix(3,car)*task_matrix(1,j); %dodajemy koszt drogi
            end
        end
    end
    
end
