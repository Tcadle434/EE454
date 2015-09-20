% Load the data
load('cifar10testdata.mat');
load('CNNparameters.mat');
load('debuggingTest.mat');

NeuralNet(imageset, filterbanks, biasvectors, trueclass);

surf(classes)

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