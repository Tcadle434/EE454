function [accuracy] = Acurrator(windowMatches, gtboxarray, sFrameArr)
    correct = 0;
    total = 0;
    dims = size(sFrameArr);
    for i=1:dims(2)-1
        dimwindows = size(windowMatches{i});
        for j = 1:dimwindows(1)
            if gtboxarray(sFrameArr(i+1) + windowMatches{i}(j) - 1,2)...
                  == gtboxarray(sFrameArr(i) + j - 1,2)
               correct = correct + 1;
            end
            total = total + 1;
        end
    end
    accuracy = double(correct)/double(total);
end