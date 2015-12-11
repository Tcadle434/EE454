function [data1,data2] = ransacWrapper(cornerMatches,windowMatches,...
    imagePair,windowPair,sFrameArr,gtBoxArray,corners)
    % input: image pair number and window pair number
    % output: (x,y) coordinates for point correspondences of this window pair
    
    % get the window in img1 and its corresponding window in img2
    w1 = windowPair;
    w2 = windowMatches{imagePair}(windowPair);
    
    % if there is a window match for the window in img1
    if (w2 ~= 0)
        numPointMatches = size(cornerMatches{imagePair}{w1,w2},1);
        for i=1:numPointMatches
            % get the first corner in img1 and its corresponding corner in
            % img2
            corner1Num = i;
            corner2Num = cornerMatches{imagePair}{w1,w2}(i);
            % if there is a match for the corner in img1
            if corner2Num ~= 0
                % get the top left coordinates of window 1
                xmin1 = gtBoxArray(sFrameArr(imagePair)+w1,3);
                ymin1 = gtBoxArray(sFrameArr(imagePair)+w1,4);
                % get the (x,y) coordinates of this corner
                x1 = corners{sFrameArr(imagePair)+w1}(2,corner1Num)+xmin1;
                y1 = corners{sFrameArr(imagePair)+w1}(1,corner1Num)+ymin1;
                
                data1(2,i) = x1;
                data1(1,i) = y1;
                
                % get the top left coordinates of window 2
                xmin2 = gtBoxArray(sFrameArr(imagePair+1)+w2,3);
                ymin2 = gtBoxArray(sFrameArr(imagePair+1)+w2,4);
                % get the (x,y) coordinates of this corner
                x2 = corners{sFrameArr(imagePair+1)+w2}(2,corner2Num)+xmin2;
                y2 = corners{sFrameArr(imagePair+1)+w2}(1,corner2Num)+ymin2;
                
                data2(2,i) = x2;
                data2(1,i) = y2;
            else
                i=i-1;
            end
        end
    end
end

