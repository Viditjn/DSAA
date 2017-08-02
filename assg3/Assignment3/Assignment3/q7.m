im = imread('color.png');
YCbCr = rgb2ycbcr(im);
y_im = YCbCr(:,:,1);
cb_im = YCbCr(:,:,2);
cr_im = YCbCr(:,:,3);
y_noise = imnoise(y_im,'gaussian');
cb_noise = imnoise(cb_im,'gaussian');
cr_noise = imnoise(cr_im,'gaussian');
noise1 = cat(3,y_noise,cb_im,cr_im);
noise2 = cat(3,y_im,cb_noise,cr_im);
noise3 = cat(3,y_im,cb_im,cr_noise);
im1 = ycbcr2rgb(noise1);
im2 = ycbcr2rgb(noise2);
im3 = ycbcr2rgb(noise3);
subplot(131);
imshow(im1);
title('Y_component');
subplot(132);
imshow(im2);
title('Cb_component');
subplot(133);
imshow(im3);
title('Cr_component');