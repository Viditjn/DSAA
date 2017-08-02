function [result] = create_mat_dct()
len = 8;
dctMatrix = zeros(len,len);
r = 1;
for i = 1:len
    for j = 1:len
        if i == 1
            r = sqrt(1/len);
        else
            r = sqrt(2/len);
        end
        theta = (pi*((2*(j-1))+1)*(i-1))/(2*len);
        dctMatrix(i,j) = r * cos(theta);
    end
end
result = dctMatrix;
% b = dctmtx(8);
% c = zeros(8,8);
% for i = 1:len
%     for j = 1:len
%         c(i,j) = dctMatrix(i,j)-b(i,j);
%     end
% end
end
