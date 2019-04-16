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
%���ݴ���λ�ö���ʽ�ĸ�����ô���λ��
if(length(RootCalc)>0)
    Pos = 1;
    for i = 1:1:length(RootCalc)
        RootRev = RsSymbolRev(RootCalc(i));
        if(RootRev ~= -1)  %����Ϊ0ʱ����������Ϊ-1
            ErrPositionTemp(Pos) = find(GF24.decimal==RootRev)-1;
            Pos = Pos + 1;
        end
    end
end

%������ֵ����ʽ
PolyTemp = RsPolyMul(SyndromCalc,ErrPosPolyCalc);
ErrValuePoly = PolyTemp(1:2*Rs.t);

%����Forney�㷨���������ֵ
Pos = 1;
if(length(RootCalc)>0)
    for i = 1:1:length(RootCalc)
        %����
        ErrValueSum = ErrValuePoly(1,1);
        for j = 2:1:length(ErrValuePoly)
            Index = mod((find(GF24.decimal==RootCalc(i))-1)*(j-1),15)+1;
            ErrValueSum = RsSymbolAdd(ErrValueSum,RsSymbolMul(ErrValuePoly(j),GF24.decimal(Index)));
        end
        %��ĸ������GF���ϵ�΢�����Խ��л���
        ErrPosDiffPoly = mod([2:1:length(ErrPosPolyCalc)]-1,2).*(ErrPosPolyCalc(2:end));
        ErrPosDiffSum = ErrPosDiffPoly(1,1);
        for j = 2:1:length(ErrPosDiffPoly)
            Index = mod((find(GF24.decimal==RootCalc(i))-1)*(j-1),15)+1;
            ErrPosDiffSum = RsSymbolAdd(ErrPosDiffSum,RsSymbolMul(ErrPosDiffPoly(j),GF24.decimal(Index)));
        end
        Temp = RsSymbolDiv(ErrValueSum,ErrPosDiffSum);
        if(Temp~=-1)  %��������ĸΪ0ʱ��������Ϊ-1
            ErrValueTemp(Pos) = Temp;
            Pos = Pos+1;
        end
    end
    %���ݴ���λ�ý�������
    ErrPositionCalc = sort(ErrPositionTemp);
    ErrValueCalc = zeros(1,length(ErrPositionCalc));
    for i = 1:1:length(ErrPositionCalc)
        ErrValueCalc(i) = ErrValueTemp(find(ErrPositionTemp==ErrPositionCalc(i)));
    end
end