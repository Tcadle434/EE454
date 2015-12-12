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
    
    filename = strcat(filepath, num2str(fnum));
    filename = strcat(filename, '.png');
    i1 = imread(filename);
    dimi1 = size(i1);
    maximagex = dimi1(2);
    maximagey = dimi1(1);
    
    for oindex = 1:numobjects
        id = sscanf(objects{oindex}.Attributes.id,'%d');
        boxAtt = objects{oindex}.box.Attributes;
        h = sscanf(boxAtt.h,'%f');
        w = sscanf(boxAtt.w,'%f');
        xc = sscanf(boxAtt.xc,'%f');
        yc = sscanf(boxAtt.yc,'%f');        
        xmin = ceil(xc-w/2);
        ymin = ceil(yc-h/2);
        if xmin <= 0
            xmin = 1;
        end
        if ymin <= 0
            ymin = 1;
        end
        

        xmax = floor(xc+w/2);
        ymax = floor(yc+h/2);
        if xmax > maximagex
            xmax = maximagex;
        end
        if ymax > maximagey
           ymax = maximagey; 
        end
        
        gtboxarray(end+1,:) = [fnum id xmin ymin xmax ymax];
    end 
end


