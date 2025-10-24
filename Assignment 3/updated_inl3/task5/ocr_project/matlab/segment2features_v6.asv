function features = segment2features_v6(I)


[r,c] = find(I==1);
I_crop = I(min(r):max(r),min(c):max(c));

I_size = [69 69];
I_rs = imresize(I_crop, I_size);

grid = [3 3];

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
%         
%         pixels(i,j) = sum(sum(I_rs(h,v)));
%         gradx(i,j) = mean(mean(Gx(h,v)));
%         grady(i,j) = mean(mean(Gy(h,v)));
%         
        
        pixels(i,j) = sum(sum(I_rs(h,v)))/(m*n);
%         gradx(i,j) = mean(mean(Gx(h,v)));
%         grady(i,j) = mean(mean(Gy(h,v)));
%         mx = mean(mean(Gx(h,v)));
%         my = mean(mean(Gy(h,v)));
%         
%         grad = cos(mx/norm([mx my]));
%         gradx(i,j) = grad;
        
    end
end

features = [reshape(pixels, [], 1)];%; ...
%     reshape(gradx, [], 1); reshape(grady, [], 1)]; 
end
