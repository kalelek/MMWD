function [sols, times, min, max, mean, std]=short_test(it,iter)
    load car_and_task
    sols=zeros(1,it);
    times=zeros(1,it);
    min=zeros(it,iter); % it- ile razy wykonujemy algorytm
    max=zeros(it,iter); % iter - ilosc iteracji w algorytmie
    mean=zeros(it,iter);
    std=zeros(it,iter);
    global car_matrix;
    global task_matrix;
    for k=1:it
        [sol(k),times(k), min_costs(k,:), max_costs(k,:), mean_costs(k,:), std_costs(k,:)]=test(iter);      
    end
    end