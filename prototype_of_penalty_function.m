%prototype of penalty function 
for j=1:col %col
    capacity=0;
    for i=1:row %row
        if obj.binary(i,j)>0    
            capacity=capacity+car_matrix(4,obj.types(i))   %check index in car_matrix
        end
    end
    if capacity<task_matrix(2,j) %check index in task_matrix
        value=value+10000000; %first option: add a constant large number
    end
end