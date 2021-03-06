function [ output_args ] = harris( img, xmin, xmax, ymin, ymax )
%HARRIS Uses Harris corner detection to compute corner-points in an image.
% The corner detection is run on a box in the image as specified by
% the function argument.
%   img:            The image on which to perform corner detection
%   xmin:           The starting x-coordinate of the box.
%   xmax:           The ending x-coordinate of the box.
%   ymin:           The starting y-coordinate of the box.
%   ymax:           The ending y-coordinate of the box.
%   output_args:    This variable will contain an intensity image - high
%                   intensity values correspond to corners in the image.

k = 0.07;

img = double(img);
img = (img(:,:,1) + img(:,:,2) + img(:,:,3))/3;

imgPatch = img(ymin:ymax, xmin:xmax);

s_x = [-1 0 1; -2 0 2; -1 0 1];
s_y = [-1 -2 -1; 0 0 0; 1 2 1];

i_x = imfilter(imgPatch, s_x, 'corr', 'replicate');
i_y = imfilter(imgPatch, s_y, 'corr', 'replicate');

i_x2 = i_x .* i_x;
i_y2 = i_y .* i_y;
i_xy = i_x .* i_y;

gauss = gausswin(25);
gauss = imfilter(gauss, gauss', 'full');

s_x2 = imfilter(i_x2, gauss);
s_y2 = imfilter(i_y2, gauss);
s_xy = imfilter(i_xy, gauss);

r = imgPatch;

for i = 1:(ymax - ymin + 1)
    for j = 1:(xmax - xmin + 1)
        h = [ s_x2(i, j) s_xy(i, j); s_xy(i, j) s_y2(i, j) ];
        t = trace(h);
        d = det(h);
        
        r(i, j) = d - k * t * t;
    end
end

output_args = r;

end

