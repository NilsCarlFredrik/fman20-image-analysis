function hsl = rgb2hsl(rgb)

if ~isa(rgb,'double')
    RGB = double(rgb);
end

if max(RGB) > 1
    RGB = RGB/255;
end

RGB = reshape(RGB, [], 1);


