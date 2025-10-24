function features = segment2features_v5(I)

features = zeros(3);

[r,c] = find(I==1);
I_crop = I(min(r):max(r),min(c):max(c));

I_size = [48 48];
I_rs = imresize(I_crop, I_size);

grid = [3 3];

m = I_size(1)/3;
n = I_size(2)/3;

for i = 1:grid(1)
    for j = 1:grid(2)
        h = (i-1)*m+1:i*m;
        v = (j-1)*n+1:j*n;
        
        features(i,j) = sum(sum(I_rs(h,v)));
    end
end

features = reshape(features, [], 1);
end
