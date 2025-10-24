%% 5
PX_Y = @(X,Y,e) (1-e)^nnz(Y==X) * e^nnz(Y~=X); %%UPDATED%%

y = cell(1,4);
for i=1:4
    case_i = ones(4); 
    case_i(:,i) = 0;
    y{i} = case_i(:);
end
Py = [0.3 0.2 0.2 0.3];

im = ones(4);
im(4,2) = 0;
for i = 1:3
    im(i,i) = 0;
end
im = im(:);
e = 0.2;

P_xy = zeros(1,4);
for i=1:4
    P_xy(i) = PX_Y(im,y{i},e);
end

P_xy
P_yx=P_xy.*Py/sum(P_xy.*Py)

