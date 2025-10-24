%% Read images
Ia = imread('arcimboldo_low.jpg');
Ib = imread('michelangelo_shift.jpg');

%% 1a Saturate Vertumnus Arcimboldo 
% plot original image
figure(1)
subplot(1,2,1)
imshow(Ia)

Ia_hsv = rgb2hsv(Ia); % Transform to hsv
Ia_hsv(:,:,2) = Ia_hsv(:,:,2)*5; % Increase saturation 500%
Ia_hsv(:,:,3) = Ia_hsv(:,:,3)*1.1; % Increase value 10%
Ia_rgb = hsv2rgb(Ia_hsv); % Transform back to rgb

% Plot saturated image
subplot(1,2,2)
imshow(Ia_rgb)

%% 1b White balancing, The Creation of Adam Michelangelo

% Plot original image
figure(2)
subplot(3,1,1)
imshow(Ib)

% linearize to remove gamma correction from sRGB
Ib_lin =  rgb2lin(Ib);

% find mean values for each color channel
m_Ib_lin = reshape(mean(mean(Ib_lin)), [], 1);

% find max, mid and min values and their indices 
[max_v, max_indx] = max(m_I_lin);
mid_v = median(m_I_lin);
[min_v, min_indx] = min(m_I_lin);

% normalize max and min channel 
Ib_lin(:,:,max_indx) = Ib_lin(:,:,max_indx).*(mid_v/max_v);
Ib_lin(:,:,min_indx) = Ib_lin(:,:,min_indx).*(mid_v/min_v);
Ib_rgb = lin2rgb(Ib_lin); %reapply gamma correction

% plot
subplot(3,1,2)
imshow(Ib_rgb)

% same but with prebuild functions
Ib_lin2 = rgb2lin(Ib); %linearize
illuminant = illumgray(Ib_lin2); %find means
Ib_corr = chromadapt(Ib_lin2,illuminant,'ColorSpace','linear-rgb'); %balance
Ib_rgb2 = lin2rgb(Ib_corr); %reapply gamma

%plot
subplot(3,1,3)
imshow(Ib_rgb2)













