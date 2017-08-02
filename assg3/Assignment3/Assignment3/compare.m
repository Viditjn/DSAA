function [rmsedct rmsefft] = compare(im)
F = create_mat_dct();
[l1,l2] = size(im);
l1 = l1/8;
l2 = l2/8;
startx = 1;
%starty = 1;
imdct = im;
imfft = im;
c = 2;

qm=[16 11 10 16 24 40 51 61;
    12 12 14 19 26 58 60 55;
    14 13 16 24 40 57 69 56;
    14 17 22 29 51 87 80 62;
    18 22 37 56 68 109 103 77;
    24 35 55 64 81 104 113 92;
    49 64 78 87 103 121 120 101;
    72 92 95 98 112 100 103 99];

for i = 1:l1
    starty = 1;
    for j = 1:l2
        defft = zeros(8,8);
        dedct = zeros(8,8);
        mat = im(startx : startx+7,starty : starty+7);
        dctmat = myDCT(mat,F);
        fftmat = fft2(mat);
        for k = 1:8
            for l = 1:8
                if (k+l)<=8
                    dedct(k,l) = dctmat(k,l);
                    defft(k,l) = fftmat(k,l);
                else
                    defft(k,l) = 0;
                    dedct(k,l) = 0;
                end
            end
        end
        %quantdct = myDCT_quantization(rmsedct,qm,c);
        %dequantdct = myDCT_dequantization(quantdct,qm,c);
        redct = myIDCT(dedct,F);
        refft = ifft2(defft);
        imdct(startx : startx+7,starty : starty+7) = double(redct);
        imfft(startx : startx+7,starty : starty+7) = double(refft);
        starty = starty +8;
    end
    startx = startx + 8;
end
rmsedct = RMSE(imdct,im);
rmsefft = RMSE(real(imfft),im);
subplot(121);
imshow(uint8(real(imdct)));
title('DCT');
subplot(122);
imshow(uint8(real(imfft)));
title('FFT');
figure;
end