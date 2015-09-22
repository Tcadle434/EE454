% Load the data
load('cifar10testdata.mat');
load('CNNparameters.mat');
load('debuggingTest.mat');
load('exploratory_image_stuff.mat');


exploratoryResult = NeuralNet(testimageset, filterbanks, biasvectors, testtrueclass);

dims = size(exploratoryResult{1});
numImages = dims(1);

exploratoryResult{2} = zeros(11,11);
identifications = identify_exploratory(testtrueclass,exploratoryResult{1});


for i=1:numImages
    exploratoryResult{2}(identifications(1,i),identifications(2,i)) = ...
        1 + exploratoryResult{2}(identifications(1,i),identifications(2,i));
end

correctClass = 0;
for i=1:11
   correctClass = correctClass + exploratoryResult{2}(i,i); 
end

display(double(correctClass/numImages));

surf(exploratoryResult{2});

%{
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
%}