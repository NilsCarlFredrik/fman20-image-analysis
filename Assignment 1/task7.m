%% Task 7

% Images
phi1 = 1/3*[0 1 0; 1 1 1; 1 0 1; 1 1 1]
phi2 = 1/2*[0 0 0; 0 0 0; 1 0 -1; 1 0 -1]
phi3 = 1/2*[1 0 -1; 1 0 -1; 0 0 0; 0 0 0]
phi4 = 1/3*[1 1 1; 1 0 1; -1 -1 -1; 0 -1 0]

sp = @(u,v) sum(sum(u.*v)); % Scalar product
nrm = @(u) sqrt(sp(u,u));   % Norm

% Scalar products of images
[sp(phi1,phi2) sp(phi1,phi3) sp(phi1,phi4) sp(phi2,phi3) sp(phi2,phi4) sp(phi3,phi4)]
% Image norms
[nrm(phi1) nrm(phi2) nrm(phi3) nrm(phi4)]

% Original image
f = [-2 6 3; 13 7 5; 7 1 8; -3 4 4]
nrm(f)

% Approximation
fproj = sp(f,phi1)*phi1 + sp(f,phi2)*phi2 + sp(f,phi3)*phi3 + sp(f,phi4)*phi4
rats(fproj)

% Coordinates in the subspace
x = [sp(f,phi1) sp(f,phi2) sp(f,phi3) sp(f,phi4)]
rats(x)

nrm(f-fproj)


base = cat(3,phi1,phi2,phi3,phi4)
[~, r] = im_proj(f, base)
