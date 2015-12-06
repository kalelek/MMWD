function pop = generate_population()
size_of_binary = 5;
number_of_pop = 20;
b=bacteria(size_of_binary,size_of_binary);

%b = repmat(b,1,k2)
for i = 2:number_of_pop
    b(i) = bacteria(size_of_binary,size_of_binary);
end

pop=b;