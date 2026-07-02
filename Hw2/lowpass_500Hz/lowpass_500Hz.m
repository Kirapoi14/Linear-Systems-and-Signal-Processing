filename = '..\bad_apple!!.mp3';
[y, FS] = audioread(filename);
signal=y(FS*10+1:FS*20);
t = (0:length(signal)-1)/FS;

[omega,spectrum] = fft_PolyU(t,signal)

cutoff_freq = 500;
H = zeros(size(spectrum));
for lowpass_indices = find(omega >= -cutoff_freq & omega <= cutoff_freq)
    H(lowpass_indices) = 1;
end

spectrum = spectrum .* H;
figure;
subplot(2,1,1);
plot(omega,abs(spectrum));
xlabel('\omega (rad/s)');
ylabel('spectral amplitude');

subplot(2,1,2);
plot(omega,angle(spectrum));
xlabel('\omega (rad/s)');
ylabel('spectral phase (rad)');

[t,signal] = ifft_PolyU(omega,spectrum)

player = audioplayer(signal,FS);
play(player)

audiowrite('lowpass_500Hz.mp4',signal,FS)