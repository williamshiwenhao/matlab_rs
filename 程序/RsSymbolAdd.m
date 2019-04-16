%*************************************************************************
%   Created     :   2010-6-3
%   Author      :   Shiqin Song(shiqinsac@gmail.com)
%   File Name   :   RsSymbolAdd.m
%   Abstract    :   Rs Symbol Addition.
%    
%   Version     :   1.0
%**************************************************************************
function [Sum] = RsSymbolAdd(LOperand, ROperand)

LNum = dec2bin(mod(LOperand,16),4);  %����������תΪGF2^4���ϵĶ�����ʸ����ʾ
RNum = dec2bin(mod(ROperand,16),4);
Sum = bin2dec(int2str(mod(LNum+RNum,2)));