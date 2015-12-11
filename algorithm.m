function [sol, min_costs, max_costs, mean_costs, std_costs, count_of_restrictions]=algorithm(iter)
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
% initialzation
max_costs(1)=max(costs);
mean_costs(1)=mean(costs);
std_costs(1)=std(costs); 
min_costs(1) = min(costs);
min_cost(1) = min_costs(1);
count_of_restrictions(1)=how_many_rest(restrictions);
sol = find(costs==min_cost,1);
sol = pop(sol);
for i=1:iter
    pop = next_population(pop); 
    costs = get(pop,'cost');
    costs = [costs{:}];
    restrictions=get(pop,'restrictions');
    restrictions=[restrictions{:}];
    count_of_restrictions(i+1)=how_many_rest(restrictions);
    min_costs(i+1)=min(costs);
    max_costs(i+1)=max(costs);
    mean_costs(i+1)=mean(costs);
    std_costs(i+1)=std(costs); 
    if min_cost>min_costs(i+1)
        min_cost = min_costs(i+1);
        sol = find(costs==min_cost,1);
        sol = pop(sol);
        sol = bacteria(sol.data_matrix());
        %get(sol,'cost')
    end
end
plot(min_costs)
sol.data_matrix()
get(sol,'cost')
end