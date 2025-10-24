function S = im2segment(im)
% S = im2segment(im)
% A bad test implementation...
% 
% nrofsegments = 5; % could vary, probably you should estimate this
% S = cell(1,nrofsegments);
% m = size(im,1);
% n = size(im,2);
% 
% thresh = 42;
% % thresh = multithresh(im);
% % sharp_im = im > thresh;
% sharp_im = imfilter(im,fspecial('gaussian')) > thresh;
%  
% for kk = 1:nrofsegments
%     segment = zeros(m,n);
%     segpart = (n/nrofsegments)*(kk-1)+1:(n/nrofsegments)*(kk);
%     
%     segment(:,segpart) = sharp_im(:,segpart);
% 
% %     seg = im(:,segpart);
% %     seg = imfilter(seg,fspecial('gaussian'));
% % %     thresh = multithresh(seg);
% %     seg = seg > thresh;
% %     segment(:,segpart) = seg;
% 
%     S{kk}= segment; 
% end

%---------------V2----------------------
m = size(im,1);
n = size(im,2);

thresh = 30;
gauss_im = imfilter(im,fspecial('gaussian'));
bin_im = gauss_im > thresh;

labels = bwlabel(bin_im);
nrofsegments = max(max(labels)); % could vary, probably you should estimate this
% S = cell(1,nrofsegments);
S = {};
for i = 1:nrofsegments
    if nnz(labels == i) > 10
        S{end+1} = labels == i;
    end
end
        

