function features = segment2features_v3(I)

% [rows,cols] = find(I == 1)
% 
% slice = I(min(rows)-1:max(rows)+1, min(cols)-1:max(cols)+1);

[r,c] = find(I==1);
slice = I(min(r):max(r),min(c):max(c));

w_to_h_ratio = size(slice,2)/size(slice,1);
slice = imresize(slice, [48 48]);
imsize = size(slice);
n_rows = 3;
n_cols = 3;

m = ceil(imsize(1)/n_rows);
n = ceil(imsize(2)/n_cols);

mean_dirs = blockproc(slice, [m, n], @mean_grad_dir);
white_pixels = sum(sum(slice));
features = [reshape(mean_dirs, [],1)];

end