%*************************************************************************
%   Created     :   2010-6-4
%   Author      :   Shiqin Song(shiqinsac@gmail.com)
%   File Name   :   RsPolyAdd.m
%   Abstract    :   Rs Polynomial Addition.
%    
%   Version     :   1.0
%**************************************************************************
function [PolySum] = RsPolyAdd(LPoly, RPoly)

MaxLen = max(length(LPoly),length(RPoly));    %将输入多项式转为一致长度
LPolyTemp = [LPoly zeros(1,MaxLen-length(LPoly))];
RPolyTemp = [RPoly zeros(1,MaxLen-length(RPoly))];
for i = 1:1:MaxLen
    PolySum(i) = RsSymbolAdd(LPolyTemp(i),RPolyTemp(i));
end