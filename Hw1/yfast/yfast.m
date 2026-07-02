filename = '..\Bilibili@Ahkmenrah - Bilibili@Ahkmenrah.mp3';
[y, FS] = audioread(filename);
y_t=y(FS*10+1:FS*20); 
m = length(y_t);

t=1/FS:1/FS:0.0050;
y_fast = zeros(1,0.5*length(y_t));
n = 1;
for i = 1:2:m
    y_fast(n) = y_t(i);
    n = n + 1;
end
plot(t,y_fast(1:length(t)))
title("yfast")

player = audioplayer(y_fast,FS);
play(player)

audiowrite('.\fast.mp4',y_fast,FS)