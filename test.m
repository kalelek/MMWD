function [sol, time, min_costs, max_costs, mean_costs, std_costs]=test(iter)
tic
[sol, min_costs, max_costs, mean_costs, std_costs]=algorithm(iter);
time=toc;
end