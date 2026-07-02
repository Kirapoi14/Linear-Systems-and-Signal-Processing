function [t,signal] = ifft_PolyU(omega,spectrum)

%input -- frequency vector omega
%          spectrum
%output -- time vector t
%         signal

%calculate sampling frequency fs
fs=-omega(1)*2;
df=omega(2)-omega(1);
dt=1/fs;

%calculate time vector
t= -dt*(length(omega)-1)/2:dt:dt*(length(omega)/2);
%calculate the inverse fourier transform 
signal=ifft(ifftshift(spectrum))*df*length(omega);

%graph plotting. Can delete it if you don't want to plot the graph
figure;
subplot(2,1,1);
plot(t,abs(signal));
xlabel('t (s)');
ylabel('signal amplitude');

subplot(2,1,2);
plot(t,angle(signal));
xlabel('t (s)');
ylabel('signal phase (rad)');
end