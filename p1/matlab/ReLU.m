function out = ReLU(in, N, M, D)
out = double(in);
for i=1:N
    for j=1:M
        for k=1:D
            out(i,j,k) = max(in(i,j,k), 0);
        end
    end
end