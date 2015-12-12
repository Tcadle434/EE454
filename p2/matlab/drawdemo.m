%for each image pair
for i=1:numOfFrames-1
   dims1 = size(windowMatches{i});
   filename = strcat(filepath, num2str(frameindex+i-1));
   filename = strcat(filename, '.png');
   i1 = imread(filename);
   filename = strcat(filepath, num2str(frameindex+i));
   filename = strcat(filename, '.png');
   i2 = imread(filename);
   dimi1 = size(i1);
   
   for j=1:dims1(1)
        figure;
        imagesc([i1 i2]);
        
        bb = gtboxarray(sFrameArr(i)+j-1,:);
        bb2 = gtboxarray(sFrameArr(i+1)+windowMatches{i}(j)-1,:);
        
        bb2(3) = bb2(3) + dimi1(2);
        bb2(5) = bb2(5) + dimi1(2);
        hold on
        cs = corners{(sFrameArr(i)-sFrameArr(1)+1)+j-1}(:,:);
        cs(1,:) = cs(1,:)+bb(4);
        cs(2,:) = cs(2,:)+bb(3);
        cs1 = cs;
        
        
        cs2 = corners{(sFrameArr(i+1)-sFrameArr(1)+1)+windowMatches{i}(j)-1}(:,:);
        cs2(1,:) = cs2(1,:)+bb2(4);
        cs2(2,:) = cs2(2,:)+bb2(3);

        for k = 1 : numel(cs) / 2
            plot(cs(2,k), cs(1,k), 'r*');
           
        end
        for k = 1 : numel(cs2) / 2
            plot(cs2(2,k), cs2(1,k), 'r*');
        end
        plot(bb([3 3 5 5 3]),bb([4 6 6 4 4]),'g-');
        plot(bb2([3 3 5 5 3]),bb2([4 6 6 4 4]),'g-');
        hold off;
   end
end