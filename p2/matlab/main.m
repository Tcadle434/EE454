%fill gtboxarray which has window information ie. max's and min's
parseGroundTruthSupressed;

%temp = gtboxarray(1,:);
%gtboxarray(1,:)=gtboxarray(2,:);
%gtboxarray(2,:)=temp;

numOfFrames = 2; %set number frames 
frameSkipRate = 1; %distance between next frame chosen, greater the distance more of a change of windows
frameindex = 7022;  %starting frame; range is 7024-7200s
filepath = '../frames/DaMultiview-seq';
threshold = 220;
alpha = 0.5;
cornerPatchSizeX = 6;
cornerPatchSizeY = 6;

[corners, sFrameArr] = phase1(numOfFrames, frameSkipRate, frameindex,...
    gtboxarray, filepath, threshold, alpha);

%{
harris_img = imread('../frames/DaMultiview-seq7022.png');
imshow(harris_img);

hold on
cs = corners{7};
for k = 1 : numel(cs) / 2
    plot(cs(1,k), cs(2,k), 'r*');
end
hold off;
%}

[cornerMatches, windowMatches] = matcher (corners, sFrameArr, numOfFrames,...
    gtboxarray, filepath, frameindex, cornerPatchSizeX, cornerPatchSizeY);


    