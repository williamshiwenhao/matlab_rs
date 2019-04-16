%*************************************************************************
%   Created     :   2010-6-3
%   Author      :   Shiqin Song(shiqinsac@gmail.com)
%   File Name   :   RsSymbolMul.m
%   Abstract    :   Rs Symbol Miltiplication.
%    
%   Version     :   1.0
%**************************************************************************
function [Product] = RsSymbolMul(LOperand, ROperand)

global GF24
Parameter

if(LOperand == 0||ROperand == 0)
    Product = 0;
else
    LNum = mod(LOperand,16);
    RNum = mod(ROperand,16);
    LInd = find(GF24.decimal==LNum);
    RInd = find(GF24.decimal==RNum);
    Product = GF24.decimal(mod(LInd-1+RInd-1,15)+1,1);
end