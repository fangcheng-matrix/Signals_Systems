function y=circonvf(x1,x2,N)
%Circular convolution in the frequency domain
if length(x1)>N
	error('N must be <= the length of x1')
end
if length(x2)>N
	error('N must be <= the length of x2')
end
x1=[x1,zeros(1,N-length(x1))];
x2=[x2,zeros(1,N-length(x2))];
Xk1=dft(x1,N);
Xk2=dft(x2,N);
Xk=Xk1.*Xk2;
y=idft(Xk,N);
y=real(y);