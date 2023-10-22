function y=circulnt(x,N)
if length(x)>N
	error('N must be <= the length of x')
end
x=[x,zeros(1,N-length(x)];
m=[0:N-1];
x=x(mod(-m,N)+1);
H=toeplitz([x(1) fliplr(x(2:end))], x);