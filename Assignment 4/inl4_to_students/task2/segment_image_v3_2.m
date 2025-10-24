function theta = segment_image_v3_2(I, bgv, fgv, mask)
% segmentation through negative log-likelyhood from ground truth, with the
% option of adding a mask.

[M, N] = size(I);
n = M*N;

fg_mu = mean(fgv);
fg_sigma = std(fgv);
fg_c = log(fg_sigma*sqrt(2*pi))/(2*fg_sigma^2);

bg_mu = mean(bgv);
bg_sigma = std(bgv);
bg_c = log(bg_sigma*sqrt(2*pi))/(2*bg_sigma^2);

lambda = 1;

Neighbors = edges4connected(M, N);
i= Neighbors(:, 1);
j= Neighbors(:, 2);
A = sparse(i, j, lambda, n, n);

T = -[fg_c*(I(:)-fg_mu).^2 bg_c*(I(:)-bg_mu).^2];
if exist('mask', 'var')
    T(:,1) = T(:,1) + mask(:)*100;
end
T = sparse(T);

[~, Theta] = maxflow(A, T);


Theta = reshape(Theta, M, N);
Theta = double(Theta);

theta = Theta;
end