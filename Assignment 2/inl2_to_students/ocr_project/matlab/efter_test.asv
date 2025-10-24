%run inl1_stub first

test = [1 4 1; 4 0 4; 1 4 1];
test(2,2) = sum(sum(test));
test=test/256;

im{1} = bild;
im{2} = imfilter(bild,fspecial('gaussian'));
im{3} = imfilter(bild,fspecial('average'));
im{4} = imgaussfilt(bild,0.5);
im{5} = imfilter(bild,test);

% im{5} = imfilter(bild,fspecial('gaussian'));

figure(1)
for i=1:5
    subplot(5,1,i)
    imagesc(im{i})
end


figure(2);colormap('gray')
for i=1:5
    S = im2segment_v2(im{i});
    sim = S{1}+S{2}+S{3}+S{4}+S{5};
    subplot(5,1,i)
    
end


S = im2segment_v2(bild);
sim = S{1}+S{2}+S{3}+S{4}+S{5};
figure(3);colormap('gray');
imagesc(sim)