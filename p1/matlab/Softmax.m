function out = Softmax(in, D)
out = double(in);
a = max(in(1,1,:));
sum = 0;
for k = 1:D
    sum = sum+ exp(in(1,1,k)-a);
end
for k = 1:D
    out(1,1,k) = exp(in(1,1,k)-a)/sum;
end

    