%*************************************************************************
%   Created     :   2010-6-3
%   Author      :   Shiqin Song(shiqinsac@gmail.com)
%   File Name   :   RsSymbolRev.m
%   Abstract    :   Rs Symbol Reversion.
%    
%   Version     :   1.0
%**************************************************************************
function [Rev] = RsSymbolRev(Operand)

global GF24
Parameter

if(Operand == 0)
    Rev = -1;    %定义0的逆为-1
else
    Num = mod(Operand,16);
    Ind = find(GF24.decimal==Num);
    Rev = GF24.decimal(mod(15-(Ind-1),15)+1,1);
end