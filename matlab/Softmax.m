function out = Softmax(in, D)
out = double(in);
a = max(in(1,1,:));
j = 1;
for k = 1:D
    out = exp(in(1,1,k)-a)/symsum(exp(in(1,1,k)-a),j,1,D);
end

    