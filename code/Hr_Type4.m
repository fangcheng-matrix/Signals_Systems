function [Hr,w,d,L]=Hr_Type4(h)
% Computes amplitude response Hr(w) of a Type-4 LP FIR filter
M=length(h);
L=M/2;
d=2*[h(L:-1:1)];
n=[1:L];
n=n-0.5;
w=[0:500]'*pi/500;
Hr=sin(w*n)*d';