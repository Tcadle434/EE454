% Load a sample image
load('CNNparameters.mat');
load('debuggingTest.mat');

imageset = zeros(32, 32, 3, 2);
imageset(:,:,:,1) = imrgb;
figure('name', 'Original'); imagesc(imrgb);

out = NeuralNetDemo(imageset, filterbanks, biasvectors, trueclass);