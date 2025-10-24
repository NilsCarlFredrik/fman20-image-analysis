% Task 1: Fit least squares and total least squares lines to data points.

% Clear up
clc;
close all;
clearvars;

% Begin by loading data points from linjepunkter.mat
load linjepunkter

N = length(x); % number of data points

% Plot data
plot(x, y, '*'); hold on;
xlabel('x') 
ylabel('y')
title('Line fit with least square( and total least square!') % OBS - CHANGE TITLE!
x_fine = [min(x)-0.05,max(x)+0.05]; % used when plotting the fitted lines

% Fit a line to these data points with least squares
% Here you should write code to obtain the p_ls coefficients (assuming the
% line has the form y = p_ls(1) * x + p_ls(2)).
X = [ones(N,1) x];
p_ls = X\y; % REMOVE AND REPLACE WITH LEAST SQUARES


ls_error = @(p_ls) sum((y-X*p_ls).^2);

e_ls = ls_error(p_ls)
plot(x_fine, p_ls(1) + p_ls(2)*x_fine, 'r-')


x_ = sum(x);
x_2 = sum(x.^2);
y_ = sum(y);
y_2 = sum(y.^2);
xy_ = sum(x.*y);

A = [x_2-x_*x_/N, xy_-x_*y_/N;
    xy_-x_*y_/N y_2-y_*y_/N];

[v, D] = eig(A);
v1 = v(:,1);
v2 = v(:,2);

c1 = -[x_ y_]*v1/N;
c2 = -[x_ y_]*v2/N;

p_tls1 = -[v1(1) c1]'/v1(2);
p_tls2 = -[v2(1) c2]'/v2(2);

Xalt = [x ones(N,1)];
tls_error = @(p_tls) sum(([y Xalt]*[-1;p_tls]).^2)/(p_tls(1)^2+1^2);

e_tls1 = tls_error(p_tls1)
e_tls2 = tls_error(p_tls2)

plot(x_fine, p_tls1(1) * x_fine + p_tls1(2), 'b-.')
% plot(x_fine, p_tls2(1) * x_fine + p_tls2(2), 'g--')


% Legend --> show which line corresponds to what (if you need to
% re-position the legend, you can modify rect below)
h=legend('data points', 'least-squares','total-least-squares', 'total-max-squares');
rect = [0.20, 0.65, 0.25, 0.25];
set(h, 'Position', rect)

% After having plotted both lines, it's time to compute errors for the
% respective lines. Specifically, for each line (the least squares and the
% total least squares line), compute the least square error and the total
% least square error. Note that the error is the sum of the individual
% squared errors for each data point! In total you should get 4 errors. Report these
% in your report, and comment on the results. OBS: Recall the distance formula
% between a point and a line from linear algebra, useful when computing orthogonal
% errors!

errors = [ls_error(p_ls) tls_error(flip(p_ls));
          ls_error(flip(p_tls1)) tls_error(p_tls1)]
%y
% 
% X*p_ls
% plot(x, X*p_ls, 'b-*')


% Fit a line to these data points with total least squares.
% Note that the total least squares line has the form 
% ax + by + c = 0, but the plot command requires it to be of the form
% y = kx + m, so make sure to convert appropriately.



% n = 2;
% Z = [x.^2 x y];
% [U, S, V] = svd(Z, 0);
% VXY = V(1:n, 1+n:end);
% VYY = V(1+n:end, 1+n:end); 
% B = -VXY / VYY

% A = []
% [m,n]=size(A);
% [U, S, V] = svd([A,b]);
% s = V(n+1,n+1);
% if s == 0 ,
% error(’Total Least Squares Solution does not exist’)
% end
% x = -V(1:n,n+1)/s;

% WRITE CODE BELOW TO COMPUTE THE 4 ERRORS