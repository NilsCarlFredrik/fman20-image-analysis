function S = im2segment(im)
% S = im2segment(im)
% A bad test implementation...

nrofsegments = 5; % could vary, probably you should estimate this
S = cell(1,nrofsegments);
m = size(im,1);
n = size(im,2);

gauss_im = imfilter(im,fspecial('gaussian'));
 
for kk = 1:nrofsegments
    segment = zeros(m,n);
    segpart = (n/nrofsegments)*(kk-1)+1:(n/nrofsegments)*(kk);
    
    segment(:,segpart) = gauss_im(:,segpart);

    seg = im(:,segpart);
    seg = imfilter(seg,fspecial('gaussian'));
    m_seg = mean(mean(seg));
    max_seg = max(max(seg));   
    thresh = (max_seg-m_seg)/5;
    seg = seg > thresh;
    segment(:,segpart) = seg;

    S{kk}= segment; 
end


