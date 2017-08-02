imorignal = imread('LAKE.TIF');
len = 100;
%entro = zeros(len);
%rmse = zeros(len);
for i = 1:len
    [imre entro(i) rmse(i)] = checkC(i);
    %entro(i) = My_entropy(imre);
    %rmse(i) = RMSE(imorignal,imre); 
end
figure,plot(rmse,entro);
    
    


