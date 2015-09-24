%returns matrix out - A vector of non-normalized probabilites.  Pass to softmax to normalize.
%img - The input image which will be fully connected to each filter.
%filter - An array of filters to apply to the image.
%biases - An array of biases to apply after the filter is applied.
function out = FuCd(img, filter, bias)

% Store the size of the parameters
img = double(img);
filter = double(filter);

img_size = size(img);
filter_size = size(filter);

n = img_size(1);
m = img_size(2);
d1 = img_size(3);

d2 = filter_size(4);

sum = 0;

% For each dimension, convolve the filter with the image.
for a=1:d2
    sum = 0;
for i=1:n
    for j=1:m
        for k=1:d1
            f_ijk = filter(i,j,k,a);
            i_ijk = img(i,j,k);
            sum = sum + f_ijk * i_ijk;
        end
    end
end
% Add the bias for the corresponding dimension.
    out(1,1,a) = sum + bias(a);
end
