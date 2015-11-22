function [erms1, p, pr1, y1] = ext(mf, d, test, cp)
[r, c] = size(d);
t = d(:,c);

for i = 1:(c-1)
    mi = min(d(:,i));
    ma = max(d(:,1));
    p(:,i,:) = fungen(mf, mi, ma);
end

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



[pqr1] = extreme1(d,wbar,cp);

for i = 1:length(cp)
    err1=(d(:,c)-finale(test,wbar,pqr1));
%     err2=(d(:,c)-finale(test,wbar,pqr2));
    erms1(i) = rms(err1);
%     erms2(i) = rms(err2);
end
% plot(cp, erms1);
% hold on 
% plot(cp, erms2);
[~,y1] = min(erms1);
% [~,y2] = min(erms2);
pr1 = pqr1(:,:,y1);
% pr2 = pqr2(:,:,y2);
end