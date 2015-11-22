function [train, test, val] = datagen(data)
data = data(2:4:end,:);
for i = 1: length(data)
    if data(i,end) ==  1
        data(i,end) = 1;
    else
        data(i,end) = 0;
    end
end
test = data(1:3:end,:);
train = data(2:3:end,:);
val = data(3:3:end,:);
end
       