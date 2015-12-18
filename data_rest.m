function vector=data_rest(rest)
vector=zeros(1,5)
temp=zeros(1,25);
for i=1:25
    temp(i)=mean(rest(i,:));
end
for k=1:5
    vector(k)=mean(temp((5*k-4):5*k));
end
