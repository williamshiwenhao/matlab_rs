%*************************************************************************
%   Created     :   2010-6-3
%   Author      :   Shiqin Song(shiqinsac@gmail.com)
%   File Name   :   RsSymbolAdd.m
%   Abstract    :   Rs Symbol Addition.
%    
%   Version     :   1.0
%**************************************************************************
function [Sum] = RsSymbolAdd(LOperand, ROperand)

LNum = dec2bin(mod(LOperand,16),4);  %将输入数据转为GF2^4域上的二进制矢量表示
RNum = dec2bin(mod(ROperand,16),4);
Sum = bin2dec(int2str(mod(LNum+RNum,2)));