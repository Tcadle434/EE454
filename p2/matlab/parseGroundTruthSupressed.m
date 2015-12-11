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


