function [b] = tftoo(d)
b = [];
for i = 1:24:length(d)
for j = 1:24
temp(1,j) = d(i+j-1);
end
b = [b;temp];
end