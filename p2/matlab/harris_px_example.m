
threshold = 35;
alpha = 0.15;

sample = imread('../frames/DaMultiview-seq7022.png');
harris_img = harris(sample, 90, 140, 100, 300);

matrix = [];

for i = 1 : 10
    corners = blob2px(harris_img, threshold, alpha);
    num_points = numel(corners) / 2;
    c = {corners};
    matrix = [matrix c];
end