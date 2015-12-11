
sample = imread('../frames/DaMultiview-seq7022.png');
harris_img = harris(sample, 90, 140, 100, 300);
colormap(gray);
imagesc(harris_img);
corners = blob2px(harris_img, 45);

hold on;
for k = 1 : numel(corners) / 2
    plot(corners(1,k), corners(2,k), 'r*');
end
hold off;