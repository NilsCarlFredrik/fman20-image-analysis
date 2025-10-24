

fun = @(block_struct) imresize(block_struct.data,0.15);

% I2 = blockproc(I_scaled,[100 100],f);
% figure;
% imshow(I_scaled);
% figure;
% imshow(I2);
% 


[Gmag, Gdir] = imgradient(I_scaled)

figure(2)
imagesc(Gmag)
figure(3)
imagesc(Gdir)

%%

[r,c] = find(I==1);
I_crop = I(min(r):max(r),min(c):max(c));

I_big = imresize(I_crop, [60 60])
I_small = imresize(I_crop, [15 15])

figure(4)
imagesc(I_big)
figure(5)
imagesc(I_small)

[Gmb, Gdb] = imgradient(I_big)
[Gms, Gds] = imgradient(I_small)

figure(6)

subplot(2, 3, 1)
imagesc(I_big)
subplot(2, 3, 2)
imagesc(Gmb)
subplot(2, 3, 3)
imagesc(Gdb)

subplot(2, 3, 4)
imagesc(I_small)
subplot(2, 3, 5)
imagesc(Gms)
subplot(2, 3, 6)
imagesc(Gds)
%%
indx = 1
figure(7)
seg = cell(3);
seg_mean_dir = zeros(3);
test = abs(Gdb)
for i = 1:3
    for j = 1:3
        seg{i,j} = Gdb((i-1)*20+j:i*20, (j-1)*20+1:j*20);
        disp((i-1)*j+1 + " " + i + " " + j)
        subplot(3,3,indx)
        imagesc(seg{i,j})
        seg_mean_dir(i,j) = mean(mean(abs(seg{i,j})));
        indx = indx + 1;
    end
end

seg_mean_dir

%% 




mean_dirs = blockproc(I_big, [20,20], @mean_grad_dir);





mean_dirs

%%


x = cos(Gdb);
y = sin(Gdb);
X = x.*Gmb;
Y = y.*Gmb;
xm = sum(sum(X));
ym = sum(sum(Y));















