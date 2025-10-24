function y = classify(x, classification_data, method)
% Classification using ...

% Set standard method
if ~exist('method', 'var')
    method = 'bayes';
end

% Nearest Neighbor
if strcmp(method, 'nn')
    distance = sum((classification_data{1}-x).^2);
    [~, indx] = min(distance);
    y = classification_data{2}(indx);
    return
end

% Bayes Theorem
if strcmp(method, 'bayes')
    p = zeros(1,10);
    
    for i = 1:10
        mi = classification_data{i,1};
        stdi = classification_data{i,2};
    
        for j = 1:size(x,1)
            p(i) = p(i) + log(normpdf(xi(j),mi(j),stdi(j)));
        end
    end
    
    [~, max_p_indx] = max(p);
    y = max_p_indx;
end

% Support Vector Machine
if strcmp(method, 'svm')    
    return
end


end


