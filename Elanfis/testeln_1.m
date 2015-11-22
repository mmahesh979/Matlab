function [ erms ] = testeln( d , cntr, sprd, mf, pqr )
[r,c]=size(d);
for i=1:r
    for j=1:c-1
        for k=1:mf
            act(i,j,k) = (1+((d(i,j)-cntr(k,j))/sprd(k,j))^4)^(-1);
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

erms=rms(err);

end

