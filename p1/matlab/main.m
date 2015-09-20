% Load the data
load('cifar10testdata.mat');
load('CNNparameters.mat');
load('debuggingTest.mat');

% Get the image metadata
dimImageSet = size(imageset);
numImages = dimImageSet(4);

for i=1:1 % CHANGE ME
    img = imrgb; % CHANGE ME
    
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
end

for classindex = 1:10
    %get indices of all images of that class
    inds = find(trueclass==classindex);
    %take first one
    imrgb = imageset(:,:,:,inds(1));
    %display it along with ground truth text label
    figure; 
    imagesc(imrgb);
    truesize(gcf,[64 64]);
    title(sprintf('\%s',classlabels{classindex}));
end

%sample code for looking at filterbanks and biases
for d = 1:length(filterbanks)
    filterbank = filterbanks(d);
   
    if not(isempty(filterbank))
        fprintf('layer %d has filters and biases\n',d);
        fprintf('     filterbank size %d x %d x %d\n',...
            size(filterbank,1),size(filterbank,2),...
            size(filterbank,3),size(filterbank,4));
        biasvec = viasvector(d);
        fprintf('       number of biases is %d\n',length(biasvec));
    end
end

%loading this file defines imrgb and layerResults
%sample code to show image and access expected results
figure;
imagesc(imrgb);
true(gcf,[64 64]);
for d = 1:length(layerResults)
        result=layerResults{d};
        fprintf('layer %d output is size %d x %d x %d\n',...
            d,size(reult,1),size(result,2),size(result,3));
end
%find most probable class
classprobvec=squeeze(layerResults{end});
[maxprob,maxclass] = max(classprobvec);
%note, classlabels is defined in 'cifar10testdata.mat'
fprintf('estimated class is %s with probability %.4f\n',...
    classlabels{maxclass},maxprob);


