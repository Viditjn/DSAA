function [result] = myDCT(im,F)
%A = im2double(imread(im));
Ftranspose = transpose(F);
A = double(im);
result = F*A*Ftranspose;
end