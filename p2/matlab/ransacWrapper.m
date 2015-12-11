function [data1,data2] = ransacWrapper(cornerMatches,windowMatches,...
    imagePair,windowPair,sFrameArr,gtBoxArray,corners)
    % input: image pair number and window pair number
    % output: (x,y) coordinates for point correspondes of this window pair
    
    w1 = windowPair;
    w2 = windowMatches{imagePair}(windowPair);
    if (w2 ~= 0)
        numPointMathes = size(cornerMatches{imagePair}{w1,w2},1);
        for i=1:numPointMatches
            corner1Num = i;
            corner2Num = cornerMatches{imagePair}{w1,w2}(i);
            if corner2Num ~= 0
                xmin1 = gtBoxArray(sFrameArr(imagePair)+w1,3);
                ymin1 = gtBoxArray(sFrameArr(imagePair)+w1);
                x1 = corners{sFrameArr(imagePair)+w1}(2,corner1Num)+xmin1;
                y1 = corners{sFrameArr(imagePair)+w1}(1,corner1Num)+ymin1;
                data1(2,i) = x1;
                data1(1,i) = y1;

                xmin2 = gtBoxArray(sFrameArr(imagePair+1)+w2,3);
                ymin2 = gtBoxArray(sFraneArr(imagePair+1)+w2,3);
                x2 = corners{sFrameArr(imagePair+1)+w2}(2,corner2Num)+xmin2;
                y2 = corners{sFrameArr(imagePair+1)+w2}(1,corner2Num)+ymin2;
                data2(2,i) = x2;
                data2(1,i) = y2;
            end
        end
    end
end

