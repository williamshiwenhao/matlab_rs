%*************************************************************************
%   Created     :   2010-6-5
%   Author      :   Shiqin Song(shiqinsac@gmail.com)
%   File Name   :   RsDecodeForney.m
%   Abstract    :   Calculate error value with Forney method.
%    
%   Version     :   1.0
%**************************************************************************
function [ErrValueCalc, ErrPositionCalc] = RsDecodeForney(SyndromCalc, ErrPosPolyCalc, RootCalc)

global GF24 Rs
Parameter

ErrValueCalc = zeros(1,length(RootCalc));
ErrPositionCalc = zeros(1,length(RootCalc));
ErrValueTemp = zeros(1,length(RootCalc));
ErrPositionTemp = zeros(1,length(RootCalc));
if(length(RootCalc)==0)
    return;
end
%根据错误位置多项式的根，求得错误位置
if(length(RootCalc)>0)
    Pos = 1;
    for i = 1:1:length(RootCalc)
        RootRev = RsSymbolRev(RootCalc(i));
        if(RootRev ~= -1)  %当根为0时，定义其逆为-1
            ErrPositionTemp(Pos) = find(GF24.decimal==RootRev)-1;
            Pos = Pos + 1;
        end
    end
end

%错误数值多项式
PolyTemp = RsPolyMul(SyndromCalc,ErrPosPolyCalc);
ErrValuePoly = PolyTemp(1:2*Rs.t);

%根据Forney算法计算错误数值
Pos = 1;
if(length(RootCalc)>0)
    for i = 1:1:length(RootCalc)
        %分子
        ErrValueSum = ErrValuePoly(1,1);
        for j = 2:1:length(ErrValuePoly)
            Index = mod((find(GF24.decimal==RootCalc(i))-1)*(j-1),15)+1;
            ErrValueSum = RsSymbolAdd(ErrValueSum,RsSymbolMul(ErrValuePoly(j),GF24.decimal(Index)));
        end
        %分母（按照GF域上的微分特性进行化简）
        ErrPosDiffPoly = mod([2:1:length(ErrPosPolyCalc)]-1,2).*(ErrPosPolyCalc(2:end));
        ErrPosDiffSum = ErrPosDiffPoly(1,1);
        for j = 2:1:length(ErrPosDiffPoly)
            Index = mod((find(GF24.decimal==RootCalc(i))-1)*(j-1),15)+1;
            ErrPosDiffSum = RsSymbolAdd(ErrPosDiffSum,RsSymbolMul(ErrPosDiffPoly(j),GF24.decimal(Index)));
        end
        Temp = RsSymbolDiv(ErrValueSum,ErrPosDiffSum);
        if(Temp~=-1)  %当除法分母为0时，定义结果为-1
            ErrValueTemp(Pos) = Temp;
            Pos = Pos+1;
        end
    end
    %根据错误位置进行排序
    ErrPositionCalc = sort(ErrPositionTemp);
    ErrValueCalc = zeros(1,length(ErrPositionCalc));
    for i = 1:1:length(ErrPositionCalc)
        ErrValueCalc(i) = ErrValueTemp(find(ErrPositionTemp==ErrPositionCalc(i)));
    end
end