function I=cplxcomp(p1,p2)
% Compares tow complex pairs which contain the same scalar elements
% but (possibly) at different indices. This routine should be
% used after CPLXPAIR routine for rearranging pole vector and its
%corresponding residue vector.
I=[];
for j=1:length(p2)
	for i=1:length(p1)
		if (abs(p1(i)-p2(j))<0.0001)
			I=[I,i];
		end
	end
end
I=I';