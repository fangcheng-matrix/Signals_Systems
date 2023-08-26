function [y,n] = sigadd(x1,n1,x2,n2)

n = min(min(n1),min(n2)):max(max(n1),max(n2));
y1 = zeros(1,length(n));
y2 = y1;
y1(find((n>=min(n1)) & (n<=max(n1)) == 1)) = x1;
y2(find((n>=min(n2)) & (n<=max(n2)) == 1)) = x2;
y = y1 + y2;