function [y]=hsolpadd(x,h,N)
% High-speed Overlap-Add method of block convolution using FFT
% y=output sequence 
% x=input sequence
% h=impulse response
% N=block length >= 2*length(h)-1
Lenx=length(x);
M=length(h);
M1=2*M-1;
h=fft(h,N);
x=[x,zeros(1,N-1)];
K=floor(Lenx/M);
Y=zeros(K+1,N);
for k=0:K
	xk=fft(x(k*M+1:k*M+M),N);
	Y(k+1,:)=real(ifft(xk.*h));
end
Y(2:end,1:M-1)=Y(2:end,1:M-1)+Y(1:K,(M+1):M1);
Y=Y(:,1:M)';
y=(Y(:))';