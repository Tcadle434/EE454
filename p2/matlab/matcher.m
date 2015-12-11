function [ cornerMatches, windowMatches ] = matcher( corners, sFrameArr, numOfFrames, ...
    gtboxarray, filepath, frameindex, cornerpatchx, cornerpatchy)

    %cornerMatches = [];%zeros(numOfFrames-1);
    %windowMatches = [];%zeros(numOfFrames-1);
    
%match up corners
    for frame = 1:numOfFrames-1
    frame1 = frame;
    frame2 = frame+1;
    frame1boxstart = sFrameArr(frame1);
    frame2boxstart = sFrameArr(frame2);
    %number of boxes
    i1boxes = frame2boxstart - frame1boxstart;
    if frame ~= numOfFrames-1
        i2boxes = sFrameArr(frame2+1) - frame2boxstart;
    else
        r = frame2boxstart;
        while(frameindex+frame == gtboxarray(r,1))
            r = r + 1;
        end
        i2boxes = r-frame2boxstart;
    end
    boxmatchmatrix = zeros(i1boxes,i2boxes);
    
    filename = strcat(filepath, num2str(frameindex+frame-1));
    filename = strcat(filename, '.png');
    i1 = imread(filename);
    filename = strcat(filepath, num2str(frameindex+frame));
    filename = strcat(filename, '.png');
    i2 = imread(filename);
    
    %cornerMatchesByWindow;% = [];%zeros(i1boxes,i2boxes);
    
        for b1 = 1:i1boxes
            for b2 = 1:i2boxes
                %w1 and w2 are the windows
                w1 = gtboxarray(frame1boxstart+b1-1,:);
                w2 = gtboxarray(frame2boxstart+b2-1,:);
                %number of corners
                dim1 = size(corners{frame1boxstart+b1-1});
                dim2 = size(corners{frame2boxstart+b2-1});
                i1corners = dim1(2);
                i2corners = dim2(2);
       
                cornermatchmatrix = zeros(i1corners,i2corners);
                for c1 = 1:i1corners
                   for c2 = 1:i2corners
                        ssd = SumOfSqaureDifferences(...
                            i1,i2,corners{frame1boxstart+b1-1}(:,c1),...
                            corners{frame2boxstart+b2-1}(:,c2),cornerpatchx,...
                            cornerpatchy,w1,w2);
                        cornermatchmatrix(c1,c2) = ssd;
                   end
                end
                [acorners,ccorners] = assignmentoptimal(cornermatchmatrix);
                cornerMatchesByWindow(b1,b2) = {acorners};
                
                boxmatchmatrix(b1,b2) = ccorners;
            end
        end
        cornerMatches(frame) = {cornerMatchesByWindow};
        
        [aboxes,cboxes] = assignmentoptimal(boxmatchmatrix);
        windowMatches(frame) = {aboxes};
    end


end

