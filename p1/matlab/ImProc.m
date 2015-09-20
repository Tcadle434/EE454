function thumbnailCell = ImProc(imageList)
    temp = size(imageList);
    numImages = temp(1);
    thumbnailCell = cell(numImages);
    for i = 1:numImages
        image = imread(imageList{i});
        figure; imagesc(image);
        thumbnail = imresize(image, [32 32]);
        thumbnailCell{i} = thumbnail;
    end
end
