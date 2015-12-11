
test = imread('test.jpg');
harris_img = harris(test, 1, 640, 1, 445);

d=linspace(min(harris_img(:)),max(harris_img(:)),256);
im_s = uint8(arrayfun(@(x) find(abs(d(:)-x)== min(abs(d(:)-x))), harris_img));
bw = im_s < 150;
bw = imcomplement(im_s);

% harris_img = im2bw(harris_img, 0.5);
colormap(gray);
imagesc(bw);

% s = regionprops(bw, 'Centroid');
% hold on;
% for k = 1:numel(s)
%     plot(s(k).Centroid(1), s(k).Centroid(2), 'r*')
% end
% hold off;