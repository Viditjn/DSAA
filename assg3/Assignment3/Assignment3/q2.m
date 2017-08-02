p = [45 420; 298 427; 230 30];
c = 2;
F = create_mat_dct;
im = imread('LAKE.TIF');
%subplot(121);
%imshow(im);

qm=[16 11 10 16 24 40 51 61;
    12 12 14 19 26 58 60 55;
    14 13 16 24 40 57 69 56;
    14 17 22 29 51 87 80 62;
    18 22 37 56 68 109 103 77;
    24 35 55 64 81 104 113 92;
    49 64 78 87 103 121 120 101;
    72 92 95 98 112 100 103 99];

mat1 = im(45 : 45+7, 420 : 420+7);
mat2 = im(298 : 298+7, 427 : 427+7);
mat3 = im(230 : 230+7, 30 : 30+7);

subplot(321);
imshow(uint8(mat1));

subplot(323);
imshow(uint8(mat2));

subplot(325);
imshow(uint8(mat3));

dct1 = myDCT(mat1,F);
quantdct1 = myDCT_quantization(dct1,qm,c);
dequantdct1 = myDCT_dequantization(quantdct1,qm,c);
reconstruct1 = myIDCT(dequantdct1,F);
subplot(322);
imshow(uint8(reconstruct1));
im(45 : 45+7, 420 : 420+7) = reconstruct1;

dct2 = myDCT(mat2,F);
quantdct2 = myDCT_quantization(dct2,qm,c);
dequantdct2 = myDCT_dequantization(quantdct2,qm,c);
reconstruct2 = myIDCT(dequantdct2,F);
subplot(324);
imshow(uint8(reconstruct2));
im(298 : 298+7, 427 : 427+7) = reconstruct2;

dct3 = myDCT(mat3,F);
quantdct3 = myDCT_quantization(dct3,qm,c);
dequantdct3 = myDCT_dequantization(quantdct3,qm,c);
reconstruct3 = myIDCT(dequantdct3,F);
subplot(326);
imshow(uint8(reconstruct3));
im(230 : 230+7, 30 : 30+7) = reconstruct3;

%subplot(122);
%figure,imshow(uint8(im));