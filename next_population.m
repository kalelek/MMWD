function pop_next = next_population(pop)
% parameters to connect: number_of_pairs (crossover), k - number of
% mutations
number_of_pairs = 24;
len_pop = length(pop);
costs = get(pop,'cost');
costs = [costs{:}]; % vector of double
max_el = max(costs);
costs2 = max_el - costs;% minimalization
suma = sum(costs2);
costs3 = cumsum(costs2);% suma== costs3(end)
rand_val = suma*rand(1,number_of_pairs);
index = zeros(1,number_of_pairs);% indexes determined by drawn rand_val
% first index is drawn with probability proportional to its quality
for k = 1:length(rand_val)
    index(k) = find(costs3 >= rand_val(k), 1); % i-th element to choose
end
index2 = ceil((len_pop-1)*rand(size(index))); 
% second element is drawn with uniform distribution
index2(index2==index)=len_pop;% getting rid of duplicates

for i = 1:number_of_pairs
   pop_next(1,2*i-1:2*i) = crossover(pop(index(i)),pop(index2(i))); 
end

% adding to next population best solutions form previous one
[sorted_costs, index_of_sort] = sort(costs,'ascend');%ascend unnecesery (default)
pop_next(1,2*number_of_pairs+1:len_pop)=pop(index_of_sort(1:len_pop-2*number_of_pairs));

% index
% index2
% costs
% index_of_sort
% next_costs=get(pop_next,'cost');
% next_costs = sort([next_costs{:}])
% sort(costs)

% mutation, draw k elements and mutate
k=12;
ind = ceil(len_pop*rand(1,k));
for i = ind
    pop_next(i).mutate()
end




