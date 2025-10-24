function dir = block_to_features(block)
% [rows, cols] = size(block.data);
% [I J] = ndgrid(1:rows, 1:cols);
% centroid = [mean(mean(I)) mean(mean(J))];
% I = I-centroid(1);
% J = J-centroid(2);
% 
% x = I.*block.data;
% y = I.*block.data;
% 
% norm_const = sqrt(x.^2+y.^2);
% 
% if norm_const ~= 0
%     y = y./norm_const;
%     x = x./norm_const;
% end
% 
% sum_y = sum(sum(x));
% sum_x = sum(sum(y));
% % mean(mean(I.*block.data)) mean(mean(J.*block.data))];

dir = [sum(sum(block.data))];