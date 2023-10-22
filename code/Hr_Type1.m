function [Hr,w,a,L]=Hr_Type1(h)
% Computes amplitude response Hr(w) of a Type-1 LP FIR filter
M=length(h);
L=(M-1)/2;
a=[h(L+1),2*h(L:-1:1)];
n=[0:L];
w=[0:500]'*pi/500;
Hr=cos(w*n)*a';