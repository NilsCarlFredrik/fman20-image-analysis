%% 1 Image Sampling
bright = @(x,y) x*(1-y);

dim = 5;
A = zeros(dim,dim);
set = linspace(0,1,dim)

for i = 1:dim
   for j = 1:dim
       A(i,j) = bright(set(i),set(end-j+1));
   end 
end

B = round(A*31)

surf(B)

%% 7

phi1 = 1/3*[0 1 0; 1 1 1; 1 0 1; 1 1 1]
phi2 = 1/2*[0 0 0; 0 0 0; 1 0 -1; 1 0 -1]
phi3 = 1/2*[1 0 -1; 1 0 -1; 0 0 0; 0 0 0]
phi4 = 1/3*[1 1 1; 1 0 1; -1 -1 -1; 0 -1 0]

sp = @(u,v) sum(sum(u.*v));
nrm = @(u) sqrt(sp(u,u));

[sp(phi1,phi2) sp(phi1,phi3) sp(phi1,phi4) sp(phi2,phi3) sp(phi2,phi4) sp(phi3,phi4)]

[nrm(phi1) nrm(phi2) nrm(phi3) nrm(phi4)]

f = [-2 6 3; 13 7 5; 7 1 8; -3 4 4]

fproj = sp(f,phi1)*phi1 + sp(f,phi2)*phi2 + sp(f,phi3)*phi3 + sp(f,phi4)*phi4
