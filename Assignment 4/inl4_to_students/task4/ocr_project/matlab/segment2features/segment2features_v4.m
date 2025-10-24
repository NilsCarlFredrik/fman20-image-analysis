function features = segment2features_v4(I)


[m, n] = size(I);
% Crop image to area of interest
[r,c] = find(I==1);
I_crop = I(min(r):max(r),min(c):max(c));

[h, w] = size(I_crop);

% Aspect ratio
% features(1) = h/w;

%  Scale image  
I_rs = imresize(I_crop, [48, 48]);

var = blockproc(I_rs, [16 16], @testfunction);

features = var;

end