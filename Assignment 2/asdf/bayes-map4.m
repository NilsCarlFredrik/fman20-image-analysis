%% 4
% The cases
A = [0 1 1 0];
B = [1 0 0 1];
C = [1 1 1 0];
y = {A B C};

% Probability of cases
PA = 1/4;
PB = 1/2;
PC = 1/4;
Py = {PA PB PC};

% Scene
X = [0 1 1 1];

% Noise
e1 = 0.05;
e2 = 0.5;

% Likelihood
PX_Y = @(X,Y,e) (1-e)^(sum(Y==X)) * e^(sum(Y~=X)); %%% UPDATED %%%

Pa = zeros(1,3);
Pb = zeros(1,3);
for i=1:3
    Pa(i) = PX_Y(X,y{i},e1)*Py{i};
    Pb(i) = PX_Y(X,y{i},e2)*Py{i};
end

Pa
Pb

Pa/sum(Pa)
Pb/sum(Pb)



















