
threshold = 35;
alpha = 0.15;

sample = imread('../frames/DaMultiview-seq7022.png');
figure;
harris_img = harris(sample, 90, 140, 100, 300);
colormap(gray);
imagesc(harris_img);
corners = blob2px(harris_img, threshold, alpha);

hold on;
for k = 1 : numel(corners) / 2
    plot(corners(2,k), corners(1,k), 'r*');
end
hold off;

sample2 = imread('../frames/DaMultiview-seq7022.png');
figure;
harris_img2 = harris(sample2, 90, 140, 100, 300);
colormap(gray);
imagesc(harris_img2);
corners2 = blob2px(harris_img2, threshold, alpha);

hold on;
for k = 1 : numel(corners2) / 2
    plot(corners2(2,k), corners2(1,k), 'r*');
end
hold off;