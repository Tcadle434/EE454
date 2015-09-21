%out is a vector of key,value vectors
%key is index, value is original value
%just going to use insertion sort
function out = keyvalsort(arr)
    sz = size(arr);
    out = double(zeros(sz(2),2));
    one = ones(sz(2),2);
    out = out - one;
    
    for i=1:sz(2)
       index = 1;
       while(index < sz(2) && arr(i) < out(index,2))
           index = index + 1;
       end
       
       j = sz(2);
       while(j>index)
           out(j,:) = out(j-1,:);
           j = j-1;
       end
       
       out(index,1) = i;
       out(index,2) = arr(i);
    end
end