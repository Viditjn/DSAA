num = zeros(20);
rmsedct = zeros(20);
rmsefft = zeros(20);
diff = zeros(20);
for i = 1:20
    name = strcat('./Samples/',num2str(i),'.gif');
    im = imread(name);
    [rmsedct(i) rmsefft(i)] = compare(im);
    diff(i) = rmsefft(i) - rmsedct(i);
    num(i) = i;
end
plot(num,diff);