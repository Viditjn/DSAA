function [result] = myDCT_quantization(imDCT,qm,c)
l1 = size(imDCT,1);
l2 = size(imDCT,2);
quantizedMat = zeros(l1,l2);

for i = 1:l1
    for j = 1:l2
        quantizedMat(i,j) = round(imDCT(i,j)/(qm(i,j)*c));
    end
end
result = quantizedMat;
end