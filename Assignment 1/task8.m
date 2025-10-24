load('assignment1bases.mat')

faces = stacks{1};
other = stacks{2};

%% Plot bases
for i = 1:3
    figure(i)
    colormap(gray)
    for j = 1:4
        subplot(2,2,j)
        imagesc(bases{i}(:,:,j))
    end
end

%% Plot faces
figure(1)
colormap(gray)
for i = 1:4
    subplot(2,2,i)
    imagesc(faces(:,:,10*i))
end

%% Plot other 

figure(1)
colormap(gray)
for i = 1:4
    subplot(2,2,i)
    imagesc(other(:,:,randi([1 400])))
end
%% 
no_images = 400;
no_bases = 3;

face_errors = zeros(1,no_images);
other_errors = zeros(1,no_images);

mean_face_errors = zeros(1,no_bases);
mean_other_errors = zeros(1,no_bases);

for i = 1:no_bases
    for j = 1:no_images
        [~, face_errors(j)] = im_proj(faces(:,:,j), bases{i});
        [~, other_errors(j)] = im_proj(other(:,:,j), bases{i});
    end
    mean_face_errors(i) = mean(face_errors);
    mean_other_errors(i) = mean(other_errors);
end


disp('Mean of face errors')
disp(round(mean_face_errors))

disp('Mean of other errors')
disp(round(mean_other_errors))