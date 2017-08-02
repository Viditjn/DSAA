%DNA matching
function [answer] = DNAClassifier(sampleDNA)
load('AncestorData.mat');
rhesusA = abs(fft(rhesus(1,1:1000)));
rhesusG = abs(fft(rhesus(2,1:1000)));
rhesusT = abs(fft(rhesus(3,1:1000)));
rhesusC = abs(fft(rhesus(4,1:1000)));
chimpsA = abs(fft(chimps(1,1:1000)));
chimpsG = abs(fft(chimps(2,1:1000)));
chimpsT = abs(fft(chimps(3,1:1000)));
chimpsC = abs(fft(chimps(4,1:1000)));
humansA = abs(fft(humans(1,1:1000)));
humansG = abs(fft(humans(2,1:1000)));
humansT = abs(fft(humans(3,1:1000)));
humansC = abs(fft(humans(4,1:1000)));

%load('TestData.mat');
A = abs(fft(sampleDNA(1,1:1000)));
G = abs(fft(sampleDNA(2,1:1000)));
T = abs(fft(sampleDNA(3,1:1000)));
C = abs(fft(sampleDNA(4,1:1000)));
temp = 0;
name = 1;
temp = abs(mae(rhesusA,A)) + abs(mae(rhesusG,G)) + abs(mae(rhesusT,T)) + abs(mae(rhesusC,C));
temp1 = 0;
temp1 = abs(mae(chimpsA,A)) + abs(mae(chimpsG,G)) + abs(mae(chimpsT,T)) + abs(mae(chimpsC,C));
if temp > temp1
    name = 2;
    temp = temp1;
end
temp1 = 0;
temp1 = abs(mae(humansA,A)) + abs(mae(humansG,G)) + abs(mae(humansT,T)) + abs(mae(humansC,C));
if temp > temp1
    name = 3;
    temp = temp1;
end
if name == 1
    %fprintf('Rhesus\n');
    answer = 'Rhesus'
end
if name == 2
    %fprintf('Chimp\n');
    answer = 'Chimp'
end
if name == 3
    %fprintf('Human\n');
    answer = 'Human'
end
end

