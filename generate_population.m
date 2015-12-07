function pop = generate_population()
size_of_binary = 20;
number_of_pop = 80;
b=bacteria(30,7);

%b = repmat(b,1,k2)
for i = 2:number_of_pop
    b(i) = bacteria(30,7);
end

pop=b;