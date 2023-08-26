function [Xk] = dfs(xn,N)
% Computes Disctete Fourier Series Coefficients
% ----------------------------------------------
% [Xk] = dfs(xn,N)
% Xk = DFS coeff. array over 0 <= k <= N-1
% xn = One period of periodic signal over 0 <= n <= N=1
% N = Fundamental period of xn
%
n = [0:1:N-1];
k = [0:1:N-1];
WN = exp(-j * 2 * pi / N);
nk = k' * n;
WNnk = WN .^ nk;
Xk = xn * WNnk;
end