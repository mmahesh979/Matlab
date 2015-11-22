function [ o ] = fungen( cno, min, max )
for i = 1:cno
    c(i,1) = min+ (max-min)*rand();
    b(i,1) = 2;
    a(i,1) = (-min+max)*rand()/3;
end
o = [a,b,c];
end