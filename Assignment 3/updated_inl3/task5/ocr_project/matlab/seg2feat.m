function features = seg2feat(I)
% features = segment2features(I)
[r,c] = find(I==1);
slice = I(min(r):max(r),min(c):max(c));

n = 7;
w_to_h_ratio = size(slice,2)/size(slice,1);
slice = imresize(slice, [16*n 16*n]);%[60 uint8(w_to_h_ratio*60)]);
imsize = size(slice);
n_rows = n;
n_cols = n;

m = ceil(imsize(1)/n_rows);
n = ceil(imsize(2)/n_cols);

features = blockproc(slice, [m, n], @block_to_features);
features = features(:);