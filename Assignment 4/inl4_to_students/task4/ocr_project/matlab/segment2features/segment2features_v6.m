function features = segment2features_v6(I)


[r,c] = find(I==1);
I_crop = I(min(r):max(r),min(c):max(c));

I_size = [40 30];
I_rs = imresize(I_crop, I_size);

grid = [4 3];

m = I_size(1)/grid(1);
n = I_size(2)/grid(2);

[Gx, Gy] = imgradientxy(I_rs); 

pixels = zeros(grid);
gradx = zeros(grid);
grady = zeros(grid);

for i = 1:grid(1)
    for j = 1:grid(2)
        h = (i-1)*m+1:i*m;
        v = (j-1)*n+1:j*n;
        pixels(i,j) = sum(sum(I_rs(h,v)))/(m*n);
        
    end
end

features = [reshape(pixels, [], 1)];
end
