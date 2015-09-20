function out = NeuralNetDemo(imageset, filterbanks, biasvectors, trueclass)

% Get the image metadata
dimImageSet = size(imageset);
numImages = dimImageSet(4);

% Create the output matrix
probOutput = zeros(numImages, 10);

% Create the classification matrix
% i - ground truth
% j - cnn output
classes = zeros(10, 10);

for i=1:numImages
    img = imageset(:,:,:,i);
    %img = imrgb; % CHANGE ME\
    
    % Layer 1 - Normalize
    imgDim = size(img);
    img = ImNorm(img, imgDim(1), imgDim(2));
    figure('name', 'Layer 1'); imagesc(img);
    
    % Layer 2 - Convolve
    img = convolve(img, filterbanks{2}, biasvectors{2});
    
    % Layer 3 - ReLU
    imgDim = size(img);
    
    figure('name', 'Layer 2');
    imgline = img(:,:,1);
    for p=2:imgDim(3)
        imgline = horzcat(imgline, img(:,:,p));
    end
    imagesc(imgline); colormap('gray');
    truesize;
    
    img = ReLU(img, imgDim(1), imgDim(2), imgDim(3));
    figure('name', 'Layer 3'); imagesc(img);
    
    % Layer 4 - Convolve
    img = convolve(img, filterbanks{4}, biasvectors{4});
    figure('name', 'Layer 4'); imagesc(img);
    
    % Layer 5 - ReLU
    imgDim = size(img);
    img = ReLU(img, imgDim(1), imgDim(2), imgDim(3));
    figure('name', 'Layer 5'); imagesc(img);
    
    % Layer 6 - Max Pool
    imgDim = size(img);
    img = Maxpool(img, imgDim(1), imgDim(2), imgDim(3));
    figure('name', 'Layer 6'); imagesc(img);
    
    % Layer 7 - Convolve
    img = convolve(img, filterbanks{7}, biasvectors{7});
    figure('name', 'Layer 7'); imagesc(img);
    
    % Layer 8 - ReLU
    imgDim = size(img);
    img = ReLU(img, imgDim(1), imgDim(2), imgDim(3));
    figure('name', 'Layer 8'); imagesc(img);
    
    % Layer 9 - Convolve
    img = convolve(img, filterbanks{9}, biasvectors{9});
    figure('name', 'Layer 9'); imagesc(img);
    
    % Layer 10 - ReLU
    imgDim = size(img);
    img = ReLU(img, imgDim(1), imgDim(2), imgDim(3));
    figure('name', 'Layer 10'); imagesc(img);
    
    % Layer 11 - Max Pool
    imgDim = size(img);
    img = Maxpool(img, imgDim(1), imgDim(2), imgDim(3));
    figure('name', 'Layer 11'); imagesc(img);
    
    % Layer 12 - Convolve
    img = convolve(img, filterbanks{12}, biasvectors{12});
    figure('name', 'Layer 12'); imagesc(img);
    
    % Layer 13 - ReLU
    imgDim = size(img);
    img = ReLU(img, imgDim(1), imgDim(2), imgDim(3));
    figure('name', 'Layer 13'); imagesc(img);
    
    % Layer 14 - Convolve
    img = convolve(img, filterbanks{14}, biasvectors{14});
    figure('name', 'Layer 14'); imagesc(img);
    
    % Layer 15 - ReLU
    imgDim = size(img);
    img = ReLU(img, imgDim(1), imgDim(2), imgDim(3));
    figure('name', 'Layer 15'); imagesc(img);
    
    % Layer 16 - Max Pool
    imgDim = size(img);
    img = Maxpool(img, imgDim(1), imgDim(2), imgDim(3));
    figure('name', 'Layer 16'); imagesc(img);
    
    % Layer 17 - Fully Connected
    img = FuCd(img, filterbanks{17}, biasvectors{17});
    figure('name', 'Layer 17'); imagesc(img);
    
    % Layer 18 - Soft Max
    imgDim = size(img);
    img = Softmax(img, imgDim(3));
    figure('name', 'Layer 18'); imagesc(img);
    
    % Map the output
    probOutput(i,:) = img;
    
    % Add to the confusion matrix...
    [maxValue, indexValue] = max(img);
    
    tmp = classes( trueclass(1,i) , indexValue );
    classes( trueclass(1,i) , indexValue ) = tmp + 1;
    
    display(i); % Keep track of the iteration.
end

out = { probOutput, classes };

end