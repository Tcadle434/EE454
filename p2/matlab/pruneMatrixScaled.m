function [ out ] = pruneMatrixScaled( x, alpha )
%PRUNEMATRIXSCALED 

out = x;

for k = 1 : numel(out)
    if (rand() * 255 > out(k) * alpha)
        out(k) = 0;
    end
end

end