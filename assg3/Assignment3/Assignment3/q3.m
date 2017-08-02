c = 2;
F = create_mat_dct;
im = imread('LAKE.TIF');
subplot(121);
imshow(im);

qm=[16 11 10 16 24 40 51 61;
    12 12 14 19 26 58 60 55;
    14 13 16 24 40 57 69 56;
    14 17 22 29 51 87 80 62;
    18 22 37 56 68 109 103 77;
    24 35 55 64 81 104 113 92;
    49 64 78 87 103 121 120 101;
    72 92 95 98 112 100 103 99];

[l1,l2] = size(im);
l1 = l1/8;
l2 = l2/8;
startx = 1;
starty = 1;
for i = 1:l1
    starty = 1;
    for j = 1:l2
        mat = im(startx : startx+7,starty : starty+7);
        dct = myDCT(mat,F);
        quantdct = myDCT_quantization(dct,qm,c);
        im(startx : startx+7,starty : starty+7) = quantdct;
        starty = starty +8;
    end
    startx = startx + 8;
end

subplot(122);
imshow(im);
