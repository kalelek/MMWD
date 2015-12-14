function pop = generate_population()
%size_of_binary = 20; Variable unused.
global number_of_pop
global ROWS
global COLS
%b = repmat(b,1,k2)
for i = 1:number_of_pop
    b(i) = bacteria(ROWS,COLS); % I tried hard to preallocate it, but nothing works...
end
pop=b;