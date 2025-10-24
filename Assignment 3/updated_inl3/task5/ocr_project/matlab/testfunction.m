function blob = testfunction(block)

[Gmag Gdir] = imgradient(block.data);
blob = sum(sum(block.data));

end