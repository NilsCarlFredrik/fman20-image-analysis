% SCRIPT FOR BOTH TASK 2 AND 3.
%
% Task 2: Create your own classifier and try it out by classifying images
% as faces or non-faces
%
% Task 3: Try some built-in machine learning methods for classifying these
% same images of faces / non-faces

% Clear up
clc;
close all;
clearvars;

% Begin by loading the data
load FaceNonFace
nbr_examples = length(Y);

% This outer loop will run 100 times, so that you get a mean error for your
% classifier (the error will become different each time due to the
% randomness of cvpartition, which you may verify if you wish).
nbr_trials = 100;
nbr_methods = 6;
test_frac = 0.2;
err_rates_test = zeros(nbr_trials, nbr_methods);
err_rates_train = zeros(nbr_trials, nbr_methods);

test_size = nbr_examples*test_frac;
train_size = nbr_examples*(1-test_frac);
total_Y_test = zeros(nbr_trials*test_size, 1);
total_Y_train = zeros(nbr_trials*train_size, 1);
total_predictions_test = zeros(nbr_trials*test_size,nbr_methods);
total_predictions_train = zeros(nbr_trials*train_size,nbr_methods);


for i = 1 : nbr_trials
    
    % First split data into training / testing (80% train, 20% test)
    part = cvpartition(nbr_examples, 'HoldOut', test_frac);
    
    % Extract training and test data given the partition above
    X_train = X(:, part.training);
    X_test = X(:, part.test);
    Y_train = Y(:, part.training);
    Y_test =Y(:, part.test);
    nbr_train_examples = length(Y_train);
    nbr_test_examples = length(Y_test);
    
    % Now we can train our model!
    % YOU SHOULD IMPLEMENT THE FUNCTION class_train!
    classification_data_knn = class_train(X_train, Y_train, 'wknn');
    classification_data_bayes = class_train(X_train, Y_train, 'bayes');
    
    % Next, let's use our trained model to classify the examples in the 
    % test data
    predictions_test_knn = zeros(1, nbr_test_examples);
    predictions_test_bayes = zeros(1, nbr_test_examples);
    for j = 1 : nbr_test_examples
        % YOU SHOULD IMPLEMENT THE FUNCTION classify!
        predictions_test_knn(j) = classify(X_test(:, j), classification_data_knn, 'wknn');
        predictions_test_bayes(j) = classify(X_test(:, j), classification_data_bayes, 'bayes');
    end
   
    % We do the same thing again but this time for the training data itself!
    predictions_train_knn = zeros(1, nbr_train_examples);
    predictions_train_bayes = zeros(1, nbr_train_examples);
    for j = 1 : nbr_train_examples
        % YOU SHOULD IMPLEMENT THE FUNCTION classify!
        predictions_train_knn(j) = classify(X_train(:, j), classification_data_knn, 'wknn');
        predictions_train_bayes(j) = classify(X_train(:, j), classification_data_bayes, 'bayes');
        
    end
    
    % We can now proceed to computing the respective error rates.
    pred_test_diff_knn = predictions_test_knn - Y_test;
    pred_train_diff_knn = predictions_train_knn - Y_train;
    err_rate_test_knn = nnz(pred_test_diff_knn) / nbr_test_examples;
    err_rate_train_knn = nnz(pred_train_diff_knn) / nbr_train_examples;
    
    % Store them in the containers
    err_rates_test(i, 1) = err_rate_test_knn;
    err_rates_train(i, 2) = err_rate_train_knn;
    
    %again for bayes
    pred_test_diff_bayes = predictions_test_bayes - Y_test;
    pred_train_diff_bayes = predictions_train_bayes - Y_train;
    err_rate_test_bayes = nnz(pred_test_diff_bayes) / nbr_test_examples;
    err_rate_train_bayes = nnz(pred_train_diff_bayes) / nbr_train_examples;
    
    % Store them in the containers
    err_rates_test(i, 2) = err_rate_test_bayes;
    err_rates_train(i, 2) = err_rate_train_bayes;
    
    %--------------------- Below: Task 3 ------------------------------%
    % 
    % Uncomment the below code when working on Task 3
    % NOTE: Running the full script can take several minutes. However, by
    % setting nbr_trials = 1 (see almost at the top of this script) when
    % trying things it will go faster.
    % 
    % DO NOT FORGET TO SET nbr_trials = 100 AGAIN WHEN REPORTING YOUR FINAL
    % RESULTS
    
    % Train built-in functions (don't forget: transpose as necessary)
    tree_model = fitctree(X_train', Y_train); % = FILL IN
    svm_model = fitcsvm(X_train', Y_train); % = FILL IN
    nn_model = fitcknn(X_train', Y_train); % = FILL IN 
    
    % Next, let's use our trained model to classify the examples in the 
    % test data. You should look up the function "predict" in Matlab!
    % (don't forget: transpose as necessary, both for X and Y)
    predictions_test_tree = predict(tree_model, X_test');% = FILL IN
    predictions_test_svm = predict(svm_model, X_test');% = FILL IN
    predictions_test_nn = predict(nn_model, X_test');% = FILL IN
   
    % We can now proceed to computing the respective error rates.
    pred_test_diff_tree = predictions_test_tree - Y_test';
    pred_test_diff_svm = predictions_test_svm - Y_test'; % = FILL IN
    pred_test_diff_nn = predictions_test_nn - Y_test'; % = FILL IN
    
    err_rate_test_tree = nnz(pred_test_diff_tree)/nbr_test_examples; % = FILL IN
    err_rate_test_svm = nnz(pred_test_diff_svm)/nbr_test_examples; % = FILL IN
    err_rate_test_nn = nnz(pred_test_diff_nn)/nbr_test_examples;% = FILL IN
    
    % Store them in the containers
    err_rates_test(i, 3) = err_rate_test_tree;
    err_rates_test(i, 4) = err_rate_test_svm;
    err_rates_test(i, 5) = err_rate_test_nn;
    
    % Let's do the same for the training data
    % FILL IN CODE SIMILAR TO THE TEST PART ABOVE!
    
        % Next, let's use our trained model to classify the examples in the 
    % train data. You should look up the function "predict" in Matlab!
    % (don't forget: transpose as necessary, both for X and Y)
    
    predictions_train_tree = predict(tree_model, X_train');% = FILL IN
    predictions_train_svm = predict(svm_model, X_train');% = FILL IN
    predictions_train_nn = predict(nn_model, X_train');% = FILL IN

    pred_train_diff_tree = predictions_train_tree - Y_train';
    pred_train_diff_svm = predictions_train_svm - Y_train';
    pred_train_diff_nn = predictions_train_nn - Y_train'; 
    
    err_rate_train_tree = nnz(pred_train_diff_tree)/nbr_train_examples; 
    err_rate_train_svm = nnz(pred_train_diff_svm)/nbr_train_examples; 
    err_rate_train_nn = nnz(pred_train_diff_nn)/nbr_train_examples;
   
    err_rates_train(i, 3) = err_rate_train_tree;
    err_rates_train(i, 4) = err_rate_train_svm;
    err_rates_train(i, 5) = err_rate_train_nn;

    


    %%%%%%%%%%%%%%%%%%%%%%%%% CNN %%%%%%%%%%%%%%%%%%%

    network = trainSimpleCNN(X_train,Y_train);
    predictions_train_CNN = predictSimpleCNN(network,X_train);
    predictions_test_CNN = predictSimpleCNN(network,X_test);

    err_rate_train_CNN = nnz(predictions_train_CNN-Y_train)/nbr_train_examples;
    err_rate_test_CNN = nnz(predictions_test_CNN-Y_test)/nbr_test_examples;

    err_rates_train(i, 6) = err_rate_train_CNN;
    err_rates_test(i, 6) = err_rate_test_CNN;

   %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%



    total_Y_test((i-1)*test_size+1:i*test_size) = Y_test';
    total_predictions_test((i-1)*test_size+1:i*test_size, 1) = predictions_test_knn;
    total_predictions_test((i-1)*test_size+1:i*test_size, 2) = predictions_test_bayes;
    total_predictions_test((i-1)*test_size+1:i*test_size, 3) = predictions_test_tree;
    total_predictions_test((i-1)*test_size+1:i*test_size, 4) = predictions_test_svm;
    total_predictions_test((i-1)*test_size+1:i*test_size, 5) = predictions_test_nn;
    total_predictions_test((i-1)*test_size+1:i*test_size, 6) = predictions_test_CNN;
    

    total_Y_train((i-1)*train_size+1:i*train_size) = Y_train';
    total_predictions_train((i-1)*train_size+1:i*train_size, 1) = predictions_train_knn;
    total_predictions_train((i-1)*train_size+1:i*train_size, 2) = predictions_train_bayes;
    total_predictions_train((i-1)*train_size+1:i*train_size, 3) = predictions_train_tree;
    total_predictions_train((i-1)*train_size+1:i*train_size, 4) = predictions_train_svm;
    total_predictions_train((i-1)*train_size+1:i*train_size, 5) = predictions_train_nn;
    total_predictions_train((i-1)*train_size+1:i*train_size, 6) = predictions_train_CNN;

end

% Finally, after all the trials are done, report mean error rates
%
% NOTE: From here you get two 4-dimensional arrays, where the first entry
% is the mean error rate for your own method, and the last three
% entries are mean error rates for the built-in methods
%
% DO NOT FORGET: COMMENT ON ALL RESULTS IN THE REPORT
%
mean_err_rate_test = mean(err_rates_test, 1)
mean_err_rate_train = mean(err_rates_train, 1)

%% ------------------ FOR TASK 2 BELOW! ---------------------------------

% For the report, in addition to reporting above error rates (and
% commenting on them!), you should also manually select two images from X,
% one image of a face, and one image of a non-face. Begin by reshaping each
% such column from 361x1 to 19x19, so that you can show them using matlab's
% function "imagesc". (See "reshape" in Matlab for how to reshape a vector to a
% matrix). Provide both these images in your report INCLUDING WHAT YOUR
% MODEL PREDICTS THE RESPECTIVE IMAGES TO BE. Hopefully your model will say
% that the face is a face, and that the non-face is a non-face, but it's
% not certain of course. Make sure that the two images are extracted from
% X_test, and not X_train. Write code for this below! 

indx_face = find(Y_test==1,1);
indx_not_face = find(Y_test==-1,1);

face_pred = [predictions_test_knn(indx_face) predictions_test_bayes(indx_face) ...
    predictions_test_tree(indx_face) predictions_test_svm(indx_face) ...
    predictions_test_nn(indx_face) predictions_test_CNN(indx_face)];
non_face_pred = [predictions_test_knn(indx_not_face) predictions_test_bayes(indx_not_face) ...
    predictions_test_tree(indx_not_face) predictions_test_svm(indx_not_face) ...
    predictions_test_nn(indx_not_face) predictions_test_CNN(indx_not_face)];

stat_mtrx = ["Model:" "KNN (own)" "Bayes (own)" "Tree" "SVM" "NN" "CNN";
"Mean train err:" mean_err_rate_train;
"Mean test err:" mean_err_rate_test;
"Face prediction:" face_pred;
"Non-face prediction" non_face_pred];

spaces = max(strlength(stat_mtrx)) + 5;

for i = 1:size(stat_mtrx,1)
    istring = "";
    for j = 1:size(stat_mtrx,2)
        istring = strjoin([istring, stat_mtrx(i,j), ...
            strjoin(repelem("",spaces(j)-strlength(stat_mtrx(i,j))))]);
    end
    disp(istring);
end


im1 = reshape(X_test(:,indx_face),[19 19]);
im2 = reshape(X_test(:,indx_not_face),[19 19]);

figure(1)
subplot(1,2,1); imagesc(im1); pbaspect([1 1 1]); title("Face");
subplot(1,2,2); imagesc(im2); pbaspect([1 1 1]); title("Non-face");

%% Confusion matrices

model_names = ["KNN (own)" "Bayes (own)" "Tree" "SVM" "NN" "CNN"];
cm_test = cell(nbr_methods);
cm_train = cell(nbr_methods);

figure(2)
for i = 1:nbr_methods
    subplot(2,nbr_methods,i)
    cm_train{i} = confusionchart(total_Y_train,total_predictions_train(:,i));
    title(model_names(i))
%     subtitle('Train')
    cm_test{i} = subplot(2,nbr_methods,nbr_methods+i);
    confusionchart(total_Y_test,total_predictions_test(:,i))
%     subtitle('Test')
end




















