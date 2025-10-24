function theta = segment_image(I, mu0, mu1, lambda)
% segmentation using distance from mean of ground truth back-/foreground

[M, N] = size(I);
n = M*N;

Neighbors = edges4connected(M, N);
i= Neighbors(:, 1);
j= Neighbors(:, 2);
A = sparse(i, j, lambda, n, n);

T = [(I(:)-mu1).^2, (I(:)-mu0).^2];
T = sparse(T);

% tic
[~, Theta] = maxflow(A, T);
Theta = reshape(Theta, M, N);
Theta = double(Theta);
% toc

theta = Theta;
end