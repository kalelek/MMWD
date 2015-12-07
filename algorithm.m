pop = generate_population();
costs = get(pop,'cost');
costs = [costs{:}];
min_costs = min(costs);
min_cost = min_costs;
sol = find(costs==min_costs,1);
sol = pop(sol);
tic
for i=1:1000
    pop = next_population(pop); 
    costs = get(pop,'cost');
    costs = [costs{:}];
    min_costs(i+1) = min(costs);
    if min_cost>min_costs(i+1)
        min_cost = min_costs(i+1);
        sol = find(costs==min_cost,1);
        sol = pop(sol);
        sol = bacteria(sol.data_matrix());
        %get(sol,'cost')
    end
end
toc
plot(min_costs)
sol.data_matrix()
get(sol,'cost')