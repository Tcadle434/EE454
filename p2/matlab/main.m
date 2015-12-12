%Parameters
numOfFrames = 10; %set number frames 
frameSkipRate = 1; %frame comparison distance
frameindex = 7170;  %starting frame; range is 7022-7200
filepath = '../frames/DaMultiview-seq';
threshold = 235; %R threshold for harris corners
alpha = 255; %controls how you want to choose corners at random
                %small alpha makes corners with larger R's more 
                %likely to be selected
                %255 turns the "probability weighting" feature off
%size of the patches to use around corners when matching
cornerPatchSizeX = 12;
cornerPatchSizeY = 12;

%fill gtboxarray which has window information ie. max's and min's
parseGroundTruthSupressed;

%get boxes and features (harris corners)
[corners, sFrameArr] = phase1(numOfFrames, frameSkipRate, frameindex,...
    gtboxarray, filepath, threshold, alpha);



%match corners and match boxes
[cornerMatches, windowMatches] = matcher (corners, sFrameArr, numOfFrames,...
    gtboxarray, filepath, frameindex, cornerPatchSizeX, cornerPatchSizeY);




%Compute Accuracy
accuracy = Acurrator(windowMatches,gtboxarray,sFrameArr);
disp( sprintf( ...
    'Windows were correctly matched between sequential images %2.2f%% of the time.',...
    (accuracy)*100 ) );

%Ransac to get translations between matched windows
translations={};
translationsByWindow = {};
groundTruthTranslations;
for i=1:size(cornerMatches,2)
    disp(sprintf('running RANSAC on image pair: %d (frame %d to %d)'...
        ,i,gtboxarray(sFrameArr(i),1)-1,gtboxarray(sFrameArr(i),1)));
    for j=1:size(windowMatches{i},1)
        [data1,data2] = ransacWrapper(cornerMatches,windowMatches,i,j,...
            sFrameArr,gtboxarray,corners);
        [translations,translationsByWindow] = ransac(data1,data2,10000,2,...
            0.1,i,j,translations,translationsByWindow);
    end
    ransacDisplay(cornerMatches,windowMatches,i,sFrameArr,...
        gtboxarray,corners,translations);
end
    