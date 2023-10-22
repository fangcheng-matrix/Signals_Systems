function y=circonvt(x1,x2,N)
% Circular convolution in the time domain
if length(x1)>N
	error('N must be <= the length of x1')
end
if length(x2)>N
	error('N must be <= the length of x2')
end
x1=[x1,zeros(1,N-length(x1))];
x2=[x2,zeros(1,N-length(x2))];
m=[0:N-1];
x2=x2(mod(-m,N)+1);
H=zeros(N,N);
for n=1:N
	H(n,:)=cirshftt(x2,n-1,N);
end
y=x1*conj(H');
end