function features = segment2features(I)



% % features = segment2features(I)
% 
% % features = randn(6,1); % not a very useful feature vector...
% 
% % Size of image
% I_dim = size(I);
% I_size = I_dim(1)*I_dim(2);
% 
% % Crop image to area of interest
% [r,c] = find(I==1);
% I_crop = I(min(r):max(r),min(c):max(c));
% 
% % Size of cropped image
% I_crop_dim = size(I_crop);
% I_crop_size = I_crop_dim(1)*I_crop_dim(2);
% 
% % Aspect ratio cropped
% features(1) = I_crop_dim(1)/I_crop_dim(2);
% 
% % Ratio of black and white pixels;
% b_w_ratio = nnz(I==1)/I_size;
% features(2) = b_w_ratio;
% 
% % Ratio of black and white pixels in region;
% cropped_b_w_ratio = nnz(I_crop==1)/I_crop_size;
% features(3) = cropped_b_w_ratio;
% 
% % Holes
% features(4) = bweuler(I_crop);
% 
% % x-edges
% x_edges = conv2(I_crop, [-1 1]);
% no_x_edges = nnz(x_edges~=0);
% x_edge_fraction = no_x_edges/nnz(I_crop==1);
% features(5) = x_edge_fraction;
% 
% % y-edges
% y_edges = conv2(I_crop, [-1 1]');
% no_y_edges = nnz(y_edges~=0);
% y_edge_fraction = no_y_edges/nnz(I_crop==1);
% features(6) = y_edge_fraction;
% 
% % 2-neigbors x
% x_neighbors = nnz(conv2(I_crop, [1 1 1])==3)/nnz(I_crop==1);
% features(7) = x_neighbors;
% 
% % 2-neigbors y
% y_neighbors = nnz(conv2(I_crop, [1 1 1]')==3)/nnz(I_crop==1);
% features(8) = y_neighbors;
% 
% % 2-neighbor diagonal
% diag_neighbors = nnz(conv2(I_crop, eye(3))==3)/nnz(I_crop==1);
% features(9) = diag_neighbors;
% 
% % 2-neighbor opposite diagonal
% diag2_neighbors = nnz(conv2(I_crop, [0 0 1; 0 1 0; 1 0 0])==3)/nnz(I_crop==1);
% features(10) = diag2_neighbors;
% 
% % Centroid
% center = regionprops(I_crop).Centroid;
% 
% features(11) = center(1)/I_crop_dim(2); % relative x-center
% features(12) = center(2)/I_crop_dim(1); % relative y-center
% 
% 
% 
% 
% 





% JONAS
% [rows,cols] = find(I == 1);
% 
% slice = I(min(rows)-1:max(rows)+1, min(cols)-1:max(cols)+1);
% slice = imresize(slice, [30 30]);
% imsize = size(slice);
% n_rows = 3;
% n_cols = 3;
% 
% m = ceil(imsize(1)/n_rows);
% n = ceil(imsize(2)/n_cols);
% 
% mean_dirs = blockproc(slice, [m, n], @mean_grad_dir);
% %white_pixels = sum(sum(slice));
% features = [features reshape(mean_dirs, 1,[])]';
% % features() = [reshape(mean_dirs, [],1)];
% %features =
% 
% 
% 


[rows,cols] = find(I == 1);

slice = I(min(rows)-1:max(rows)+1, min(cols)-1:max(cols)+1);

w_to_h_ratio = size(slice,2)/size(slice,1);
slice = imresize(slice, [48 48]);%[60 uint8(w_to_h_ratio*60)]);
imsize = size(slice);
n_rows = 3;
n_cols = 3;

m = ceil(imsize(1)/n_rows);
n = ceil(imsize(2)/n_cols);

mean_dirs = blockproc(slice, [m, n], @mean_grad_dir);
white_pixels = sum(sum(slice));
features = [reshape(mean_dirs, [],1)];

