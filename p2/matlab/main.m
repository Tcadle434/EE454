
clc
%fill gtboxarray which has window information ie. max's and min's
parseGroundTruth;

numOfFrames = 3; %set number frames 
frameSkipRate = 1; %distance between next frame chosen, greater the distance more of a change of windows
frameindex = 7022;  %starting frame; range is 7024-7200s
filenameArr = {}; %filenames for selected frames 
sFrameArr = [];    %starting indexes of selected frame for gtboxarray
threshold = 40;
alpha = 0.15;

matchVals = phase1(numOfFrames, frameSkipRate, frameindex, gtboxarray, filenameArr, sFrameArr, threshold, alpha);

%boxes %corners
%{
i1[][]
i2[][]
i1boxes
i2boxes
cornerpatchx
cornerpatchy
%match up corners
    boxmatchmatrix = zeros(i1boxes,i2boxes);
    for b1 = 1:i1boxes
        for b2 = 1:i2boxes
            i1corners
            i2corners
            cornermatchmatrix = zeros(i1corner,i2corners);
            for c1 = 1:i1corners
               for c2 = 1:i2corners
                    ssd = SumOfSquareDifferences(i1(b1,c1),i2(b2,c2),...
                        cornerpatchx,cornerpatchy);
                    cornermatchmatrix(c1,c2) = ssd;
               end
            end
            [acorners,ccorners] = assignmentoptimal(cornermatchmatrix);
            boxmatchmatrix(b1,b2) = ccorners;
        end
    end
    [aboxes,cboxes] = assignmentoptimal(boxmatchmatrix);
    
 %}   