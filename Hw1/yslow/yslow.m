filename = '..\Bilibili@Ahkmenrah - Bilibili@Ahkmenrah.mp3';
[y, FS] = audioread(filename);
y_t=y(FS*10+1:FS*20); 
m = length(y_t);

t=1/FS:1/FS:0.0015;
y_slow = [0 y_t(1) 0 y_t(2) 0 y_t(3) 0 y_t(m-1) 0 y_t(m) 0];
y_slow = zeros(1,2*length(y_t));
for i = 1:m
    y_slow(2*i) = y_t(i);
end
plot(t,y_slow(1:length(t)))
title("yslow")

player = audioplayer(y_slow,FS);
play(player)

audiowrite('.\slow.mp4',y_slow,FS)