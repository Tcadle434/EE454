% returns matrix out - the result of the image normalization
% inputs: in - image to be normalized
%         N and M - dimensions of input image
function out = ImNorm(in, N, M)
in = double(in);
out = double(in);
for i=1:N
    for j=1:M
        for k=1:3
            % normalize
            out(i,j,k) = in(i,j,k)/255.0 - 0.5;
        end
    end
end
