function [] = ransacDisplay(sFrameArr,gtboxarray,translations)
    drawArrow = @(x,y) quiver( x(1),y(1),x(2)-x(1),y(2)-y(1),0 );
    figure(1); clf; set(gcf,'DoubleBuffer','On');
    j=1;
    for fnum=7022:7030
        fname = sprintf('../frames/DaMultiview-seq%04d.png',fnum);
        im = imread(fname);
        imagesc(im); axis equal
        inds = find(gtboxarray(:,1)==fnum);
        hold on
        for i = 1:length(inds)
            bb = gtboxarray(inds(i),:);
            %plot(bb([3 3 5 5 3]),bb([4 6 6 4 4]),'g-');
            %text(mean(bb([3 5])),mean(bb([4 6])),sprintf('%d',bb(2)),'Color','y');
            window_x = gtboxarray(sFrameArr(j)+i-1,3);
            window_y = gtboxarray(sFrameArr(j)+i-1,4);
            x1 = [window_x window_x+translations{j}{i}(2)];
            y1 = [window_y window_y+translations{j}{i}(1)];
            drawArrow(x1,y1); hold on
        end
        title(sprintf('frame %d',fnum));           
        hold off; drawnow
        j = j+1;
    end
end

