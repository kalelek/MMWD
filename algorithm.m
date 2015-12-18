%function [sol, min_costs, max_costs, mean_costs, std_costs, min_costs2, max_costs2, mean_costs2, std_costs2, count_of_restrictions]=algorithm(iter)
iter = 10;
pop = generate_population();
costs = get(pop,'cost');
costs = [costs{:}];
restrictions=get(pop,'restrictions');
restrictions=[restrictions{:}];
% allocation
max_costs=zeros(1,iter);
mean_costs=zeros(1,iter);
std_costs=zeros(1,iter);
min_costs=zeros(1,iter);
count_of_restrictions=zeros(1,iter);
max_costs2=zeros(1,iter);
mean_costs2=zeros(1,iter);
std_costs2=zeros(1,iter);
min_costs2=zeros(1,iter);
% initialzation
max_costs(1)=max(costs);
mean_costs(1)=mean(costs);
std_costs(1)=std(costs); 
min_costs(1) = min(costs);

% restrictions = 0 costs, parameters
rest2 = ones(1,length(restrictions))-restrictions;
if any(rest2==1)
    costs2 = costs(rest2 == 1);
else
    costs2 = inf;
end
max_costs2(1)=max(costs2);
mean_costs2(1)=mean(costs2);
std_costs2(1)=std(costs2); 
min_costs2(1) = min(costs2);%_2 parameters of elements that requirements
min_cost = min_costs2(1);

count_of_restrictions(1)=how_many_rest(restrictions);
sol = find(costs==min_cost,1);
sol = pop(sol);
for i=1:iter
    pop = next_population(pop); 
    restrictions=get(pop,'restrictions');
    restrictions=[restrictions{:}];
    costs = get(pop,'cost');
    costs = [costs{:}];
    rest2 = ones(1,length(restrictions))-restrictions;
    if any(rest2==1)
        costs2 = costs(rest2 == 1);
    else
        costs2 = inf;
    end
    count_of_restrictions(i+1)=how_many_rest(restrictions);
    min_costs(i+1)=min(costs);
    max_costs(i+1)=max(costs);
    mean_costs(i+1)=mean(costs);
    std_costs(i+1)=std(costs); 
    max_costs2(i+1)=max(costs2);
    mean_costs2(i+1)=mean(costs2);
    std_costs2(i+1)=std(costs2); 
    min_costs2(i+1) = min(costs2);  
    if min_cost>min_costs2(i+1)
        min_cost = min_costs2(i+1);
        sol = find( (costs==min_cost).*(restrictions==0),1);
        sol = pop(sol);
        sol = bacteria(sol.data_matrix());
        %get(sol,'cost')
    end
end

get(sol,'cost');
figure(1)
plot(min_costs)
figure(2)
plot(min_costs2)
[solution_matrix car_matrix task_matrix]=simplify_solution_matrix(sol.data_matrix())
get(sol,'cost')

%end
