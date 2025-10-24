function features = segment2features_v2(I)

features = zeros(19,1);

[m, n] = size(I);
% Crop image to area of interest
[r,c] = find(I==1);
I_crop = I(min(r):max(r),min(c):max(c));

[h, w] = size(I_crop);

% Aspect ratio
features(1) = h/w;
%  Scale image  
I_scaled = imresize(I_crop, 3*[m m]);

[Gmag, Gdir] = imgradient(I_scaled);
Gx = cos(Gdir);
Gy = sin(Gdir);

for i = 1:3
    for j = 1:3
        h = (i-1)*m+j:i*m;
        v = (j-1)*m+1:j*m;
        
        x = Gx(h,v);
        y = Gy(h,v);
        
        features(i+j) = mean(mean(x));
        features(i+j+9) = mean(mean(y));

    end
end
