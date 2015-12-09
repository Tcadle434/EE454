function [bestLineParam1,bestLineParam2] = ransac(data1,data2,numPoints,iterations,thresholdDistance,inlierRatio)
	bestLineParam1 = 0;
	bestLineParam2 = 0;
	bestNumInliers = 0;
	numDataPoints = size(data, 2);
	for i=1:iterations
		numInliers = 0;
		% grab 1 random pair of matching points
		randIndex = randi([1 numDataPoints],1,1);	% random number between 1 and numDataPoints
		randDataPoint1 = data1(:,randIndex);
		randDataPoint2 = data2(:,randIndex);
		
		% (x1,y1) is the point in the first region
		% (x2,y2) is its matching point in the second region
		x1 = randDataPoint1(1,1);
		y1 = randDataPoint1(2,1);
		x2 = randDataPoint2(1,1);
		y2 = randDataPoint2(2,1);
		
		% translation between the 2 points
		tx = x2-x1;
		ty = y2-y1;
		
		% loop through all data points
		for j=1:numDataPoints
			xpred = data1(1,j) + tx;
			ypred = data1(2,j) + ty;
			xreal = data2(1,j);
			yreal = data2(2,j);
			
			% calculate distance from the predicted location of this point to its actual location
			distance = sqrt((xpred - xreal)^2 + (ypred - yreal)^2);
			if (distance <= thresholdDistance)
				numInliers++;
		end	
		if (numInliers >= (inlierRatio * numDataPoints) && numInliers > bestNumInliers)
			bestNumInliers = numInliers;
			bestLineParam1 = (y2-y1)/(x2-x1); % slope of best fit line
			bestLineParam2 = y1 - bestLineParam1*x1;	% y-intercept of best fit line
		end
	end
end

