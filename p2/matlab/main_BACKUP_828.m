
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

<<<<<<< HEAD
%fill file name array and find the starting rows for frames in the
%gtboxarray (this array holds all bounding box data for every window in
%each frame
for n = 1:numOfFrames
    if frameindex < 7200  %make sure number of trials and skip rate doesnt exceed highest indexed frame
        filename = strcat(filepath, num2str(frameindex));
        
        filename = strcat(filename, '.png');
        %disp(filename);
        filenameArr{end+1} = filename;
        disp(filenameArr(n));
        image = imread(filename);
        
    
        %search for desired frames
        r = 1;
        while(frameindex ~= gtboxarray(r,1))
            %disp(gtboxarray(r,1));
            r = r + 1;
        end
        sFrameArr = [sFrameArr r];  %starting index of data for image in gtboxarray
        disp(['starting row in gtboxarray for above frame: ', num2str(sFrameArr(n))]);
        
        frameindex = frameindex + frameSkipRate;
    end
end

%run harris corner and get corners for each window
%window is defined by column 2 in gtboxarray
%below code identifies which windows are shared between all selected frames
%if there is a common window then it runs harris on this window from each
%frame
message2 = 'running harris corners of matching windows of all frames:';
disp(message2);
firstFrameNum = gtboxarray(sFrameArr(1),1);
tempIndex = sFrameArr(1);
%disp(tempFrameNum);
while(gtboxarray(tempIndex,1) == firstFrameNum)
    %disp(gtboxarray(tempIndex,2));
    windowNumber = gtboxarray(tempIndex,2);
    %scan rest of frames for matching window number
    match = [];
    for p = 2:length(filenameArr)
        tempFrameNum = gtboxarray(sFrameArr(p),1);
        subIndex = sFrameArr(p);
        while(gtboxarray(subIndex,1) == tempFrameNum)
            if gtboxarray(subIndex,2) == windowNumber
                match = [match 1];
            end
            subIndex = subIndex + 1;
        end
    end
    %disp(match);
    %run harris corners on all frames if we have a complete window match
    if length(match) == (length(filenameArr) - 1)
        disp(['Run harris corners on selected frames(below) on window: ', num2str(windowNumber)]);
        for j = 1:length(filenameArr)
            tempFrameNum2 = gtboxarray(sFrameArr(j),1);
            subIndex2 = sFrameArr(j);
            while(gtboxarray(subIndex2,1) == tempFrameNum2)
                if gtboxarray(subIndex2,2) == windowNumber
                    disp(tempFrameNum2);
                    tXmin = gtboxarray(subIndex2,3);
                    tXmax = gtboxarray(subIndex2,5);
                    tYmin = gtboxarray(subIndex2,4);
                    tYmax = gtboxarray(subIndex2,6);
                    %disp(tYmax);
                    str = char(filenameArr(j)); %convert cell to string
                    image = imread(str);
                    harris(image,tXmin,tXmax,tYmin,tYmax);
                end
                subIndex2 = subIndex2 + 1;
            end
        end
    end
    tempIndex = tempIndex + 1;
end




    
    
=======
>>>>>>> master
