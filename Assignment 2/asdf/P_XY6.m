function P = P_XY6(X,Y,p_fw,p_fb)
% may extend to extract true/false positives/negatives
 
% im_size = size(X);
% nbr_pixels = im_size(1)*im_size(2);

fw = p_fw; % False white
tw = 1-fw; % True white
fb = p_fb; % False black
tb = 1-fb; % True black

A = 2*X-Y; % Creates matrix with 

% Number of pixels for each category
nbr_fw = nnz(A==2);
nbr_tw = nnz(A==1);
nbr_fb = nnz(A==-1);
nbr_tb = nnz(A==0);

P = (fw^nbr_fw * tb^nbr_tw * fb^nbr_fb * tw^nbr_tb); %/nbr_pixels;










