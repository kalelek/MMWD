function [sol, time, min_costs, max_costs, mean_costs, std_costs, count_of_restrictions]=test(iter)
tic
[sol, min_costs, max_costs, mean_costs, std_costs, count_of_restrictions]=algorithm(iter);
time=toc;
end