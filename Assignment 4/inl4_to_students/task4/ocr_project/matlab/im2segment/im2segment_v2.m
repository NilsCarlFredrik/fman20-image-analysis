function S = im2segment_v2(im)
% S = im2segment(im)

m = size(im,1);
n = size(im,2);

thresh = 42;
% thresh = adaptthresh(im)
gauss_im = imfilter(im,fspecial('gaussian'));
bin_im = gauss_im > thresh;

labels = bwlabel(bin_im);
nrofsegments = max(max(labels)); 
S = {};
for i = 1:nrofsegments
    if nnz(labels == i) > 10
        S{end+1} = labels == i;
    end
end

