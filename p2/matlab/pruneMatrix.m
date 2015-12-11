function [ out ] = pruneMatrix( x, alpha )
%PRUNEMATRIX 

out = x;

for k = 1 : numel(out)
    if (rand() > alpha)
        out(k) = 0;
    end
end

end