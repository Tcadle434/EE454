function [] = ShowImline(imgArray, figureName)

imgDim = size(imgArray);
figure('name', figureName)
imgline = imgArray(:,:,1);

hline = ones(imgDim(1), 1);

maxVal = max(max(max(imgArray)));

hline = hline.*maxVal;

imgline = horzcat(imgline, hline);

for p=2:imgDim(3)
    imgline = horzcat(imgline, imgArray(:,:,p));
    imgline = horzcat(imgline, hline);
end
imagesc(imgline); colormap('gray');
truesize;
    
end