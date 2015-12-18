function [sols,times,min,max,mean,std,rest]=short_test(iter)
    it=5;
    %sols=zeros(1,it);
    times=zeros(1,25);
    min=zeros(25,iter+1); % it- ile razy wykonujemy algorytm
    max=zeros(25,iter+1); % iter - ilosc iteracji w algorytmie
    mean=zeros(25,iter+1);
    std=zeros(25,iter+1);
    rest=zeros(25,iter+1);
    a=0;
    Algorithm_parameters;
    number_of_pairs = 10;
    number_of_pop=80;
    number_of_mutations = 10;
    %population=[50 80 110 140 170];
%     mutation=[5 10 15 20 25];
     crossover=[10 15 20 25 30];
    for i=1:5
        number_of_pairs = crossover(i);
        for k=1:it
            a=a+1;
            [sols, times(a), min(a,:), max(a,:), mean(a,:), std(a,:), rest(a,:)]=test(iter); 
        end
    end
end