% Prior to running this, make sure you follow the steps / launch the script
% in 'first_steps_handin3_task4.m'.
tic
% Setup the names of the functions of your OCR system. Make sure that all
% of them reside in this same folder of course!
mysystem.segmenter = 'im2segment_v3'; % What is the name of your segmentation-algorithm?
mysystem.features = 'segment2features_v6'; % What is the name of your features-algorithm?
mysystem.classifier = 'features2class'; % What is the name of your classification-algorithm?
load classification_data
mysystem.classification_data = classification_data;

% Choose dataset
datadir_s1 = '../datasets/short1'; % Which folder of examples are you going to test it on?
datadir_s2 = '../datasets/short2'; % Which folder of examples are you going to test it on?
datadir_h1 = '../datasets/home1'; % Which folder of examples are you going to test it on?
datadir_h2 = '../datasets/home2'; % Which folder of examples are you going to test it on?
datadir_h3 = '../datasets/home3'; % Which folder of examples are you going to test it on?

% Benchmark and visualize
mode = 0; % debug modes 
% 0 with no plots
% 1 with some plots
% 2 with the most plots || We recommend setting mode = 2 if you get bad
% results, where you can now step-by-step check what goes wrong. You will
% get a plot showing some letters, and it will step-by-step show you how
% the segmentation worked, and what your classifier classified the letter
% as. Press any button to go to the next letter, and so on.
[hitrate_s1,confmat_s1,allres_s1,alljs_s1,alljfg_s1,allX_s1,allY_s1]=benchmark_inl4(mysystem,datadir_s1,mode);
[hitrate_s2,confmat_s2,allres_s2,alljs_s2,alljfg_s2,allX_s2,allY_s2]=benchmark_inl4(mysystem,datadir_s2,mode);
[hitrate_h1,confmat_h1,allres_h1,alljs_h1,alljfg_h1,allX_h1,allY_h1]=benchmark_inl4(mysystem,datadir_h1,mode);
[hitrate_h2,confmat_h2,allres_h2,alljs_h2,alljfg_h2,allX_h2,allY_h2]=benchmark_inl4(mysystem,datadir_h2,mode);
[hitrate_h3,confmat_h3,allres_h3,alljs_h3,alljfg_h3,allX_h3,allY_h3]=benchmark_inl4(mysystem,datadir_h3,mode);

% Display hitrate
disp('Features: ')
size(S_feat)
disp(['Hitrate ' datadir_s1(13:end) ' =  ' num2str(hitrate_s1*100) '%'])
disp(['Hitrate ' datadir_s2(13:end) ' =  ' num2str(hitrate_s2*100) '%'])
disp(['Hitrate ' datadir_h1(13:end) ' =  ' num2str(hitrate_h1*100) '%'])
disp(['Hitrate ' datadir_h2(13:end) ' =  ' num2str(hitrate_h2*100) '%'])
disp(['Hitrate ' datadir_h3(13:end) ' =  ' num2str(hitrate_h3*100) '%'])
disp(' ')
disp([num2str(hitrate_s1*100) ' \% & ' ...
    num2str(hitrate_s2*100) ' \% & ' ...
    num2str(hitrate_h1*100) ' \% & ' ... 
    num2str(hitrate_h2*100) ' \% & ' ...
    num2str(hitrate_h3*100) ' \%'])

toc