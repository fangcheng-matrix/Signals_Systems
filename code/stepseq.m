function [x,n] = stepseq(no,n1,n2)
% Generates x(n) = u(n - no); n1 <= n <= n2
% -----------------------------------------
% [x,n] = stepseq(no,n1,n2)
%
n = [n1:n2];
x = [(n - no) >= 0];