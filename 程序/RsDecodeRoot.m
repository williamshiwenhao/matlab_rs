%*************************************************************************
%   Created     :   2010-6-5
%   Author      :   Shiqin Song(shiqinsac@gmail.com)
%   File Name   :   RsDecodeRoot.m
%   Abstract    :   Calculate the roots of error positions polynomial with traversal method.
%    
%   Version     :   1.0
%**************************************************************************
function [RootCalc] = RsDecodeRoot(ErrPosPolyCalc)

global GF24 Rs
Parameter

RootCalc = zeros(0,0);
%求出多项式的最高幂次，即最多可能有的根的个数
Len = length(ErrPosPolyCalc);
for i = length(ErrPosPolyCalc):-1:1
    if(ErrPosPolyCalc(i)==0)
        Len = Len-1;
    end
end

if(Len == 0)
    return;
else
    %判断0是否是多项式的一个根(不可能出现重根)
    RootCalc = zeros(0,0);
    if ((ErrPosPolyCalc(1) == 0))
        RootCalc = [0];
    end
    %遍历求根(不可能出现重根)
    for i = 1:1:length(GF24.decimal)
        Sum = ErrPosPolyCalc(1,1);
        for j = 2:1:Len
            Index = mod((i-1)*(j-1),15)+1;
            Sum = RsSymbolAdd(Sum,RsSymbolMul(ErrPosPolyCalc(j),GF24.decimal(Index)));
        end
        if(Sum == 0)
            RootCalc = [RootCalc GF24.decimal(i)];
        end
        if(length(RootCalc) == Len)
            return;
        end
    end
end