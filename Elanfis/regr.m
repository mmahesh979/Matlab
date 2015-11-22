function [o1, est1, o2, est2] = regr(mf, train, test, val)
e1=1000;
e2=1000;
cp = 1;
for j = 1:length(cp)
    for i = 1:100
        [er1, er2, para, q1, q2,s1, s2] = ext(mf,train,test,cp(j));
            if er1<e1
                e1=er1;
                p1=para;
                pqr1 = q1;
            end
            if er2<e2
                e2=er2;
                p2=para;
                pqr2 = q2;
            end
    end

    [o1(j), est1(:,:,j)] = testeln(val, p1, mf, pqr1);
    [o2(j), est2(:,:,j)] = testeln(val, p2, mf, pqr2);

   

end
plot(cp,o1);

end