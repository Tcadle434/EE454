function [] = ransacDisplay(cornerMatches,windowMatches,imagePair,...
    sFrameArr,gtboxarray,corners,translations)
    figure(1); clf; set(gcf,'DoubleBuffer','On');
    fnum = gtboxarray(sFrameArr(imagePair+1),1);
    fname = sprintf('../frames/DaMultiview-seq%04d.png',fnum);
    inds = find(gtboxarray(:,1)==fnum);
    im = imread(fname);
    imagesc(im); axis equal
    hold on
    for i = 1:size(windowMatches{imagePair})
        [data1,data2] = ransacWrapper(cornerMatches,windowMatches,...
            imagePair,i,sFrameArr,gtboxarray,corners);
        bb = gtboxarray(inds(i),:);
        plot(bb([3 3 5 5 3]),bb([4 6 6 4 4]),'g-');
        text(mean(bb([3 5])),mean(bb([4 6])),sprintf('%d',bb(2)),'Color','y');
        numDataPoints = size(data1,2);
        for j = 1:numDataPoints
            x_real = data2(2,j);
            y_real = data2(1,j);
            x_pred = data1(2,j)+translations{imagePair}{1}(2);
            y_pred = data1(1,j)+translations{imagePair}{1}(1);
            plot(x_real,y_real,'g*');
            plot(x_pred,y_pred,'r*');
        end
    end
    title(sprintf('frame %d',fnum));           
    hold off; drawnow
end

