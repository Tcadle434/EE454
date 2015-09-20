function out = Maxpool(in, N, M, D)
out = zeros(N/2, M/2, D);
out = double(out);
    for i = 1:N/2
        for j = 1:M/2
            for k = 1:D
                out(i,j,k) = max(in(2*i-1,2*j-1,k),in(2*i-1,2*j,k),...
                    in(2*i,2*j-1,k),in(2*i,2*j,k));
            end
        end
    end
end