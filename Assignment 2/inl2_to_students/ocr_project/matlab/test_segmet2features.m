
datadir = '../datasets/short1';
a = dir(datadir);

%% Select a filename
file = 'im1'

%% Generate filename with path and extension
fnamebild = [datadir filesep file '.jpg']

%% Read an image and convert to double
bild = double(imread(fnamebild));

%% Run your segmentation code
S = im2segment(bild);

%% Plot segment

figure(1); colormap('gray');
imagesc(S{2})

%% Run feature code

asdf = segment2features(S{4})

%% 
Im = S{4};
[r1,c1] = find(Im==1);
Im_crop = Im(min(r1):max(r1),min(c1):max(c1));
[h,w] = size(Im_crop)


edgex = conv2(Im_crop, [-1 1]);
edgey = conv2(Im_crop, [-1 1]');
linex = conv2(Im_crop, [1 1 1]);
liney = conv2(Im_crop, [1 1 1]');
linediag = conv2(Im_crop, eye(3));
linediag2 = conv2(Im_crop, [0 0 1; 0 1 0; 1 0 0]);

figure(3); colormap('gray')
subplot(3,3,1)
imagesc(Im_crop)
subplot(3,3,2)
imagesc(edgex)
subplot(3,3,3)
imagesc(edgey)
subplot(3,3,4)
imagesc(linex==3)
subplot(3,3,5)
imagesc(liney==3)
subplot(3,3,6)
imagesc(linediag==3)
subplot(3,3,7)
imagesc(linediag2==3)

cntr = regionprops(Im_crop).Centroid


relcentr = cntr./[w h]

%% Jonas

Im = S{2};

% features = segment2features(I)
% figure(5)
% imagesc(Im==1)
[rows,cols] = find(Im == 1)

slice = Im(min(rows)-1:max(rows)+1, min(cols)-1:max(cols)+1)

figure(6)
imagesc(slice)

slice = imresize(slice, [30 30])

figure(7)
imagesc(slice)

imsize = size(slice)
n_rows = 3;
n_cols = 3;

m = ceil(imsize(1)/n_rows)
n = ceil(imsize(2)/n_cols)

mean_dirs = blockproc(slice, [m, n], @mean_grad_dir)
%white_pixels = sum(sum(slice));
features = [reshape(mean_dirs, 1,[])]
% features() = [reshape(mean_dirs, [],1)];



%% Imgradient test

I = Im
imshow(I)

[Gmag, Gdir] = imgradient(I,'prewitt');

figure, imshow(Gmag, []), title('Gradient magnitude')
figure, imshow(Gdir, []), title('Gradient direction')

%%

I = S{3};
[r1,c1] = find(I==1);
I = I(min(r1):max(r1),min(c1):max(c1));

wavelength = 3;
orientation = 135;

[mag,phase] = imgaborfilt(I,wavelength,orientation);

figure(19); colormap('gray')
imagesc(I)
figure(20)
imagesc(mag)
figure(21)
imagesc(phase)

























