function a = g(X)

a = zeros(size(X));

for i = 1:length(X)
    if abs(X(i)) <= 1
        a(i) = abs(X(i))^3 - 2*abs(X(i))^2 + 1;
    elseif abs(X(i)) > 2
        a(i) = 0;
    else
        a(i) = -abs(X(i))^3 + 5*abs(X(i))^2 - 8*abs(X(i)) +4;
    end
end
    
    