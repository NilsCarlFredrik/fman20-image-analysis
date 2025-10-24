function y = classify(x, classification_data, method)
% Classification using ...

% Set standard method
if nargin < 3
    method = 'bayes';
end

% Nearest Neighbor
if strcmp(method, 'nn')
    distance = sum((classification_data{1}-x).^2);
    [~, indx] = min(distance);
    y = classification_data{2}(indx);
    return
end

% KNN
if strcmp(method, 'knn')
    k = 3;
    distance = sum((classification_data{1}-x).^2);
    [~, indx] = mink(distance, k);
    class_sum = sum(classification_data{2}(indx));
    y = sign(class_sum);
    return
end

% Weighted (distance order) KNN
if strcmp(method, 'wknn')
    k = 5;
    w = 1./(1:k);
    distance = sum((classification_data{1}-x).^2);
    [~, indx] = mink(distance, k);
    class_sum = sum(w.*classification_data{2}(indx));
    y = sign(class_sum);
    return
end

% Weighted (distance) KNN
if strcmp(method, 'wknn2')
    k = 5;
    distance = sum((classification_data{1}-x).^2);
    [dist, indx] = mink(distance, k);
    w = 1./dist;
    class_sum = sum(w.*classification_data{2}(indx));
    y = sign(class_sum);
    return
end

% Bayes Theorem
if strcmp(method, 'bayes')
    m_face = classification_data{1,1};
    std_face = classification_data{1,2};
    
    m_not_face = classification_data{2,1};
    std_not_face = classification_data{2,2};
    
    p_face = 0; 
    p_not_face = 0;
    
    for i = 1:size(x,1)
        p_face = p_face + log(normpdf(x(i),m_face(i),std_face(i)));
        p_not_face = p_not_face + log(normpdf(x(i),m_not_face(i),std_not_face(i)));
    end
    
    if p_face > p_not_face
        y = 1;
    else
        y = -1;
    end
    return
end

% Support Vector Machine
if strcmp(method, 'svm')    
    return
end


end


