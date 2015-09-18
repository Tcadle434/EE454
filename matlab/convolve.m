function out = convolve(in,N,M,D,filterBank,biases)
    im = double(in);
    out = im;
    oneMatrix = ones(N,M,D);
    for l=1:D
        lfilter = filterBank(:,:,:,l);
        sums = zeros(N,M,1);
        for k=l:D
            temp = imfilter(im(:,:,k),lfilter(:,:,k));
            sums=sums+temp;
        end
        sums = sums + (biases(l)*oneMatrix);
        out(:,:,l) = sums;
    end
end