function [y] = gmem(a, b, c, x)
for i = 1:length(x)
    y(i) = inv(1 + ((abs(x(i)-c)/a)^b));
end
end