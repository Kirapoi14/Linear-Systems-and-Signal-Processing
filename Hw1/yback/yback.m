filename = '..\Bilibili@Ahkmenrah - Bilibili@Ahkmenrah.mp3';
[y, FS] = audioread(filename);
y_t=y(FS*10+1:FS*20); 
m = length(y_t);

t=1/FS:1/FS:0.01;
y_back=zeros(1,length(y_t));
for i = 1:m
    y_back(i) = y_t(m-i+1);
end
plot(t,y_back(1:length(t)))
title("yback")

player = audioplayer(y_back,FS);
play(player)

audiowrite('.\back.mp4',y_back,FS)