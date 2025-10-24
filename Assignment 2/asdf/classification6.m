%% 6
im_B = zeros(5,3);
im_B(2:2:4,2) = 1; im_B(1:2:5,3) = 1;
p_B = 0.25;

im_0 = zeros(5,3);
im_0(1:4:5,1:2:3) = 1; im_0(2:4, 2) = 1;
p_0 = 0.4;

im_8 = zeros(5,3);
im_8(2:2:4,2) = 1; im_8(1:2:5,1:2:3) = 1;
p_8 = 0.35;

im_x = ones(5,3);
im_x(2:3:5, 1) = 0; im_x(3:2:5, 2) = 0; im_x(4,3) = 0;
imagesc(im_x)
%%
figure(2); colormap('gray');
subplot(1,4,1); imagesc(im_B)
subplot(1,4,2); imagesc(im_0)
subplot(1,4,3); imagesc(im_8)
subplot(1,4,4); imagesc(im_x)

%%
y = {im_B(:), im_0(:), im_8(:)};
p_y = [p_B, p_0, p_8];

x = im_x(:);
p_fb = 0.35; % Probability false black
p_fw = 0.25; % False white


% P(X|y=j)
P_xy = zeros(1,3);
for i = 1:3
    P_xy(i) = P_XY6(x,y{i},p_fw,p_fb);
end

P_xy

% P(y=j|X)
P_yx = P_xy.*p_y./sum(P_xy.*p_y)
% P_yx=P_xy.*p_y./sum(P_xy) % UPDATED


