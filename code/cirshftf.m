function y=cirshftf(x,m,N)
% Method: y[n]=idft(dft(x[n])*WN^(mk))
if length(x)>N
	error('N must be >= the length of x')
end
x=[x,zeros(1,N-length(x))];
Xk=dft(x,N);
k=[0:1:N-1];
mk=m'*k;
WN=exp(-j*2*pi/N);
WNmk=WN.^(mk);
Xk=Xk.*WNmk;
y=idft(Xk,N);