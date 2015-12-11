function [ output_args ] = blob2px( img, threshold )
%BLOB2PX Takes an intensity image and computes blob centroids.
%   img:            The intensity image.
%   threshold:      Amount of thesholding to perform. Range [1-255]
%   output_args:    Array containing pixel locations of corners.
%                   First elem is row idx, second elem is col idx.

output_args = [];

% Image scaling code adopted from:
% http://www.mathworks.com/matlabcentral/answers/66406-how-to-convert-a-double-matrix-image-to-a-unit8-matrix
d = linspace(min(img(:)),max(img(:)),256);
img_scaled = uint8(arrayfun(@(x) find(abs(d(:)-x)== min(abs(d(:)-x))), img));

bw_img = img_scaled < threshold;
bw_img = imcomplement(bw_img);

imagesc(bw_img);
sum(sum(bw_img))
s = regionprops(bw_img, 'Centroid');

for k = 1 : numel(s)
    px = zeros(2,1);
    px(1,1) = s(k).Centroid(1);
    px(2,1) = s(k).Centroid(2);
    output_args = [output_args px];
end

end

