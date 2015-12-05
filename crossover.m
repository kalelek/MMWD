function [o1,o2]=crossover(obj1,obj2)

dm1 = obj1.data_matrix(); % data_matrix_1
dm2 = obj2.data_matrix();
n = get(obj1,'n');
m = get(obj2,'m');

if round(rand(1)) % probability 50%
    n_choose = draw_less_than(n-1);
    dm1_new = [dm1(1:n_choose, :); dm2(n_choose+1:end, :) ];
    dm2_new = [dm2(1:n_choose, :); dm1(n_choose+1:end, :) ];
else
    m_choose = draw_less_than(m-1);
    dm1_new = [dm1(:,1:m_choose), dm2(:,m_choose+1:end) ];
    dm2_new = [dm2(:,1:m_choose), dm1(:,m_choose+1:end) ];
end

o1 = bacteria(dm1_new);
o2 = bacteria(dm2_new);

end
function x = draw_less_than(n)
    x = ceil(n*rand(1));
end