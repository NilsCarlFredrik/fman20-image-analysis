function dir = mean_grad_dir(block)
% dir = mean_grad_dir(block)

[Gmag, Gdir] = imgradient(block.data);
%dir = [double(mean(mean(block.data))>0.5)];
dir = [mean(sum(block.data))/(1+mean(sum(~block.data))) mean(sum(Gmag)) histcounts(abs(Gdir),3)];