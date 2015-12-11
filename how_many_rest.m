function count=how_many_rest(vector)
    count=0;
    for i=1:length(vector)
        if vector(i)==0
            count=count+1;
        end
    end
end