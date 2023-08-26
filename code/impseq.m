function [x,n] = impseq(no,n1,n2)
% Generates x(n) = delta(n - no); n1 <= n <= n2
% ---------------------------------------------
% [x,n] = impseq(no,n1,n2)
%
n = [n1:n2];
x = [(n - no) == 0];