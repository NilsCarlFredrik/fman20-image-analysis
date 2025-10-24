function theta = segment_image_v4(I)
% segmentation through negative log-likelyhood, that updates the mean and
% variance through repetition

[M, N] = size(I);
n = M*N;

mx = max(max(I));

bg_mu = mean(I(I<mx/2));
bg_sigma = std(I(I<mx/2));

fg_mu = mean(I(I>=mx/2));
fg_sigma = std(I(I>=mx/2));

lambda = 1;

Neighbors = edges4connected(M, N);
i= Neighbors(:, 1);
j= Neighbors(:, 2);
A = sparse(i, j, lambda, n, n);


 for i = 1:5 
    T = -log([normpdf(I(:), fg_mu, fg_sigma) ...
        normpdf(I(:), bg_mu, bg_sigma) ]);
    T = sparse(T);
    
    [~, Theta] = maxflow(A, T);

    bg_mu = mean(I(Theta~=1));
    bg_sigma = std(I(Theta~=1));

    fg_mu = mean(I(Theta==1));
    fg_sigma = std(I(Theta==1));

 end

Theta = reshape(Theta, M, N);
Theta = double(Theta);


theta = Theta;
end