filename = '.\Bilibili@Ahkmenrah - Bilibili@Ahkmenrah.mp3';
[y, FS] = audioread(filename);
t = tiledlayout(2,2);
y_t=y(FS*10+1:FS*20); 
m = length(y_t);

nexttile
t=1/FS:1/FS:0.01;
plot(t,y_t(1:length(t)))
title("yt")

nexttile
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

audiowrite('.\yslow\slow.mp4',y_slow,FS)

nexttile
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

audiowrite('.\yfast\fast.mp4',y_fast,FS)

nexttile
t=1/FS:1/FS:0.01;
y_back=zeros(1,length(y_t));
for i = 1:m
    y_back(i) = y_t(m-i+1);
end
plot(t,y_back(1:length(t)))
title("yback")

player = audioplayer(y_back,FS);
play(player)

audiowrite('.\yback\back.mp4',y_back,FS)