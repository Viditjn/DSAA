twigs_noise = imread('twigs.png');
red_noise = twigs_noise(:,:,1);     % red channel
green_noise = twigs_noise(:,:,2);   % green channel
blue_noise = twigs_noise(:,:,3);    % blue channel

r = size(twigs_noise, 1); c = size(twigs_noise, 2);
a = uint8(zeros(r,c));

red_fft = fftshift(fft2(red_noise));
green_fft = fftshift(fft2(green_noise));
blue_fft = fftshift(fft2(blue_noise));

filter = double(ones(r,c)); 
l = 100;     % length of noise bands

b = 1;      % breadth/2 of noise bands
filter(1:l, c/2-b+1:c/2+b+1) = 0.0;
filter(r-l:r, c/2-b+1:c/2+b+1) = 0.0;

b = 2;
filter(ceil(r/2)-b:ceil(r/2)+b, 1:l) = 0.0;
filter(ceil(r/2)-b:ceil(r/2)+b, c-l:c) = 0.0;

red_filtered = red_fft.*filter;
green_filtered = green_fft.*filter;
blue_filtered = blue_fft.*filter;

red = abs(ifft2(ifftshift(red_filtered)));
green = abs(ifft2(ifftshift(green_filtered)));
blue = abs(ifft2(ifftshift(blue_filtered)));

nf = 250;
twigs = cat(3, red/nf, green/nf, blue/nf);
imshow(twigs, []);