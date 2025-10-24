function y = features2class_knn(x, classification_data)
% nn-classification
distance = sum((classification_data{1}-x).^2);
% [~, indx] = min(distance);
k = 10;
[~, indx] = mink(distance, k);
y = mode(classification_data{2}(indx));

end