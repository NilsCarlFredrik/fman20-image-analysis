clc;
clearvars;
close all;


% This script is an overview of what needs to be done prior to running any
% of the other scripts, e.g. inl3_test_and_benchmark.m. You
% of course need to change some things below (e.g. replace
% 'class_train' to whatever your class train function is called!)
% Also, make sure that all functions being called reside in this same
% folder, so that MATLAB finds them appropriately.

% First step in this script is to load ocrsegments for training. NOTE: Each
% single example in ocrsegments is used for training. We will have some
% other data to test on later. Thus we will not use cvpartition in this
% assignment. Two things will be loaded: S, containing 100 number segments,
% and y, containing the 100 associated labels (valued 1 through 10).
load ocrsegments

% The next step is to take the each segment in S and transform into 
% feature vectors. We use segment2features for this, which is a function
% we implemented in hand-in 2.
S_feats = zeros(10, 100); % 7, since I use 7 features -- change appropriately!

for i = 1 : numel(S)
    S_feat = segment2features_v7(S{i});
    S_feats(:, i) = S_feat;
end

% Now we are ready to train our classifier. We use our class_train.m that
% we wrote in Task 1 in this hand-in. I happened to name my as
% class_train_knn, instead (I implemented k-nearest neighbour), but of
% course rename to whatever you are using.
classification_data = class_train(S_feats, y);

% We can now save classification_data, since it will be loaded in some of
% the other functions used in this task (e.g. in inl3_test_and_benchmark.m).
save('classification_data.mat', 'classification_data')

% When this script has been successfully launched, we are ready to proceed.
% For instance, now you can try running inl3_test_and_benchmark.m

% Prior to running this, make sure you follow the steps / launch the script
% in 'first_steps_handin3_task5.m'.

% Setup the names of the functions of your OCR system. Make sure that all
% of them reside in this same folder of course!
mysystem.segmenter = 'im2segment_v2'; % What is the name of your segmentation-algorithm?
mysystem.features = 'segment2features_v7'; % What is the name of your features-algorithm?
mysystem.classifier = 'features2class'; % What is the name of your classification-algorithm?
load classification_data
mysystem.classification_data = classification_data;

% Choose dataset
datadir_short = '../datasets/short1'; % Which folder of examples are you going to test it on?
datadir_home = '../datasets/home1'; % Which folder of examples are you going to test it on?

% Benchmark and visualize
mode = 0; % debug modes 
% 0 with no plots
% 1 with some plots
% 2 with the most plots || We recommend setting mode = 2 if you get bad
% results, where you can now step-by-step check what goes wrong. You will
% get a plot showing some letters, and it will step-by-step show you how
% the segmentation worked, and what your classifier classified the letter
% as. Press any button to go to the next letter, and so on.
[hitrate1,confmat1,allres1,alljs1,alljfg1,allX1,allY1]=benchmark_inl3(mysystem,datadir_short,mode);
[hitrate2,confmat2,allres2,alljs2,alljfg2,allX2,allY2]=benchmark_inl3(mysystem,datadir_home,mode);

% Display hitrate
disp(['Hitrate short = ' num2str(hitrate1*100) '%'])
disp(['Hitrate home = ' num2str(hitrate2*100) '%'])

