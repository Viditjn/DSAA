function [result] = myDCT_dequantization(imqDCT,qm,c)
l1 = size(imqDCT,1);
l2 = size(imqDCT,2);
dequantizedMat = zeros(l1,l2);

for i = 1:l1
    for j = 1:l2
        dequantizedMat(i,j) = round(imqDCT(i,j)*qm(i,j)*c);
    end
end
result = dequantizedMat;
end