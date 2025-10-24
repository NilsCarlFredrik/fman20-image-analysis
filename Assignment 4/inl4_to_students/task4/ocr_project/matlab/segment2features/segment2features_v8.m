function features = segment2features_v8(I)

[r,c] = find(I==1);
I_crop = I(min(r):max(r),min(c):max(c));

I_size = [15 15];
I_rs = imresize(I_crop, I_size);

grid = [3 3];

m = I_size(1)/grid(1);
n = I_size(2)/grid(2);

pixels = zeros(grid);

for i = 1:grid(1)
    for j = 1:grid(2)
        h = (i-1)*m+1:i*m;
        v = (j-1)*n+1:j*n;
        I_ij = I_rs(h,v);
        pixels(i,j) = sum(sum(I_ij))/(m*n);
    end
end

grid_2 = [2 2];

m2 = I_size(1)/grid_2(1);
n2 = I_size(2)/grid_2(2);

dir = zeros(grid);

for i = 1:grid(1)
    for j = 1:grid(2)
        h = (i-1)*m+1:i*m;
        v = (j-1)*n+1:j*n;
        I_ij = I_rs(h,v);
        pixels(i,j) = sum(sum(I_ij))/(m*n);
    end
end


features = [reshape(pixels, [], 1)];
end
