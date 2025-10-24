function classification_data = class_train(X, Y, method)

% Set standard method
if nargin < 3
    method = 'bayes';
end

% Nearest neighbor
if nnz(strcmp(method, ["nn", "knn", "wknn", "wknn"]))
    classification_data = {X, Y}; 
    return
end


% Bayes Theorem
if strcmp(method, 'bayes')
    X_face = X(:,Y==1);
    X_not_face = X(:,Y==-1);

    m_face  = mean(X_face');
    m_not_face = mean(X_not_face');

    std_face = std(X_face');
    std_not_face = std(X_not_face');
    
    classification_data = {m_face' std_face; 
                           m_not_face' std_not_face};
    return
end

% Support Vector Machine
if strcmp(method, 'svm')    
    return
end

end
 