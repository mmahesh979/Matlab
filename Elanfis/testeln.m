function [ erms, o ] = testeln( d , p, mf, pqr )
[r,c]=size(d);
for i = 1: (c-1)
    for j = 1:r
        for k = 1:mf
            act(j,i,k) = gmem(p(k,i,1), p(k,i,2), p(k,i,3), d(j,i));
        end
    end
end

w = prod(act, 2);
s = sum(w,3);

for i = 1:r
    for j = 1:mf
        wbar(i,j) = (w(i,1,j)/s(i));
    end
end

s=0;

err=(d(:,c)- finale(d,wbar,pqr));
o = finale(d,wbar,pqr);
erms=rms(err);

end

