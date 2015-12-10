function pop = generate_population()
%size_of_binary = 20; Variable unused.
number_of_pop = 80;
%b = repmat(b,1,k2)
for i = 1:number_of_pop
    b(i) = bacteria(30,7); % I tried hard to preallocate it, but nothing works...
end
pop=b;