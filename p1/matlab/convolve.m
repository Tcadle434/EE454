function out = convolve(in,filterBank,biases)
    inDimensions = size(in);
    N = inDimensions(1);
    M = inDimensions(2);
    im = double(in);
    
    filterDimensions = size(filterBank);
    
    out = double(zeros(N,M,filterDimensions(4)));
    oneMatrix = ones(N,M,1);
    
    for l=1:filterDimensions(4)
        lfilter = double(filterBank(:,:,:,l));
        sums = double(zeros(N,M,1));
        for k=1:inDimensions(3)
            temp = imfilter(im(:,:,k),lfilter(:,:,k),0,'same','conv');
            sums=sums+temp;
        end
        sums = sums + (biases(l)*oneMatrix);
        out(:,:,l) = sums;
    end
end