function y=parfiltr(C,B,A,x)
% PARALLEL form realization of IIR filters
[K,L]=size(B);
N=length(x);
w=zeros(K+1,N);
w(1,:)=filter(C,1,x);
for i=1:K
	w(i+1,:)=filter(B(i,:),A(i,:),x);
end
y=sum(w);