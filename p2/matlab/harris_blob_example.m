
sample = imread('../frames/DaMultiview-seq7022.png');
harris_img = harris(sample, 90, 140, 100, 300);
colormap(gray);
corners = blob2px(harris_img, 50);

image(sample);
hold on;
for k = 1 : numel(corners) / 2
    plot(corners(1,k), corners(2,k), 'r*');
end
hold off;