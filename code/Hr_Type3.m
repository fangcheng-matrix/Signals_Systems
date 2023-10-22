function [Hr,w,c,L]=Hr_Type3(h)
% Computes amplitude response Hr(w) of a Type-3 LP FIR filter
M=length(h);
L=(M-1)/2;
c=2*[h(L+1:-1:1)];
n=[0:L];
w=[0:500]'*pi/500;
Hr=sin(w*n)*c';