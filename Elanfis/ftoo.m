function [l] = ftoo(load1)
l = [];
for i = 1:4:length(load1)
for j = 1:4
temp(j) = load1(i+j-1,:);
end
l = [l;sum(temp)];
end