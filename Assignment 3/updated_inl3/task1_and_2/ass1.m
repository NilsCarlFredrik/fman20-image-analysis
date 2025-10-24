%%
run('task1_and_2.m')
%%
disp(["Own nn" "Own Bayes" "Tree" "SVM" "NN"])
disp(mean_err_rate_train)
disp(mean_err_rate_test)

%%

t = Y_train;
p = predictions_train_bayes;
 
tp = nnz(t==1&p==1);
tn = nnz(t==-1&p==-1);
fp = nnz(t==-1&p==1);
fn = nnz(t==1&p==-1);

1-(tp+tn)/size(t,2)

t = Y_test;
p = predictions_test_bayes;

tp = nnz(t==1&p==1);
tn = nnz(t==-1&p==-1);
fp = nnz(t==-1&p==1);
fn = nnz(t==1&p==-1);

1-(tp+tn)/size(t,2)
