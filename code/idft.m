function [xn]=idft(Xk,N)
% Computes Inverse Discrete Transform
% xn=N-point sequence over 0 <= n <= N-1
% Xk=DFT coeff. array over 0 <= k <= N-1
% N=Length of DFT
n=[0:1:N-1];
k=[0:1:N-1];
WN=exp(-j*2*pi/N);
nk=n'*k;
WNnk=WN.^(-nk);
xn=(Xk*WNnk)/N;
end