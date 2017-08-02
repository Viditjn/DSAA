function [result] = My_entropy(im)
h = imhist(im);
h = h/numel(im);
h (h == 0) = 1;
result = -sum(h.*log2(h));
end
