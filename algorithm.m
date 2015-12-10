function [sol, min_costs, max_costs, mean_costs, std_costs]=algorithm(iter)
pop = generate_population();
costs = get(pop,'cost');
costs = [costs{:}];
% allocation
max_costs=zeros(1,iter);
mean_costs=zeros(1,iter);
std_costs=zeros(1,iter);
min_costs=zeros(1,iter);
% initialzation
max_costs(1)=max(costs);
mean_costs(1)=mean(costs);
std_costs(1)=std(costs); 
min_costs(1) = min(costs);
min_cost(1) = min_costs(1);
sol = find(costs==min_cost,1);
sol = pop(sol);
for i=1:iter
    pop = next_population(pop); 
    costs = get(pop,'cost');
    costs = [costs{:}];
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