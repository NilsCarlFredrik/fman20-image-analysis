function y = features2class(x, classification_data)
% nn-classification
distance = sum((classification_data{1}-x).^2);
[~, indx] = min(distance);
y = classification_data{2}(indx);

end