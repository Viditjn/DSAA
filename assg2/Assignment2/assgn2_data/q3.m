function back_img = q3(filename)
img = imread(filename); % Read image
red = img(:, :, 1); % Red channel
green = img(:,:,2); % Green channel
blue = img(:,:,3); % Blue channel

%img2 = cat(3,red,green,blue)
%figure,imshow(img2)
blue=fftshift(fft2(blue)); % FFT of blue channel
red=fftshift(fft2(red)); %FFT of red channel
green=fftshift(fft2(green)); %FFT of green channel

% Filter
X = ones(253,256);
X( 1:90 , 125:130) = 0;
X( 125:130 , 1:90 ) = 0;
X( 125:130 , 166:253) = 0;
X( 166: 253 , 125:130) = 0;
%figure, imshow(X) /% Filter

%Multiply FFT with filter
blue = blue .* X; red = red .* X; green = green .* X; 

%IFFT of all channels
blue = uint8(abs(ifft2(ifftshift(blue))));
red = uint8(abs(ifft2(ifftshift(red))));
green = uint8(abs(ifft2(ifftshift(green))));

%Combining all three channels
back_img = cat(3, red, green, blue);
figure,imshow(back_img)