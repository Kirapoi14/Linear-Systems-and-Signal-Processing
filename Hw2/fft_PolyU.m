function [omega,spectrum] = fft_PolyU(t,signal)
%input -- time vector t
%         signal
%output -- frequency vector omega
%          spectrum

% dt=0.001;
% t=-10:dt:10;
% signal=zeros(size(t));
% signal(find(t>-1 & t<1))=1;

dt=t(2)-t(1);

%calculate sampling frequency fs
fs=1/dt;

omega=-fs/2:fs/length(t):fs*(1-1/length(t))-fs/2;
spectrum=fftshift(fft(signal))*dt;

%graph plotting. Can delete it if you don't want to plot the graph
figure;
subplot(2,1,1);
plot(omega,abs(spectrum));
xlabel('\omega (rad/s)');
ylabel('spectral amplitude');

subplot(2,1,2);
plot(omega,angle(spectrum));
xlabel('\omega (rad/s)');
ylabel('spectral phase (rad)');
end

