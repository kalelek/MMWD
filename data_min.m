function vector=data_min(minimum)
asfalt=zeros(1,25);
for i=1:25
    asfalt(i)=min(minimum(i,:));
end
vector=zeros(1,5);
for i=1:5
    vector(i)=mean(asfalt((5*i-4):(5*i)));
end
end
