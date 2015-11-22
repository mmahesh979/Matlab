function [p] =  comp(d1, d2)
d = [round(d1(:,end)), d2(:,5)];
for i = 1:length(d)
    if d(i,1) == d(i,2)
       p(i) = 1;
    else
         p(i) = 0;
    end
end

end
         