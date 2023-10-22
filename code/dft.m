function [Xk]=dft(xn,N)
% Computes Discrete Fourier Transform
% Xk=DFT coeff. array over 0 <= k <= N-1
% xn=N-point finite-duration sequence
% N=Length of DFT
n=[0:1:N-1];
k=[0:1:N-1];
WN=exp(-j*2*pi/N);
nk=n'*k;
WNnk=WN.^nk;
Xk=xn*WNnk;
end