function out = NeuralNet(imageset, filterbanks, biasvectors, trueclass)

% Get the image metadata
dimImageSet = size(imageset);
numImages = dimImageSet(4);

% Create the output matrix
probOutput = zeros(numImages, 10);

% Create the classification matrix
% i - ground truth
% j - cnn output
classes = zeros(11, 11);

for i=1:numImages
    img = imageset(:,:,:,i);
    %img = imrgb; % CHANGE ME
    
    % Layer 1 - Normalize
    imgDim = size(img);
    img = ImNorm(img, imgDim(1), imgDim(2));
    
    % Layer 2 - Convolve
    img = convolve(img, filterbanks{2}, biasvectors{2});
    
    % Layer 3 - ReLU
    imgDim = size(img);
    img = ReLU(img, imgDim(1), imgDim(2), imgDim(3));
    
    % Layer 4 - Convolve
    img = convolve(img, filterbanks{4}, biasvectors{4});
    
    % Layer 5 - ReLU
    imgDim = size(img);
    img = ReLU(img, imgDim(1), imgDim(2), imgDim(3));
    
    % Layer 6 - Max Pool
    imgDim = size(img);
    img = Maxpool(img, imgDim(1), imgDim(2), imgDim(3));
    
    % Layer 7 - Convolve
    img = convolve(img, filterbanks{7}, biasvectors{7});
    
    % Layer 8 - ReLU
    imgDim = size(img);
    img = ReLU(img, imgDim(1), imgDim(2), imgDim(3));
    
    % Layer 9 - Convolve
    img = convolve(img, filterbanks{9}, biasvectors{9});
    
    % Layer 10 - ReLU
    imgDim = size(img);
    img = ReLU(img, imgDim(1), imgDim(2), imgDim(3));
    
    % Layer 11 - Max Pool
    imgDim = size(img);
    img = Maxpool(img, imgDim(1), imgDim(2), imgDim(3));
    
    % Layer 12 - Convolve
    img = convolve(img, filterbanks{12}, biasvectors{12});
    
    % Layer 13 - ReLU
    imgDim = size(img);
    img = ReLU(img, imgDim(1), imgDim(2), imgDim(3));
    
    % Layer 14 - Convolve
    img = convolve(img, filterbanks{14}, biasvectors{14});
    
    % Layer 15 - ReLU
    imgDim = size(img);
    img = ReLU(img, imgDim(1), imgDim(2), imgDim(3));
    
    % Layer 16 - Max Pool
    imgDim = size(img);
    img = Maxpool(img, imgDim(1), imgDim(2), imgDim(3));
    
    % Layer 17 - Fully Connected
    img = FuCd(img, filterbanks{17}, biasvectors{17});
    
    % Layer 18 - Soft Max
    imgDim = size(img);
    img = Softmax(img, imgDim(3));
    
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