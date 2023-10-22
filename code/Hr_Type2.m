function [Hr,w,b,L]=Hr_Type2(h)
% Computes amplitude response Hr(w) of a Type-2 LP FIR filter
M=length(h);
L=M/2;
b=2*[h(L:-1:1)];
n=[1:L];
n=n-0.5;
w=[0:500]'*pi/500;
Hr=cos(w*n)*b';