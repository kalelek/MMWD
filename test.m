function [sol, time, min_costs, max_costs, mean_costs, std_costs, min_costs2, max_costs2, mean_costs2, std_costs2, count_of_restrictions]=test(iter)
tic
[sol, min_costs, max_costs, mean_costs, std_costs, min_costs2, max_costs2, mean_costs2, std_costs2, count_of_restrictions]=algorithm(iter);
time=toc;
end