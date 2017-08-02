[y,Fs] = audioread('myrec.wav');

maxSize = size(y) - 1;

y24k = resample(y,24000,Fs);
y16k = resample(y,16000,Fs);
y8k = resample(y,8000,Fs);
y4k = resample(y,4000,Fs);

% Playing the original sound sampled at 44.1kHz
sound(y, Fs)
pause(size(y)/Fs);

% Playing the sound resampled at 4kHz
sound(y4k, 4000)
pause(size(y4k)/4000);

%For Playing the sound at different sampling frequency just change y4k in
%above by y8k or y16k