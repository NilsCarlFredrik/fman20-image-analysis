function dir = mean_grad_dir(block)
% dir = mean_grad_dir(block)

[Gmag, Gdir] = imgradient(block.data);
%dir = [double(mean(mean(block.data))>0.5)];
hists = histcounts(abs(Gdir),3);
mag = mean(sum(Gmag));
frac = mean(sum(block.data))/(1+mean(sum(~block.data)));
dir = [sum(sum(block.data))];