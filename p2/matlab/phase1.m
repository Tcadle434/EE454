function [corners, sFrameArr] = phase1(numOfFrames, frameSkipRate,...
    frameindex, gtboxarray, filepath, threshold, alpha)
   
    filenameArr = [];
    corners = [];
    sFrameArr = [];

   for n = 1:numOfFrames
        if frameindex < 7200  %make sure number of trials and skip rate doesnt exceed highest indexed frame
            filename = strcat(filepath, num2str(frameindex));

            filename = strcat(filename, '.png');
            %disp(filename);
            filenameArr{end+1} = filename;
            %disp(filenameArr(n));

            %search for desired frames
            r = 1;
            while(frameindex ~= gtboxarray(r,1))
                %disp(gtboxarray(r,1));
                r = r + 1;
            end
            sFrameArr = [sFrameArr r];  %starting index of data for image in gtboxarray
            %disp(['starting row in gtboxarray for above frame: ', num2str(sFrameArr(n))]);

            frameindex = frameindex + frameSkipRate;
        end
   end
       %run harris corner and get corners for each window
    %window is defined by column 2 in gtboxarray
    %below code identifies which windows are shared between all selected frames
    %if there is a common window then it runs harris on this window from each
    %frame
    message2 = 'running harris corners of matching windows of all frames';
    disp(message2);
    %disp(tempFrameNum);
    for n = 1:length(filenameArr)
        tempFrameNum = gtboxarray(sFrameArr(n),1);
        tempIndex = sFrameArr(n);
        while(gtboxarray(tempIndex,1) == tempFrameNum)
            %disp(gtboxarray(tempIndex,2));
            %windowNumber = gtboxarray(tempIndex,2);
            %scan rest of frames for matching window number
            % disp(gtboxarray(tempIndex,2));
            tXmin = gtboxarray(tempIndex,3);
            tXmax = gtboxarray(tempIndex,5);
            tYmin = gtboxarray(tempIndex,4);
            tYmax = gtboxarray(tempIndex,6);
            % disp(tYmax);
            str = char(filenameArr(n)); %convert cell to string
            image = imread(str);
            img = harris(image,tXmin,tXmax,tYmin,tYmax);
            corners = [corners { blob2px( img, threshold, alpha ) }];
            tempIndex = tempIndex + 1;
        end
    end
    
end
   