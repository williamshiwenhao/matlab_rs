%*************************************************************************
%   Created     :   2010-6-3
%   Author      :   Shiqin Song(shiqinsac@gmail.com)
%   File Name   :   RsSymbolDiv.m
%   Abstract    :   Rs Symbol Division.
%    
%   Version     :   1.0
%**************************************************************************
function [Quotient] = RsSymbolDiv(LOperand, ROperand)

global GF24
Parameter

if(LOperand == 0)
    Quotient = 0;
elseif(ROperand == 0)  %当除法分母为0时，定义结果为-1
    Quotient = -1;
else
    LNum = mod(LOperand,16);
    RNum = mod(ROperand,16);
    LInd = find(GF24.decimal==LNum);
    RInd = find(GF24.decimal==RNum);
    Quotient = GF24.decimal(mod(LInd-RInd,15)+1,1);
end