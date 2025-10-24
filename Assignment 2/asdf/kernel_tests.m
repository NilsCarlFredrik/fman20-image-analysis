
file = 'bild.jpg';
fnamebild = [file];
bild = double(imread(fnamebild));
bild = bild(:,:,1);


f1 = [-1 1];
f2 = [-1 ;1];
f3 = 1/9*ones(3);
f4 = [0 -1 0; -1 4 -1; 0 -1 0];
f5 = ones(5)-triu(2*ones(5),1); 

filtered_1 = imfilter(bild,f1);
filtered_2 = imfilter(bild,f2);
filtered_3 = imfilter(bild,f3);
filtered_4 = imfilter(bild,f4);
filtered_5 = imfilter(bild,f5);


%%

filtered_1 = conv2(bild,f1);
filtered_2 = conv2(bild,f2);
filtered_3 = conv2(bild,f3);
filtered_4 = conv2(bild,f4);
filtered_5 = conv2(bild,f5);



%%
figure(5);colormap(gray);
i = 1;
subplot(2,3,i)
title('original')
imagesc(bild)

i = i+1;
subplot(2,3,i)
title('filter ' + string(i))
imagesc(filtered_1)

i = i+1;
subplot(2,3,i); colormap(gray);
title('filter ' + string(i))
imagesc(filtered_2)


i = i+1;
subplot(2,3,i); colormap(gray);
title('filter ' + string(i))
imagesc(filtered_3)


i = i+1;
subplot(2,3,i); colormap(gray);
title('filter ' + string(i))
imagesc(filtered_4)


i = i+1;
subplot(2,3,i); colormap(gray);
title('filter ' + string(i))
imagesc(filtered_5)



%% 

f6 = [0   0 -1   0  0;
       0  -1 -2  -1  0;
       -1 -2 16  -2 -1;
       0  -1 -2  -1  0;
       0   0 -1   0  0]

   
filtered_6 = conv2(bild,f6);

figure(6); colormap(gray);
title('filter ' + string(6))
imagesc(filtered_6)

%%


f6 = [0   0   0  -1   0   0   0;
       0   0  -1  -2  -1   0   0;
       0  -1  -2  -4  -2  -1   0;
      -1  -2  -4  44  -4  -2  -1;
       0  -1  -2  -4  -2  -1   0;
       0   0  -1  -2  -1   0   0;
       0   0   0  -1   0   0   0]

   
filtered_6 = conv2(bild,f6);

figure(6); colormap(gray);
title('filter ' + string(6))
imagesc(filtered_6)











