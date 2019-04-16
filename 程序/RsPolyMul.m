%*************************************************************************
%   Created     :   2010-6-4
%   Author      :   Shiqin Song(shiqinsac@gmail.com)
%   File Name   :   RsPolyMul.m
%   Abstract    :   Rs Polynomial Multiplication.
%    
%   Version     :   2.0
%**************************************************************************
function [PolyProduct] = RsPolyMul(LPoly, RPoly)

LLen = length(LPoly);
RLen = length(RPoly);
PolyProduct = zeros(1,LLen+RLen-1);  %����ʽ�˷��൱�ھ������
for i = 1:1:LLen
    for j = 1:1:RLen
        PolyProduct(i+j-1) = RsSymbolAdd(PolyProduct(i+j-1),RsSymbolMul(LPoly(i),RPoly(j)));
    end
end
% for i = LLen:-1:1  %������ʽĩ�˶����0��ȥ
%     if(LPoly(i)~=0)
%         break
%     end
% end
% LLen = i;
% LPolyTemp = LPoly(1:LLen);
% for i = RLen:-1:1
%     if(RPoly(i)~=0)
%         break;
%     end
% end
% RLen = i;
% RPolyTemp = RPoly(1:RLen);
% 
% PolyProduct = zeros(1,LLen+RLen-1);  %����ʽ�˷��൱�ھ������
% for i = 1:1:LLen
%     for j = 1:1:RLen
%         PolyProduct(i+j-1) = RsSymbolAdd(PolyProduct(i+j-1),RsSymbolMul(LPolyTemp(i),RPolyTemp(j)));
%     end
% end