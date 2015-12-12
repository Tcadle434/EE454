truthTrans=[];
truthTranslationsByWindow={};
truthTranslations={};
for i=1:size(cornerMatches,2)
    for j=1:size(windowMatches{i},1)
        x1 = gtboxarray(sFrameArr(i)+j-1,3);
        x2 = gtboxarray(sFrameArr(i+1)+j-1,3);
        y1 = gtboxarray(sFrameArr(i)+j-1,4);
        y2 = gtboxarray(sFrameArr(i+1)+j-1,4);
        truthTrans = [y2-y2,x2-x1];
        truthTranslationsByWindow(j) = {truthTrans};
        truthTranslations(i) = {truthTranslationsByWindow};
    end
end
