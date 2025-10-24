function theta = segment_image_v2(I,lambda)
% Mumford-Shah segmentation that automatically finds optimal mu by
% repeating the algorithm with mu updated to the mean of current labeling
[M, N] = size(I);
n = M*N;

mu0 = max(max(I))/3;
mu1 = max(max(I))/2;


Neighbors = edges4connected(M, N);
i= Neighbors(:, 1);
j= Neighbors(:, 2);
A = sparse(i, j, lambda, n, n);


for i = 1:10 
    T = [(I(:)-mu1).^2, (I(:)-mu0).^2];
    T = sparse(T);
    
    [~, Theta] = maxflow(A, T);

    mu0 = mean(mean(I(Theta~=1)));
    mu1 = mean(mean(I(Theta==1)));
end

Theta = reshape(Theta, M, N);
Theta = double(Theta);

theta = Theta;
end