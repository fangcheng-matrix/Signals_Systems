function [X] = dtft(x,n,w)
% Computes discrete-time Fourier Transform
% [X] = dtft(x,n,w)
%   X = DTFT values computed at w frequencies
%   x = finite duration sequence over n
%   n = sample position vector
%   w = frequency location vector
%
X = x * exp(-j*n'*w);
end