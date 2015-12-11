function [simplified_matrix,car_solution,task_solution ]=simplify_solution_matrix(data_matrix)
    simplified_matrix=[];
    for i=1:size(data_matrix,1)
        if max(data_matrix(i,2:end))>0 && data_matrix(i,1)>0
            simplified_matrix=[simplified_matrix; data_matrix(i,:)];
        end
    end
    % car solution
    car_solution=zeros(1,max(simplified_matrix(:,1)));
    for i=1:size(simplified_matrix,1)
            car_solution(simplified_matrix(i,1))=car_solution(simplified_matrix(i,1))+1;
    end 
    % task solution
    task_solution=zeros(max(simplified_matrix(:,1)),size(data_matrix,2)-1);
    for i=2:size(simplified_matrix,2) %col
        for j=1:size(simplified_matrix,1) %row
            if simplified_matrix(j,i)==1
                task_solution(simplified_matrix(j,1),i-1)=task_solution(simplified_matrix(j,1),i-1)+1;
            end
        end
    end
end