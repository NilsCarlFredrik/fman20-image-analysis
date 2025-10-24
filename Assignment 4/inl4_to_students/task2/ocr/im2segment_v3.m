function S = im2segment_v3(im)
% S = im2segment(im)

thresh = 42;
gauss_im = imfilter(im,fspecial('gaussian'));
bin_im = gauss_im > thresh;

labels = bwlabel(bin_im);
nrofsegments = max(max(labels)); 
S = {};
for i = 1:nrofsegments
    if nnz(labels == i) > 10
        segment = labels == i;
        if isempty(S)
            S{1} = segment;
        elseif any(any(segment) & any(S{end}))
            S{end} = S{end} + segment;
        else 
            S{end+1} = segment;
        end
    end
end
