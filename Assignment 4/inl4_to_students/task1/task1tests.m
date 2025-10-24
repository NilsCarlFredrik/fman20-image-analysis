I = imread('arcimboldo_low.jpg');

figure(1);
subplot(1,2,1)
imshow(I);

I_norm = double(I)./255;
I_hsl = rgb2hsl_other(I_norm);
I_hsl(:,:,2) = I_hsl(:,:,2)*5;
I_hsl(I_hsl>1) = 1;
I_rgb = hsl2rgb_other(I_hsl).*255;
I_sat = cast(I_rgb, 'uint8');

subplot(1,2,2)
imshow(I_sat)
%%
I_red = I;
I_red(:,:,1) = I_red(:,:,1) + I_red(:,:,1)./5 ; 

figure(2)
imshow(I_red)

%% 

I_rgb = I(:,:,1);


%%

% I_lin = 







%% resize

fun = @(block_struct) imresize(block_struct.data,0.03);
Ismall = blockproc(I,[100 100],fun);
figure(3);
imshow(Ismall);

%% rgb tests

Ir = Ismall(:,:,1);
Ig = Ismall(:,:,2);
Ib = Ismall(:,:,3);

figure(4)
for i = 1:3
    subplot(1,3,i)
    imshow(I(:,:,i))
end

%% Inorm

Inorm = double(Ismall)./255;

%% Ihsl
Ihsl = rgb2hsl(Inorm);


figure(5)
for i = 1:3
    subplot(1,3,i)
    imshow(Ihsl(:,:,i))
end

%% Isat
Ihsl_sat = Ihsl;
Ihsl_sat(:,:,2) = Ihsl_sat(:,:,2)*3;

Irgb_sat = hsl2rgb(Ihsl_sat);

figure(6)
imshow(Irgb_sat)


%%

I = imread('michelangelo_shift.jpg');
fun = @(block_struct) imresize(block_struct.data,0.03);
Ismall = blockproc(I,[100 100],fun);


IsLin =  rgb2lin(I);

m_I_lin = reshape(mean(mean(IsLin)), [], 1);

[max_v, max_indx] = max(m_I_lin)
med_v = median(m_I_lin)
[min_v, min_indx] = min(m_I_lin)

IsLin(:,:,max_indx) = IsLin(:,:,max_indx).*(med_v/max_v);
IsLin(:,:,min_indx) = IsLin(:,:,min_indx).*(med_v/min_v);

%%%%%%%%%%%
IsLin2 = rgb2lin(I);
illuminant = illumgray(IsLin2);
I_corr = chromadapt(IsLin2,illuminant,'ColorSpace','linear-rgb');
B = lin2rgb(B_lin);

%%%%%%%%%%%%
IsRGB = lin2rgb(IsLin);
figure(10)
subplot(3,1,1)
imshow(I)
subplot(3,1,2)
imshow(IsRGB)
subplot(3,1,3)
imshow(B)
%%

% Plot original image
figure(2)
subplot(2,1,1)
imshow(I2)










