%out - is the matrix result of Maxpool
%this funciton reduces in from an N X M X D
% to an N/2 X M/2 X D/2
function out = Maxpool(in, N, M, D)
%intialize result
out = zeros(N/2, M/2, D);
out = double(out);
%for each pixel in the result image
    for i = 1:N/2
        for j = 1:M/2
            for k = 1:D
                %take a max of the 4x4 pool
                vector=[in(2*i-1,2*j-1,k) in(2*i-1,2*j,k) in(2*i,2*j-1,k) in(2*i,2*j,k)];
                out(i,j,k) = max(vector);
            end
        end
    end
end