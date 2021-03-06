%returns matrix out - the result of the convolution
%in - is the image we are convuling against
%filterBank - array of filters to convolute in with
%biases - array of biases to add after convolutions
function out = convolve(in,filterBank,biases)
    
    inDimensions = size(in);
    N = inDimensions(1);
    M = inDimensions(2);
    
    %convert image to doubles
    im = double(in);
    
    filterDimensions = size(filterBank);
    
    %initialize the result of convolution
    out = double(zeros(N,M,filterDimensions(4)));
    
    %used to add bias to convolution result
    oneMatrix = ones(N,M,1);
    
    %for each 3d filter in the filterBank
    %run this for loop
    for l=1:filterDimensions(4)
        %get current 3d filter
        lfilter = double(filterBank(:,:,:,l));
        sums = double(zeros(N,M,1));
        %convolute image with 3d filter
        for k=1:inDimensions(3)
            temp = imfilter(im(:,:,k),lfilter(:,:,k),0,'same','conv');
            sums=sums+temp;
        end
        %add in biases
        sums = sums + (biases(l)*oneMatrix);
        out(:,:,l) = sums;
    end
end