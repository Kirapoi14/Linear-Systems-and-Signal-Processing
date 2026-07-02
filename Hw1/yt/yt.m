filename = '..\Bilibili@Ahkmenrah - Bilibili@Ahkmenrah.mp3';
[y, FS] = audioread(filename);
y_t=y(FS*10+1:FS*20); 
m = length(y_t);

t=1/FS:1/FS:0.01;
plot(t,y_t(1:length(t)))
title("yt")