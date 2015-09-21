%out is a vector of key,value vectors
%key is index, value is original value
%just going to use insertion sort
function out = sort(arr)
    sz = size(arr);
    out = double(zeros(sz(1),2));
    one = ones(sz(1),2);
    out = out - one;
    
    for i=1:sz
       index = 0;
       while(index <= sz && out(index,1) ~= -1 ...
           && arr(index) < out(index,2))
           index = index + 1;
       end
       out(index,1) = i;
       out(index,2) = arr(i);
    end
end