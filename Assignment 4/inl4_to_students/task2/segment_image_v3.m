function theta = segment_image_v3(I, bgv, fgv, mask)
% segmentation through negative log-likelyhood from ground truth, with the
% option of adding a mask.

[M, N] = size(I);
n = M*N;

bg_mu = mean(bgv);
bg_sigma = std(bgv);

fg_mu = mean(fgv);
fg_sigma = std(fgv);

lambda = 1;

Neighbors = edges4connected(M, N);
i= Neighbors(:, 1);
j= Neighbors(:, 2);
A = sparse(i, j, lambda, n, n);

T = -log([normpdf(I(:), fg_mu, fg_sigma) ...
    normpdf(I(:), bg_mu, bg_sigma) ]);
if exist('mask', 'var')
    T(:,1) = T(:,1) + mask(:)*100;
end
T = sparse(T);

[~, Theta] = maxflow(A, T);


Theta = reshape(Theta, M, N);
Theta = double(Theta);

theta = Theta;
end