% returns matrix out - the result of the rectified linear unit
% inputs: in - input image
%         N,M,D - dimensions of the input image
function out = ReLU(in, N, M, D)
out = double(in);
for i=1:N
    for j=1:M
        for k=1:D
            % any negative numbers become 0 in the output
            out(i,j,k) = max(in(i,j,k), 0);
        end
    end
end