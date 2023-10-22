function [y,L,B]=QCoeff(x,N)
% Coefficieng Quantization using N=1+L+B bit representation with rounding operation
xm=abs(x);
L=max(max(0,fix(log2(xm(:)+eps)+1)));
if (L>N)
	errmsg=['*** N must be at least ',num2str(L),' ***'];
	error(errmsg);
end
B=N-L;
y=xm./(2^L);
y=round(y.*(2^N));
y=sign(x).*y*(2^(-B));