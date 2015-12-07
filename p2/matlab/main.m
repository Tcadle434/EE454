%select 2 images (for now)

%get windows for each image

%run harris corner and get corners for each window


%boxes %corners
i1[][]
i2[][]
i1boxes
i2boxes
cornerpatchx
cornerpatchy
%match up corners
    boxmatchmatrix = zeros(i1boxes,i2boxes);
    for b1 = 1:i1boxes
        for b2 = 1:i2boxes
            i1corners
            i2corners
            cornermatchmatrix = zeros(i1corner,i2corners);
            for c1 = 1:i1corners
               for c2 = 1:i2corners
                    ssd = SumOfSquareDifferences(i1(b1,c1),i2(b2,c2),...
                        cornerpatchx,cornerpatchy);
                    cornermatchmatrix(c1,c2) = ssd;
               end
            end
            [acorners,ccorners] = assignmentoptimal(cornermatchmatrix);
            boxmatchmatrix(b1,b2) = ccorners;
        end
    end
    [aboxes,cboxes] = assignmentoptimal(boxmatchmatrix);
    
    