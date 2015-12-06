function [ output_args ] = harris( img, xmin, xmax, ymin, ymax )
%HARRIS Summary of this function goes here
%   Detailed explanation goes here

img = rgb2gray(img);
img = double(img);

imgPatch = img(ymin:ymax, xmin:xmax);

s_x = [-1 0 1; -2 0 2; -1 0 1];
s_y = [-1 -2 -1; 0 0 0; 1 2 1];

i_x = imfilter(imgPatch, s_x);
i_y = imfilter(imgPatch, s_y);

i_x2 = i_x .* i_x;
i_y2 = i_y .* i_y;
i_xy = i_x .* i_y;

colormap(gray);
imagesc(i_xy);

end

