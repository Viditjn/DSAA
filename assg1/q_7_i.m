% Record your voice
myRecoding = audiorecorder(44100, 24, 1);
disp('Start speaking')
recordblocking(myRecoding, 3);
disp('stop there');
play(myRecoding)
y = getaudiodata(myRecoding);
audiowrite('myrec.wav',y,44100)