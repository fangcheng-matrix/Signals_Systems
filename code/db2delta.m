function [delta1,delta2]=db2delta(Rp,As)
% Convert dB specs Rp ans As into absolute specs delta1 and delta2
delta1=(1-10^(-Rp/20))/(1+10^(-Rp/20));
delta2=10^(-As/20)*(1+delta1);