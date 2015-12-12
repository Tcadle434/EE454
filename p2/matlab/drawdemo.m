%display the corners and bounding box matches between images
%so for each image the neighboring images are compared (i.e 1 is compared
%with 2, 2 is compared with 3, and so on)
%This code segment will display the neighboring pictures in a figure. The
%picture on the left will be the first neighboring image and the
%picture on the right will be the second neighboring image. They pictures
%will show that bounding boxes that our code matched (they aren't always
%right). It also shows the corners it used to match the boxes in red.
%below are some parameters you can use to configure what is printed out.
%number of image pair you want to print out
imagesToPrint = 1; %number of image pair examples you'd like to display
boxesPerImagePair = 2; %number of bounding boxes and corner examples
                       %to display per image pair demo
for i=1:numOfFrames-1
   if ( i > imagesToPrint )
       break;
   end
   dims1 = size(windowMatches{i});
   filename = strcat(filepath, num2str(frameindex+i-1));
   filename = strcat(filename, '.png');
   i1 = imread(filename);
   filename = strcat(filepath, num2str(frameindex+i));
   filename = strcat(filename, '.png');
   i2 = imread(filename);
   dimi1 = size(i1);
   
   for j=1:dims1(1)
        if (j > boxesPerImagePair)
           break;
        end
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