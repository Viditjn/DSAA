im = imread('LAKE.TIF');
subplot(121);
imshow(uint8(im));
title('orignal');
im = double(im);
%im = double(im);
meanArray = mean(im(:,1:end));
for i = 1:size(im,2)
    col = im(:,i);
    col = col - meanArray(i);
    im(:,i) = col;
end
%scatter
ratio = 0.9;
C = cov(im);
[E V] = eig(C);
im_new = im*E;
%size(im_new)
%inE = inv(E);
im1 = im_new*E';
E(:,1:round(size(E,2)*ratio)) = 0;
%im_new(:,1:200) = 0;
im_new = im*E;
IMNEW = im_new;
im2 = im_new*E';
for i = 1:size(im2,2)
    col1 = im1(:,i);
    col2 = im2(:,i);
    col1 = col1 + meanArray(i);
    col2 = col2 + meanArray(i);
    im1(:,i) = col1;
    im2(:,i) = col2;
end
%subplot(132);
%imshow(uint8(im1));
%title('Combined-No Compressionn');
subplot(122);
imshow(uint8(im2));
title('Combined With 70 % Compressionn');
