load('heart_data.mat')

%% classic thresholding

Ibin = im > 0.25;

figure(1);colormap('gray');
imagesc(im);

figure(2);colormap('gray');
imagesc(Ibin);


%%

I = im;

mu0 = mean(background_values);
mu1 = mean(chamber_values);
lambda = 1;

asdf = segment_image(I,mu0,mu1,0.1);

figure(2);colormap('gray')
subplot(1,2,1)
imagesc(I);
subplot(1,2,2)
imagesc(asdf{2})

%%
M=5; % Image width
N=6; % Image height
n=M*N; % Number of pixels

Neighbours = edges4connected(M,N);
i = Neighbours(:,1);
j = Neighbours(:,2);
A = sparse(i,j,1,n,n);

[X, Y] = ndgrid(1:M, 1:N);
draw_graph(X(:),Y(:),A);

%% Heart data
load heart_data

[H, W] = size(im);
N = H*W;

mu0 = mean(background_values);
mu1 = mean(chamber_values);
lambda = 0.001;

Neighbours = edges4connected(W,H);
i = Neighbours(:,1);
j = Neighbours(:,2);
A = sparse(i,j,lambda,N,N);

T = [(im(:)-mu1).^2 (im(:)-mu0).^2];
T = sparse(T);

tic
[E, Theta] = maxflow(A,T);
Theta = reshape(Theta, W,H);
Theta = double(Theta);
toc

subplot(1,2,1); imshow(im);
subplot(1,2,2); imshow(Theta);


%% Problem 2
load heart_data

bg_mu = mean(background_values);
bg_sigma = std(background_values);

c_mu = mean(chamber_values);
c_sigma = std(chamber_values);

lambda = 1;

[H W] = size(im);
N = H*W;

% Generate mask of what pixels can not be foreground
x = [30 15 14 12 13 16 22 62 75 77 71 59 51];
y = [18 26 34 46 57 76 82 62 47 31 21 15 15];
mask = poly2mask(x,y, W,H) ~= 1;

Neighbourhood = edges4connected(W,H);
i = Neighbourhood(:,1);
j = Neighbourhood(:,2);
A = sparse(i,j,lambda,N,N); % For the border connections.

T = -log([normpdf(im(:), c_mu, c_sigma) ...
    normpdf(im(:), bg_mu, bg_sigma)...
    ]);
T(:,1) = T(:,1)+mask(:)*1000;
T = sparse(T);


[E Theta] = maxflow(A,T);
Theta = double(reshape(Theta, size(im)));

subplot(1,3,1); imshow(im); title("Source image");
subplot(1,3,2); imshow(Theta); title("Segmentation mask");
subplot(1,3,3); imshow(im.*Theta); title("Output image");


%%

hej = im;
hej(x,y) = 1;

figure(5)
imagesc(hej)

%%

mx = max(max(im));
mu0 = mean(im(im<=(mx/2)));
mu1 = mean(im(im>(mx/2)));
% % 
% mu0 = mean(background_values);
% mu1 = mean(chamber_values);

mu0 = mx/3;
mu1 = mx/2;

lambda = 0.1;

th = segment_image(im,mu0,mu1,lambda);

figure(3)
subplot(4,2,1); imshow(im);
subplot(4,2,3); imshow(th);
subplot(4,2,4); imshow(th.*im);

mu_ts0 = mu0;
mu_ts1 = mu1;

for i = 1:10

    mu0i = mean(mean(im(th~=1)));
    mu1i = mean(mean(im(th==1)));
    th = segment_image(im,mu0i,mu1i,lambda);


    if(mu_ts0 == mu0i)
        i
    end
    if(mu_ts1 == mu1i)
        i
    end
    if(mu_ts1 == mu1i && mu_ts0 == mu0i)
        break;
    end
    mu_ts0 = mu0i;
    mu_ts1 = mu1i;
end


subplot(4,2,5); imshow(th);
subplot(4,2,6); imshow(th.*im);


th2 = segment_image_v2(im, lambda);
subplot(4,2,7); imshow(th2);
subplot(4,2,8); imshow(th2.*im);




%%
I = double(imread('home1\im1.jpg'))./255;
I = imfilter(I,fspecial('gaussian'));

mx = max(max(I));
mu0 = 0 %mean(I(I<=(mx/2)))
mu1 = 1%mean(I(I>0))/2;

lambda = 0.0001;

th = segment_image(I,mu0,mu1,lambda);

figure(11)
subplot(3,1,1); imshow(I);
subplot(3,1,2); imshow(th);

for i = 1:1000
    mu0i = mean(mean(I(th~=1)));
    mu1i = mean(mean(I(th==1)));
    th = segment_image(I,mu0i,mu1i,lambda);
end

subplot(3,1,3); imshow(th);


%%



% I = I2; 
I = double(imread('home1\im1.jpg'))./255;
I=imfilter(I,fspecial('gauss'));

mx = max(max(I));
mu0 = 0; %mean(I(I<=(mx/2)));
mu1 = 1; %mean(I(I>0))/2;

lambda = 0.01;

th = segment_image(I,mu0,mu1,lambda);

figure(15)
subplot(5,1,1); imshow(I);
subplot(5,1,2); imshow(th);

tic
for i = 1:10
    mu0i = mean(mean(I(th~=1)));
    mu1i = mean(mean(I(th==1)));
    th = segment_image(I,mu0i,mu1i,lambda);
end
toc

subplot(5,1,3); imshow(th);

th2 = segment_image_v3(I);
se = strel('disk',1);
th2o = imopen(th2,se);

subplot(5,1,4); imshow(th2o);




%%
I = double(imread('home1\im1.jpg'));
S = im2segment_v3(I);

bild = zeros(size(S{1}));
for i = 1:length(S)
    bild = bild + S{i};
end

subplot(5,1,5); imshow(bild);



