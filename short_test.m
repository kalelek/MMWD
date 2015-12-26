function [sols,times,min1,max1,mean1,std1,min2,max2,mean2,std2,rest]=short_test(iter)
    it=5;
    %sols=zeros(1,it);
    times=zeros(1,25);
    min1=zeros(25,iter+1); % it- ile razy wykonujemy algorytm
    max1=zeros(25,iter+1); % iter - ilosc iteracji w algorytmie
    mean1=zeros(25,iter+1);
    std1=zeros(25,iter+1);
    min2=zeros(25,iter+1); % it- ile razy wykonujemy algorytm
    max2=zeros(25,iter+1); % iter - ilosc iteracji w algorytmie
    mean2=zeros(25,iter+1);
    std2=zeros(25,iter+1);
    rest=zeros(25,iter+1);
    a=0;
    Algorithm_parameters;
    number_of_pairs = 22;
    number_of_pop=80;
    number_of_mutations = 10;
    %population=[50 80 110 140 170];
    mutation=[6 8 12 14 18 22];
    %crossover=[10 15 20 25 30];
    for i=1:5
        number_of_mutations = mutation(i);
        for k=1:it
            a=a+1;
            [sols, times(a), min1(a,:), max1(a,:), mean1(a,:), std1(a,:), min2(a,:), max2(a,:), mean2(a,:), std2(a,:) rest(a,:)]=test(iter); 
        end
    end
end