function [o1, p, que, pred] = overlord(mf, train, test, val)
e1=1000;

cp =-10:20;
for j = 1:length(cp)
for i = 1:100
        [er1, para, q1, ~] = ext(mf,train,test,cp(j));
        if er1<e1
            e1=er1;
            p1=para;
            pqr1 = q1;
        end
%         if er2<e2
%             e2=er2;
%             p2=para;
%             pqr2 = q2;
%         end
disp(i)
end

[o1, est1] = testeln(val, p1, mf, pqr1);
% [o2, est2] = testeln(val, p2, mf, pqr2);

l= [round(est1), val(:,end)];
que(:,j) = est1;
for i = 1:length(l)
    if l(i,1) == l(i,2)
       p(i,j) = 1;
    else
       p(i,j) = 0;
    end
end

f(j) = sum(p(:,j));
disp(cp(j))
end
plot(cp,(100*f/114));
[~, index] = max(f);
pred = que(:,index);
end