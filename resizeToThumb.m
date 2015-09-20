RGB = imread('boat.jpg');
RGB2 = imresize(RGB, [32,32,3]);
imagesc(RGB);
