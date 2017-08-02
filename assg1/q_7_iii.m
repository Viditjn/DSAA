[x,FX] = audioread('myrec.wav');

disp('original')
sound(x,FX);
pause(size(x)/FX);

% http://www.openairlib.net/auralizationdb/content/st-patricks-church-patrington-model
% Change the church.wav file with other impulse file with other .wav file
disp('Church')
[h1,FH1] = audioread('church.wav');
h1norm = resample(h1(:,1), FX, FH1);
con1st = convn(x,h1norm)
sound(con1st,FX)
pause(size(x)/FX);