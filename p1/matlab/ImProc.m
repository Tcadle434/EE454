function testimageset = ImProc(imageList)
    temp = size(imageList);
    numImages = temp(1);
    image = imread(imageList{1});
    thumbnail = imresize(image, [32 32]);
    testimageset = thumbnail;
    for i = 2:numImages
        image = imread(imageList{i});
        thumbnail = imresize(image, [32 32]);
        testimageset = cat(4,testimageset,thumbnail);
    end
end
