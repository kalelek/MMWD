
%{
%create 2 bacteria
b1 = bacteria(5,5);
b2 = bacteria(5,5);
[b3,b4] = crossover(b1,b2);

% visualisation
b11=b1.data_matrix()
b22=b2.data_matrix()
b33=b3.data_matrix()
b44=b4.data_matrix()
% aaa=get([b1,b2],'binary')
% a=[aaa{:}]
% max(max(aaa{:}))
%}
k = 5;
k2 = 12;
b=bacteria(k,k);
tic
%b = repmat(b,1,k2)
for i = 2:k2
    b(i) = bacteria(k,k);
end
toc
%b2 = next_population(b);


