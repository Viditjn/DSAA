function [result] = myIDCT(im,F)
%A = im2double(imread(im));
Ftranspose = transpose(F);
A = double(im);
%Finv = inv(F);
result = Ftranspose*A*F;
end