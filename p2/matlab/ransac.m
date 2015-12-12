function [translations,translationsByWindow] = ransac(...
    data1,data2,iterations,thresholdDistance,inlierRatio, imagePair,...
    windowPair, translations,translationsByWindow)
	bestTX = 0;
	bestTY = 0;
	bestNumInliers = 0;
	numDataPoints = size(data1, 2);
    if numDataPoints ~= 0
        for i=1:iterations
            numInliers = 0;
            % grab 1 random pair of matching points
            % random number between 1 and numDataPoints
            randIndex = randi([1 numDataPoints],1,1);	
            randDataPoint1 = data1(:,randIndex);
            randDataPoint2 = data2(:,randIndex);

            % (x1,y1) is the point in the first region
            % (x2,y2) is its matching point in the second region
            x1 = randDataPoint1(2,1);
            y1 = randDataPoint1(1,1);
            x2 = randDataPoint2(2,1);
            y2 = randDataPoint2(1,1);

            % translation between the 2 points
            tx = x2-x1;
            ty = y2-y1;

            % loop through all data points
            for j=1:numDataPoints
                x_pred = data1(2,j) + tx;
                y_pred = data1(1,j) + ty;
                x_real = data2(2,j);
                y_real = data2(1,j);

                % calculate distance from the predicted location ...
                % of this point to its actual location
                distance = sqrt((x_pred - x_real)^2 + (y_pred - y_real)^2);
                if (distance <= thresholdDistance)
                    numInliers = numInliers+1;
                end
            end
            if (numInliers >= (inlierRatio * numDataPoints) ...
                    && numInliers > bestNumInliers)
                bestNumInliers = numInliers;
                bestTX = tx;
                bestTY = ty;
            end
        end
    end
    trans = [bestTY,bestTX];
    translationsByWindow(windowPair) = {trans};
    translations(imagePair) = {translationsByWindow};
end

