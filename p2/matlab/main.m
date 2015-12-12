%fill gtboxarray which has window information ie. max's and min's
parseGroundTruthSupressed;

%temp = gtboxarray(1,:);
%gtboxarray(1,:)=gtboxarray(2,:);
%gtboxarray(2,:)=temp;

numOfFrames = 10; %set number frames 
frameSkipRate = 1; %distance between next frame chosen, greater the distance more of a change of windows
frameindex = 7022;  %starting frame; range is 7024-7200s
filepath = '../frames/DaMultiview-seq';
threshold = 235;
alpha = 0.15;
cornerPatchSizeX = 12;
cornerPatchSizeY = 12;

[corners, sFrameArr] = phase1(numOfFrames, frameSkipRate, frameindex,...
    gtboxarray, filepath, threshold, alpha);

%{
harris_img = imread('../frames/DaMultiview-seq7022.png');
imshow(harris_img);

hold on
cs = corners{7};
for k = 1 : numel(cs) / 2
    plot(cs(1,k), cs(2,k), 'r*');
end
hold off;
%}

[cornerMatches, windowMatches] = matcher (corners, sFrameArr, numOfFrames,...
    gtboxarray, filepath, frameindex, cornerPatchSizeX, cornerPatchSizeY);



count = 0;
count2 = 0;
for i=1:9
    dims = size(windowMatches{i});
    for j=1:dims(1)
       if windowMatches{i}(j) == j
           count = count + 1;
       end
       count2 = count2+1;
    end
end

display(count);
display(count2);
display(double(count)/double(count2));

translations={};
translationsByWindow = {};
groundTruthTranslations;
for i=1:size(cornerMatches,2)
    disp(['running ransac on image: ',num2str(i)]);
    for j=1:size(windowMatches{i},1)
        [data1,data2] = ransacWrapper(cornerMatches,windowMatches,i,j,...
            sFrameArr,gtboxarray,corners);
        [translations,translationsByWindow] = ransac(data1,data2,10000,1,...
            0.1,i,j,translations,translationsByWindow);
    end
end
    

