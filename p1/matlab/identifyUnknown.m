function pairs = identifyUnknown(testtrueclass, probVectors)
    temp = size(probVectors);
    numImages=temp(1);
    count = 0;
    for i = 1:numImages
        % difference between 2 maxes
        max1 = max(probVectors(i, :));
        index = find(probVectors(i,:)==(max(max(probVectors(i,:)))));
        probVectors(i,index) = 0;
        max2 = max(probVectors(i,:));
        probVectors(i,index) = max1;
        diff = max1 - max2;
    end    
        % subtract mean
        
    end
end