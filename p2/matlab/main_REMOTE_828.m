
clc
%fill gtboxarray which has window information ie. max's and min's
parseGroundTruthSupressed;

numOfFrames = 3; %set number frames 
frameSkipRate = 1; %distance between next frame chosen, greater the distance more of a change of windows
frameindex = 7022;  %starting frame; range is 7024-7200s
filenameArr = {}; %filenames for selected frames 
sFrameArr = [];    %starting indexes of selected frame for gtboxarray
threshold = 40;
alpha = 0.15;

matchVals = phase1(numOfFrames, frameSkipRate, frameindex, gtboxarray, filenameArr, sFrameArr, threshold, alpha);

