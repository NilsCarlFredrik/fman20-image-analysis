function hej = test_funktion(a,b,c)

% if ~exist('c', 'var')
%     c = 10;
% end 

if nargin < 3
    c = 10;
end
hej = a + b + c;

end