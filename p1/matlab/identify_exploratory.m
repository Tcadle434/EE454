%an array of pairs
%where each pair is the [trueclass,identifiedClass]
function pairs = identify_exploratory(testtrueclass, probVectors)
    temp = size(probVectors);
    numImages=temp(1);
    pairs = zeros(2,numImages);
    for i = 1:numImages
        % difference between 2 maxes
        max1 = max(probVectors(i, :));
        index = find(probVectors(i,:)==(max(max(probVectors(i,:)))));
        probVectors(i,index) = 0;
        max2 = max(probVectors(i,:));
        probVectors(i,index) = max1;
        diff = max1 - max2;
        
        pairs(1,i) = testtrueclass(i);
        if ( diff < .0125 )
            pairs(2,i) = 11;
        else
            pairs(2,i) = index;
        end
    end         
end