%% 3 Classification using Nearest Neighbor and Bayes theorem
class_1 = [0.4003, 0.3988, 0.3998, 0.3997, 0.4010, 0.3995, 0.3991];
class_2 = [0.2554, 0.3139, 0.2627, 0.3802, 0.3287, 0.3160, 0.2924];
class_3 = [0.5632, 0.7687, 0.0524, 0.7586, 0.4243, 0.5005, 0.6769];
%% Nearest Neighbor

train_indx = 1:4;
test_indx = 5:7;

train_set = [class_1(train_indx), class_2(train_indx), class_3(train_indx)]';
test_set = [class_1(test_indx), class_2(test_indx), class_3(test_indx)]';

classification_indx = zeros(9,1);
for i = 1:9
    [M, I] = min(abs(train_set - test_set(i)));
    classification_indx(i) = I;
end

classification_indx
knnsearch(train_set, test_set)

%% Gaussian Distribution

class = {class_1, class_2, class_3};
m = [0.4 0.3 0.5];
sigma = [0.01 0.05 0.2];

for i = 1:3
    probs = normpdf(class{i},m',sigma')
    [max_prob, classification] = max(probs)
end

%%
x = linspace(0,0.8, 500);
clf
figure(2)
hold on
colors = ['b', 'r', 'g'];
for i = 1:3
    plot(x,normpdf(x,m(i),sigma(i)), join('-', colors(i)))
    
%     for j = 1:3
%         plot(class{j},normpdf(class{j},m(j),sigma(j)), join('o',colors(j)))
%     end
%     
%     for j = 1:length(class{i})   
%         xline(class{i}(j),join('--', colors(i)));
%     end
%     
end
legend





%%













