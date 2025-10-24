function hsv = my_rgb2hsv(rgb)

if max(rgb) > 1
    rgb = double(rgb)./255;
end

mx = reshape(max(max(rgb)), [], 1);
mn = reshape(min(min(rgb)), [], 1);
diff = mx-mn;

end