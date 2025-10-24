load ocrsegments

segment2features_v4(S{1})









%%
I = S{1};

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

%%


[Gmag Gdir] = imgradient(I_rs)

for i = 1:3
    for j = 1:3
        h = (i-1)*16+j:i*16;
        v = (j-1)*16+1:j*16;
        
        bob(i,j) = sum(sum(I_rs(h,v)));
    end
end
        
bob

%%
blockproc(I_rs, [16 16], @testfunction)

blockproc(I_rs, [16 16], @mean_grad_dir)
        
        
        
        
        
        
        
        
        
        
        
        