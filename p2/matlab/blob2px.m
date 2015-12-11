function [ output_args ] = blob2px( img, threshold, alpha )
%BLOB2PX Takes an intensity image and computes blob centroids.
%   img:            The intensity image.
%   threshold:      Amount of thesholding to perform. Range [1-255]
%   alpha:          Percent of blob to consider a corner.
%   output_args:    Array containing pixel locations of corners.
%                   First elem is row idx, second elem is col idx.

output_args = [];

% Image scaling code adopted from:
% http://www.mathworks.com/matlabcentral/answers/66406-how-to-convert-a-double-matrix-image-to-a-unit8-matrix
d = linspace(min(img(:)),max(img(:)),256);
img_scaled = uint8(arrayfun(@(x) find(abs(d(:)-x)== min(abs(d(:)-x))), img));

img_scaled = pruneMatrixScaled(img_scaled, alpha);

% imagesc(img_scaled);

bw_img = img_scaled < threshold;
bw_img = imcomplement(bw_img);

% s = regionprops(bw_img, 'Centroid');
% 
% for k = 1 : numel(s)
%     px = zeros(2,1);
%     px(1,1) = s(k).Centroid(1);
%     px(2,1) = s(k).Centroid(2);
%     output_args = [output_args px];
% end

[rows,cols] = size(bw_img);
for i = 1 : rows
    for j = 1 : cols
        if (bw_img(i,j) == 1)
            px = zeros(2,1);
            px(1,1) = i;
            px(2,1) = j;
            output_args = [output_args px];
        end
    end
end

end

