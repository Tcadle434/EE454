%out - vector of double representing the perecentage of times
% that the correcrt class showed up in the top k probabilites
% where k is the index in the vector
function out = topk(probs,trueclass)
    dims = size(probs);
    out = double(zeros(10));
    for k=1:dims(2)
        count = 0;
        for j=1:dims(1)
            karray = sort(probs(j));
            for kk=1:k
               if(karray(kk,1) == trueclass(j))
                   count = count + 1;
                   break;
               end
            end
         end
        out(1) = count/dims(1);
    end
end