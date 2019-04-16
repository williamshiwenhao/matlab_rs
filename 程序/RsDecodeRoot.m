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
%�������ʽ������ݴΣ����������еĸ��ĸ���
Len = length(ErrPosPolyCalc);
for i = length(ErrPosPolyCalc):-1:1
    if(ErrPosPolyCalc(i)==0)
        Len = Len-1;
    end
end

if(Len == 0)
    return;
else
    %�ж�0�Ƿ��Ƕ���ʽ��һ����(�����ܳ����ظ�)
    RootCalc = zeros(0,0);
    if ((ErrPosPolyCalc(1) == 0))
        RootCalc = [0];
    end
    %�������(�����ܳ����ظ�)
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