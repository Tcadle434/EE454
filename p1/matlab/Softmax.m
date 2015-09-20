% returns matric out - the result of the softmax
% inputs: in - input image
%         D - third dimension of the input image
function out = Softmax(in, D)
out = double(in);
% calculate maximum across all values in the input
a = max(in(1,1,:));
sum = 0;
for k = 1:D
    sum = sum+ exp(in(1,1,k)-a);
end
for k = 1:D
    % normalize all values to be between 0 and 1 and sum to 1
    out(1,1,k) = exp(in(1,1,k)-a)/sum;
end

    