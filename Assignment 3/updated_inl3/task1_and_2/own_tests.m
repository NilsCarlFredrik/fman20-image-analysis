%% Plot all images

grid_size = [10, 20];
stor_face = zeros(grid_size(1)*19,grid_size(2)*19);

for i = 1:grid_size(1)
    for j = 1:grid_size(2)
        stor_face(1+(i-1)*19:i*19,1+(j-1)*19:j*19) =  reshape(X(:,grid_size(1)*(i-1)+j), [19 19]);
    end
end

implot = figure(1);
implot.Position(3:4) = [1200, 600];
movegui(implot, 'center')
imagesc(stor_face)



%% Plot all images according to classification

X = X;
klass = Y;


grid_size = [10, 10];

stor_face = zeros(grid_size(1)*19,grid_size(2)*19);
stor_ej_face = zeros(grid_size(1)*19,grid_size(2)*19);

face_count = 0;
ej_face_count = 0;

for k = 1:200
    if klass(k) == 1
        i = 1 + fix(face_count/10);
        j = 1 + mod(face_count,10);
        stor_face(1+(i-1)*19:i*19,1+(j-1)*19:j*19) =  reshape(X(:,k), [19 19]);
        face_count = face_count + 1; 
    end
    if klass(k) == -1 
        i = 1 + fix(ej_face_count/10);
        j = 1 + mod(ej_face_count,10);
        stor_ej_face(1+(i-1)*19:i*19,1+(j-1)*19:j*19) =  reshape(X(:,k), [19 19]);
        ej_face_count = ej_face_count + 1; 
    end
end

face_plot = figure(2);
face_plot.Position(3:4) = [600, 600];
movegui(face_plot, 'west')
imagesc(stor_face)

ej_face_plot = figure(3);
ej_face_plot.Position(3:4) = [600, 600];
movegui(ej_face_plot, 'east')
imagesc(stor_ej_face)


%% Plot all test images according to classification after training

X = X_test;
klass = predictions_test';

for tjo = 0:2:2
len_X = size(X);

grid_size = [5, 8];

stor_face = zeros(grid_size(1)*19,grid_size(2)*19);
stor_ej_face = zeros(grid_size(1)*19,grid_size(2)*19);

face_count = 0;
ej_face_count = 0;

for k = 1:len_X(2)
    if klass(k) == 1
        i = 1 + fix(face_count/10);
        j = 1 + mod(face_count,10);
        stor_face(1+(i-1)*19:i*19,1+(j-1)*19:j*19) =  reshape(X(:,k), [19 19]);
        face_count = face_count + 1; 
    end
    if klass(k) == -1 
        i = 1 + fix(ej_face_count/10);
        j = 1 + mod(ej_face_count,10);
        stor_ej_face(1+(i-1)*19:i*19,1+(j-1)*19:j*19) =  reshape(X(:,k), [19 19]);
        ej_face_count = ej_face_count + 1; 
    end
end

face_plot = figure(4+tjo);
face_plot.Position(3:4) = [600, 600];
movegui(face_plot, 'west')
imagesc(stor_face)

ej_face_plot = figure(5+tjo);
ej_face_plot.Position(3:4) = [600, 600];
movegui(ej_face_plot, 'east')
imagesc(stor_ej_face)

klass = Y_test;

end


%% True/false positive/negative

r = Y_test;
p = predictions_test;

% method 1
majs = r+2*p;

tp1 = nnz(majs==3)
tn1 = nnz(majs==-3)
fp1 = nnz(majs==1)
fn1 = nnz(majs==-1)

% method 2 (nicer imo)
tp2 = nnz(r==1&p==1)
tn2 = nnz(r==-1&p==-1)
fp2 = nnz(r==-1&p==1)
fn2 = nnz(r==1&p==-1)

% check 1 & 2 same
[tp1 tn1 fp1 fn1] == [tp2 tn2 fp2 fn2]

% wrong method
pos = ones(size(r));
neg = -ones(size(r));


tp3 = nnz([r p]==[pos pos])
tn3 = nnz([r p]==[neg neg])
fp3 = nnz([r p]==[neg pos])
fn3 = nnz([r p]==[pos neg])



%% 










X_face = X(:,Y==1);
X_not_face = X(:,Y==-1);

m_face  = mean(X_face');
m_not_face = mean(X_not_face');

std_face = std(X_face');
std_not_face = std(X_not_face');

classification_data = {m_face' std_face'; m_not_face' std_not_face'};























