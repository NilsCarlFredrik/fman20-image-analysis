interval = linspace(-3,3);

figure(1)
plot(interval,g(interval));
title("g(x)")

f = [3 4 7 4 3 5 6];
F = zeros(size(rng));
rng = linspace(1,7);

for i=1:length(f)
   F = F + g(rng-i)*f(i);
end

figure(2)
plot(rng,F);
title("Fg(x)")

%% 

syms x;

g1 = abs(x)^3 - 2*abs(x)^2 + 1;
g2 = -abs(x)^3 + 5*abs(x)^2 - 8*abs(x) + 4;
g3 = 0;

dg1 = diff(g1);
dg2 = diff(g2);
dg3 = 0;

comp = @(f1, f2, X) double(subs(f1,x,X))==double(subs(f2,x,X));

[
comp(g1,g2,1)
comp(g1,g2,-1)

comp(dg1,dg2,1)
comp(dg1,dg2,-1)

comp(g2,g3,2)
comp(g2,g3,-2)

comp(dg2,dg3,2)
comp(dg2,dg3,-2)
]'







