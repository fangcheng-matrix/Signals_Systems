function [Rp,As]=delta2db(delta1,delta2)
% Converts absolute specs delta1 and delta2 into dB specs Rp and As
Rp=-20*log10((1-delta1)/(1+delta1));
As=-20*log10(delta2/(1+delta1));