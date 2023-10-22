function [b,a]=cas2dir(b0,B,A)
%CASCADE to DIRECT form conversion
[K,L]=size(B);
b=[1];
a=[1];
for i=1:1:K
	b=conv(b,B(i,:));
	a=conv(a,A(i,:));
end
b=b*b0;