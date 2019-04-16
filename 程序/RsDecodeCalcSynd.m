%*************************************************************************
%   Created     :   2010-6-5
%   Author      :   Shiqin Song(shiqinsac@gmail.com)
%   File Name   :   RsDecodeCalcSynd.m
%   Abstract    :   Syndrome Calculation.
%    
%   Version     :   1.0
%**************************************************************************
function [SyndromCalc] = RsDecodeCalcSynd(RsCodeWithNoise)

global GF24 Rs
Parameter

RsRecMsg = RsCodeWithNoise(1:Rs.n);  %截取RS码信息位
SyndromCalc = zeros(1,2*Rs.t);
for i = 1:1:Rs.n
    for j = 1:1:2*Rs.t
        Index = mod((i-1)*j,15)+1;
        SyndromCalc(j) = RsSymbolAdd(SyndromCalc(j),RsSymbolMul(RsRecMsg(1,i),GF24.decimal(Index,1)));
    end
end