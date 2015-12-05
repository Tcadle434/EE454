%sample data for Project 2

%reading in the ground truth xml file
%and storing info in an array

gtboxarray = [];

foo = xml2struct('../xml/TUD-Stadtmitte.xml');
frames = foo.dataset.frame;

numframes = length(frames);
for findex = 1:numframes
    frame = frames{findex};
    fnum = sscanf(frame.Attributes.number,'%d');
    objects = frame.objectlist.object;
    numobjects = length(objects);
    for oindex = 1:numobjects
        id = sscanf(objects{oindex}.Attributes.id,'%d');
        boxAtt = objects{oindex}.box.Attributes;
        h = sscanf(boxAtt.h,'%f');
        w = sscanf(boxAtt.w,'%f');
        xc = sscanf(boxAtt.xc,'%f');
        yc = sscanf(boxAtt.yc,'%f');        
        xmin = floor(xc-w/2);
        ymin = floor(yc-h/2);
        xmax = ceil(xc+w/2);
        ymax = ceil(yc+h/2);
        gtboxarray(end+1,:) = [fnum id xmin ymin xmax ymax];
    end 
end


%sample code to display ground truth boxes and identity labels
%overlaid on each image. 
figure(1); clf; set(gcf,'DoubleBuffer','On');
for fnum=7022:7200
    fname = sprintf('../frames/DaMultiview-seq%04d.png',fnum);
    im = imread(fname);
    imagesc(im); axis equal
    inds = find(gtboxarray(:,1)==fnum);
    hold on
    for i = 1:length(inds)
        bb = gtboxarray(inds(i),:);
        plot(bb([3 3 5 5 3]),bb([4 6 6 4 4]),'g-');
        text(mean(bb([3 5])),mean(bb([4 6])),sprintf('%d',bb(2)),'Color','y');
    end
    title(sprintf('frame %d',fnum));
    hold off; drawnow
end


