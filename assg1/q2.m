z = [zeros(250,500);ones(250,500)];
z = 255*z;
y = [0 1 0;0 0 0;0 -1 0];
x = conv2(z,y);
a = imread('cameraman.tif');
a = im2double(a);
b = conv2(a,y);
c = conv2(a,transpose(y));
imshow(x);
figure;
imshow(b);
figure;
imshow(c);