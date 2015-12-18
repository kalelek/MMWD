function pop = generate_population()
global number_of_pop
global ROWS
global COLS
for i = 1:number_of_pop
    b(i) = bacteria(ROWS,COLS); % I tried hard to preallocate it, but nothing works...
end
pop=b;