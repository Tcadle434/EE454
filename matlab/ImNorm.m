function out = ImNorm(in, N, M)
out = double(in);
for i=1:N
    for j=1:M
        for k=1:3
            out(i,j,k) = in(i,j,k)/255.0 - 0.5;
        end
    end
end
