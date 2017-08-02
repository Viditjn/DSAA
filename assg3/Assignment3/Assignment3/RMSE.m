function [result] = RMSE(im1,im2)
a = double(im1);
b = double(im2);
l1 = size(im1,1);
l2 = size(im1,2);
c = zeros(l1,l2);
for i = 1:l1
    for j = 1:l2
        c(i,j) = (a(i,j)-b(i,j))*(a(i,j)-b(i,j));
    end
end
mse = sum(c(:)) / numel(im1);
rmse = sqrt(mse);
result = rmse;
end