function x=distribution_of_car(car_matrix)
   x=zeros(1,size(car_matrix,2));
   x(1)=car_matrix(1,1); 
   for i=2:size(car_matrix,2)
       x(i)=x(i-1)+car_matrix(1,i);
   end
end
%wektor rozk�adu smaochod�w
%dla wejscia=[1 3 5 4]
%otrzymujemy=[1 4 9 13]
%to znaczy samoch�d typu 4 znajduje si� w od 10 do 13 wierszu maciezy
%rozwi�za�
%a smochod typu 3 w od 4 do 9 wierszu macierzy rozwiazan