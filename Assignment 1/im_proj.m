function [up, r] = im_proj(u, base)
% [up, r] = im_proj(u, base)
% -------------------------------------------------------------
% PURPOSE
%
%     A function that projects an image onto a base and returns 
%     the projection and error
%
%    INPUT:  
%            u :        Matrix [m x n],       Image 
%            base :     Tensor [m x n x k],   ON-Base
%
%
%    OUTPUT:
%           up :        Matrix [m x n],       Image projection
%           r :         Double,               Error
% -------------------------------------------------------------

%   Nils Broman, 2021-09-10
% -------------------------------------------------------------

sp = @(u,e) sum(sum(u.*e)); % Define scalar product
nrm = @(u) sqrt(sp(u,u));   % Define norm

base_size = size(base);
no_bases = base_size(3);    % Number of bases

coord = zeros(no_bases);
up = zeros(size(u));

% Project on each base and sum for projection on subspace
for i = 1:no_bases
    coord(i) = sp(u,base(:,:,i));
    up = up + coord(i).*base(:,:,i);
end

r = nrm(u-up); % Error norm


