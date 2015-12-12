function [] = ransacDisplay(cornerMatches,windowMatches,imagePair,...
    sFrameArr,gtboxarray,corners,translations)
    fnum = gtboxarray(sFrameArr(imagePair+1),1);
    fname = sprintf('../frames/DaMultiview-seq%04d.png',fnum);
    inds = find(gtboxarray(:,1)==fnum);
    im = imread(fname);
    imagesc(im); axis equal
    hold on
    for i = 1:size(windowMatches{imagePair});
        w1 = i;
        w2 = windowMatches{imagePair}(w1);
        [data1,data2] = ransacWrapper(cornerMatches,windowMatches,...
            imagePair,i,sFrameArr,gtboxarray,corners);
        for k = 1:length(inds)
            bb = gtboxarray(inds(i),:);
            plot(bb([3 3 5 5 3]),bb([4 6 6 4 4]),'g-');
            text(mean(bb([3 5])),mean(bb([4 6])),sprintf('%d',bb(2)),'Color','y');
        end
        numDataPoints = size(data1,2);
        for j = 1:numDataPoints
            if cornerMatches{imagePair}{w1,w2}(j) ~= 0
                x_real = data2(2,j);
                y_real = data2(1,j);
                x_pred = data1(2,j)+translations{imagePair}{1}(2);
                y_pred = data1(1,j)+translations{imagePair}{1}(1);
                plot(x_pred,y_pred,'r*');
                plot(x_real,y_real,'y*');
                if x_pred == x_real && y_pred == y_real
                    plot(x_real,y_real, 'g*');
                end
            end
        end
    end
    title(sprintf('RANSAC - frame %d to %d',fnum-1,fnum));           
    hold off; drawnow
end


