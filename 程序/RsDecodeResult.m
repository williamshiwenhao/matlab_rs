%*************************************************************************
%   Created     :   2010-6-5
%   Author      :   Shiqin Song(shiqinsac@gmail.com)
%   File Name   :   RsDecodeResult.m
%   Abstract    :   Calculate Rs decode result.
%    
%   Version     :   1.0
%**************************************************************************
function [RsDecode] = RsDecodeResult(RsCodeWithNoise, ErrValueCalc, ErrPositionCalc)

global GF24 Rs
Parameter

RsDecode = RsCodeWithNoise;
if(length(ErrPositionCalc)>0)
    for i = 1:1:length(ErrPositionCalc)
        Pos = ErrPositionCalc(i)+1;
        RsDecode(Pos) = RsSymbolSub(RsDecode(Pos),ErrValueCalc(i));
    end
end
RsDecode = RsDecode(1,Rs.n-Rs.k+1:Rs.n);