function [ output ] = reorderDatagram(file1, file2, file3, file4, file5)

arrayName = [file1; file2; file3; file4; file5];

l = 5;

for i = 1:l
    % smoothening of chunks of file by gaussian window
    [tempChunk,fs] = audioread(arrayName(i,:));
    tempChunk = tempChunk(:,1:1); % channel 1
    g = gausswin(20);
    g = g/sum(g); 
    denoise = conv(tempChunk(:,1), g, 'same'); 
    smoothfile=sgolayfilt(denoise,1,17); %framelen be odd doesn't work in case if its odd ans order<framelen
    audiowrite(strcat(num2str(i),'smooth.wav'),smoothfile,fs);
end

flag = zeros(1,5);
co = 1;
order = zeros(1,5);
start = 3;
order(1) = 3;
flag(start) = 1;

while(co < 5)
    co = co+1;
    %flag(start) = 1;
    [tempChunk,Fs] = audioread(strcat(num2str(start),'smooth.wav'));
    tempChunk = tempChunk(:,1:1);
    totalSize = size(tempChunk);
    tempChunk = tempChunk(totalSize-Fs*5:totalSize,:);
    temp = fft(tempChunk);
    temp = temp(1:size(temp)/2);
    temp = abs(temp);
%     start = findnext(tmp,check);
    max = 0;
    for i = 1:l
        if(flag(i)~=1)
            [tempChunk2,Fs] = audioread(strcat(num2str(i),'smooth.wav'));
            tempChunk2 = tempChunk2(:,1:1);
            tempChunk2 = tempChunk2(1:Fs*5,:); 
            temp2 = fft(tempChunk2);
            temp2 = temp2(1:size(temp2)/2);
            temp2 = abs(temp2);
            val = corr2(temp,temp2);
            if(val >= max)
                max = val;
                next = i;
            end
        end
    end
    start = next;
    order(co) = start;
    flag(start) = 1;
end
disp(order);
final = zeros(0,2);
for i = 1:4
    [f1, Fs] = audioread(arrayName(order(i), :));
    final = [final; f1(1:end-Fs*l,:)];
end

[f1, Fs] = audioread(arrayName(order(5), :));
final = [final; f1];

f1 = final(:,1);
f2 = final(:,2);
denoise = conv(f1, g, 'same'); 
result1 = sgolayfilt(denoise,1,17);

denoise = conv(f2, g, 'same'); 
result2 = sgolayfilt(denoise,1,17);

sound([result1 result2],Fs);
output = [result1,result2];

end
